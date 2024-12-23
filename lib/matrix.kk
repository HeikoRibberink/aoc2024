module matrix

import help/lst
import help/exit
import help/util
import help/maybe

// An index into a matrix
pub value struct idx
  i : int
  j : int

pub fun idx/(==)(a : idx, b : idx) : bool
  a.i == b.i && a.j == b.j

pub fun idx/(+)(a : idx, b : idx) : idx
  Idx(a.i + b.i, a.j + b.j)

pub fun idx/int(idx : idx, cols : int) : int
  idx.i * cols + idx.j

pub fun idx/show(idx : idx) : string
  "Idx(" ++ idx.i.show ++ ", " ++ idx.j.show ++ ")"

pub fun int/idx(i : int, cols : int) : idx
  Idx(i / cols, i % cols)

pub fun intpair/idx((i, j) : (int, int)) : idx
  Idx(i, j)


// An efficient 2d matrix built upon vectors.
pub value struct matrix<a>
  rows : int
  cols : int
  data : vector<a>

pub fun listlist/matrix(ll : list<list<a>>) : maybe<matrix<a>>
  with exit-nothing
  val rows = ll.length
  val cols = ll[0].else-exit.length
  val len = rows * cols
  val flattened = ll.concat
  if flattened.length != len then
    exit(())
  else
    Matrix(rows, cols, flattened.vector)

pub fun @index(^mat : matrix<a>, ^idx : idx) : exn a
  mat.at(idx).expect(idx.show ++ " to be in bounds.")

pub fun at(^mat : matrix<a>, ^idx : idx) : maybe<a>
  val Idx(r, c) = idx
  if r >= 0 && r < mat.rows && c >= 0 && c < mat.rows then
    val i = idx.int(mat.cols)
    mat.data.at(i)
  else 
    Nothing

pub fun set(mat : matrix<a>, idx : idx, new : a) : _ matrix<a>
  var data := mat.data
  data[idx.int(mat.cols)] := new
  mat(data = data)

pub fun show(mat : matrix<a>, ?show : a -> e string) : e string
  var total := ""
  mat.foreach-indexed fn(idx, elem)
    val str = mask<local<_>>{show(elem)}
    match idx
      Idx(_, w) | w == mat.cols - 1 ->
        total := total ++ str ++ "\n"
      Idx(_, _) ->
        total := total ++ str
  total
  
pub fun foreach-indexed(^mat : matrix<a>, ^f : (idx, a) -> _ ())
  mat.data.foreach-indexed fn(i, e)
    f(i.idx(mat.cols), e)
  
pub fun map-indexed(^mat : matrix<a>, ^f : (idx, a) -> e b) : e matrix<b>
  var flat-idx := 0
  val new-data = 
    mat.data.vector/map fn(e)
      val idx = flat-idx.idx(mat.cols)
      flat-idx := flat-idx + 1
      mask<local<_>>
        f(idx, e)
  Matrix(mat.rows, mat.cols, new-data)

// Create a `matrix<char>` from `text`, consisting of multiple lines.
pub fun charlistlist/parse(text : string) : maybe<matrix<char>>
  text
  .lines
  .map(list)
  .lst/filter([])
  .matrix
