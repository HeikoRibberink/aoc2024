import help/lst
import help/mat
import help/aoc
import help/pair
import help/util
import lib/vectorext
import lib/indexed

fun line-indices(rows : int, cols : int, start : (int, int), step : (int, int)) : _ list<(int, int)>
  // The numbers include the antennas, so we start at `start`
  var cur := start
  var l := Nil
  while {
    val (r, c) = cur  
    r >= 0 && r < rows && c >= 0 && c < cols
  } {
    l := Cons(cur, l)
    cur := cur + step
  }
  l
    

fun main()
  val text = aoc/input()
  val input = text.lines.map(list).filter([])
  val rows = input.length
  val cols = input[0].unjust.length
  val unique = input.concat.unique.filter('.').qsort
  val boards =
    input
    // Add indices
    .with-indices
    // Ensure it is exactly one list
    .concat
    // Remove each empty tile
    .filter fn((_, x))
      x != '.'
    // Split the board into frequencies
    .categorize(unique.length) fn((_, x))
      unique.index-of fn(y)
        x == y
    .map fn(board)
      board.map fn((idx, _))
        idx
  boards
  .map fn(board)
    val paired = board.unique-pairs
    paired
    .filter fn((a : (int, int), b))
      a != b
    .map fn((a, b))
      // Not very different from main1. Instead of taking only the two around
      // it, we use line-indices to take a line from the two antennas.
      val diff = b - a
      val forward = line-indices(rows, cols, b, diff)
      val backward = line-indices(rows, cols, a, ~diff)
      forward.append(backward)
    .concat
  .list
  .concat
  .lst/unique
  .length
  .show
  

