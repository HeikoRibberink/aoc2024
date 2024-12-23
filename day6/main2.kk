import help/control
import help/aoc
import help/lst
import help/dir
import help/util
import help/pair
import help/mat
import help/control
import help/matrix
import day6

alias idx = (int, int)
alias board = matrix<tile>

value struct guard
  pos : idx
  dir : dir

fun guard/(==)(a : guard, b : guard) : bool
  a.pos == b.pos && a.dir == b.dir

effect ctl mark(guard : guard) : ()

fun detect-mark-cycle(action) : _ bool
  var path : list<guard> := Nil
  with ctl mark(guard : guard)
    if path.contains(guard) then
      // Cycle detected
      True
    else
      path := Cons(guard, path)
      resume(())
  action()
  False

fun simulate-guard(board : board, guard : guard)
  var guard := guard
  early-exit
    while {True} 
      val front = guard.pos + guard.dir.delta
      match board[front].else-exit
        Empty -> 
          mark(guard)
          guard := guard(pos = front)
        Obstructed ->
          guard := guard(dir = guard.dir.next)
  guard
      

fun main()
  val text = aoc/input()
  val (guard, board) = parse-state(text)
  board.map-lexical-indexed fn(idx, _)
    val board = board.set(idx, Obstructed)
    with detect-mark-cycle
    simulate-guard(board, Guard(guard, North))
    println("Calculate " ++ idx.show)
  .show
  

