import help/aoc
import help/matrix
import help/util
import help/lst

alias pos = (int, int)

fun tuple2/(+)((a1, b1) : pos, (a2, b2) : pos) : pos
  (a1 + a2, b1 + b2)

type direction
  North
  East
  South
  West

fun direction/(==)(a : direction, b : direction) : bool
  match (a, b)
    (North, North) -> True
    (East, East) -> True
    (South, South) -> True
    (West, West) -> True
    _ -> False

fun direction/delta(dir : direction) : pos
  match dir
    North -> (-1, 0)
    East -> (0, 1)
    South -> (1, 0)
    West -> (0, -1)

fun direction/next(dir : direction) : direction
  match dir
    North -> East
    East -> South
    South -> West
    West -> North

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
    t.println
    mark()
    match t
      Obstructed -> 
        rotate()
        step()
      Empty -> step()
