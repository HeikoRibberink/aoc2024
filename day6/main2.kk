import help/aoc
import help/lst
import help/dir
import help/util
import help/pair
import help/exit
import help/bitset
import lib/matrix
import lib/debug
import day6

alias board = matrix<tile>

value struct guard
  pos : idx
  dir : dir

fun guard/(==)(a : guard, b : guard) : bool
  a.pos == b.pos && a.dir == b.dir

fun guard/show(g : guard) : string
  "Guard(" ++ g.pos.show ++ ", " ++ g.dir.show ++ ")"

effect val dims : idx

fun guard/int(g : guard)
  g.dir.int * dims.i * dims.j + g.pos.i * dims.j + g.pos.j

fun guard/cardinality()
  dims.i * dims.j * 4

effect ctl mark(guard : guard) : ()

fun detect-mark-cycle(action) : _ bool
  val path = ref(bitset(guard/cardinality()))
  with ctl mark(guard : guard)
    if (!path).contains(guard) then
      // Cycle detected
      println("Cycle detected")
      True
    else
      path.insert(guard)
      resume(())
  action()
  False

fun simulate-guard(board : board, guard : guard)
  var guard := guard
  with try
  while {True} 
    val front : idx = guard.pos + guard.dir.delta.idx
    match board[front]
      Empty -> 
        mark(guard)
        guard := guard(pos = front)
      Obstructed ->
        guard := guard(dir = guard.dir.next)

fun main()
  with counter(0)
  val text = aoc/input()
  val (guard, board) = parse-state(text)
  with val dims = Idx(board.rows, board.cols)
  guard.println
  board.foreach-indexed fn(idx, _)
    idx.println
    if idx != guard then
      val board = board.set(idx, Obstructed)
      val cycles = detect-mark-cycle
        simulate-guard(board, Guard(guard, North))
      if cycles then
        increment().println
        ()
  get()

