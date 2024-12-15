import help/aoc
import help/matrix
import help/util
import help/lst
import help/dir
import help/pair

alias pos = (int, int)

type tile
  Empty
  Obstructed

fun tile/show(t)
  match t
    Empty -> "."
    Obstructed -> "#"

effect board
  ctl facing() : tile
  fun step() : ()
  fun rotate() : ()
  fun mark() : ()

fun parse-state(text : string) : _ (pos, matrix<tile>)
  var player := Nothing
  val mat = 
    text
    .charmatrix/parse
    .matrix/map-lexical-indexed fn(pos, elem)
        match elem
          '.' -> Empty
          '#' -> Obstructed
          '^' ->
            player := Just(pos)
            Empty
  val p = player.unjust
  (p, mat)
        
fun walker(board : matrix<tile>, start : pos, action : () -> <board|e> ()) : e _
  var marked := Nil
  var pos : pos := start
  var dir : direction := North
  with handler
    ctl facing()
      val p2 = pos + dir.delta
      val t = board[p2]
      match t
        Just(x) -> resume(x)
        Nothing -> length(marked) + 1
    fun step()
      pos := pos + dir.delta
    fun rotate()
      dir := dir.next
    fun mark()
      val m = marked
      if !m.lst/contains(pos) then
        marked := Cons(pos, marked)
    return(_)
      0
  action()
  
    
fun main()
  val text = aoc/input()
  val (start, board) = text.parse-state
  with walker(board, start)
  while {True}
    val t = facing()
    mark()
    match t
      Obstructed -> 
        rotate()
        step()
      Empty -> step()
