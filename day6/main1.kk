import help/aoc
import help/util
import help/lst
import help/dir
import help/pair
import lib/matrix
import day6


effect board
  ctl facing() : tile
  fun step() : ()
  fun rotate() : ()
  fun mark() : ()

fun walker(board : matrix<tile>, start : idx, action : () -> <board|e> ()) : e _
  var marked := Nil
  var pos := start
  var dir : dir := North
  with handler
    ctl facing()
      val p2 = pos + dir.delta.idx
      val t = board.at(p2)
      match t
        Just(x) -> resume(x)
        Nothing -> length(marked) + 1
    fun step()
      pos := pos + dir.delta.idx
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
