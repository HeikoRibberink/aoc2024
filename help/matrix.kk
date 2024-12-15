import maybe
import util
import lst

alias idx = (int, int)

alias matrix<a> = vector<vector<a>>

fun matrix/@index(^mat : matrix<a>, cs : (int, int)) : maybe<a>
  val (i, j) = cs
  if i < 0 || j < 0 then
    Nothing
  else
    with try-or-maybe
    mat[i][j]

fun matrix/matrix-init(rows : int, cols : int, f : idx -> e a) : e matrix<a>
  vector-init(rows) fn(i)
    vector-init(cols) fn(j)
      f((i, j))

fun matrix/size(mat : matrix<a>) : exn (int, int)
  (mat.length, mat[0].length)

fun matrix/set(^mat : matrix<a>, idx : idx, new : a) : _ matrix<a>
  val (rows, cols) = mat.size
  vector-init(rows) fn(i)
    vector-init(cols) fn(j)
      if (i, j) == idx then
        new
      else
        mat[(i, j)].expect("Index " ++ (i, j).show ++ " out of bounds.")

// Create a `matrix<char>` from `text`, consisting of multiple lines.
fun charmatrix/parse(text : string) : matrix<char>
  text
  .lines
  .map(list)
  .lst/filter([])
  .map(vector)
  .vector

// Convert `mat` to a string using `?show`.
fun matrix/show(mat : matrix<a>, ?show : a -> string) : string
  mat.map fn(row)
    row.map(show)
    .vectorsep/join(" ")
  .vectorsep/join("\n")

effect ctl found(i : int, j : int) : ()

fun matrix/get-location(mat : matrix<a>, pred : a -> e bool) : e maybe<idx>
  with handler
    ctl found(i, j)
      Just((i, j))
    return(x : ()) Nothing
  mat.vector/foreach-indexed fn(i, row)
    row.vector/foreach-indexed fn(j, elem)
      if mask<found>{ pred(elem) } then
        found(i, j)

fun matrix/map-lexical-indexed(mat : matrix<a>, f : (idx, a) -> e b) : e matrix<b>
  with counter(0)
  mat.map fn(row)
    val i = increment()
    with mask<counter>
    with counter(0)
    row.map fn(elem)
      val j = increment()
      with mask<counter>
      f((i, j), elem)

