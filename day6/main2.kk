import help/aoc
import help/matrix
import help/util
import help/lst
import help/dir
import help/pair
import help/maybe
import day6

effect game
  ctl mark() : ()
  ctl facing() : tile
  fun step() : ()
  fun rotate() : ()

fun detect-cycle(board : matrix<tile>, start : idx, action : () -> _ ()) : _ bool
  var dir := North
  var pos := start
  var marked := Nil
  with handler
    ctl mark()
      val mark = (pos, dir)
      if marked.contains(mark) then
        True
      else
        marked := Cons(mark, marked)
        resume(())
    ctl facing()
      val p2 = pos + dir.delta
      val t = board[p2]
      match t
        Just(x) -> resume(x)
        Nothing -> False
    fun step()
      pos := pos + dir.delta
    fun rotate()
      dir := dir.next
    return(_) False
  action()

fun main()
  val text = aoc/input()
  val (guard, board) = text.parse-state
  with counter(0)
  val positions = 
    board.foreach-indexed fn(i, row)
      row.foreach-indexed fn(j, _)
        val idx = (i, j)
        if idx != guard then
          val cur-board = board.matrix/set(idx, Obstructed)
          val cycle = 
            with detect-cycle(cur-board, guard)
            while {True}
              mark()
              match facing()
                Obstructed ->
                  rotate()
                  step()
                Empty -> 
                  step()
          if cycle then
            increment()
            ()
        else
          ()
  positions.show
