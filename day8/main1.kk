import help/lst
import help/mat
import help/aoc
import help/pair
import help/util
import lib/vectorext
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
      val diff = b - a
      [
        b + diff,
        a - diff
      ]
      .filter fn((r, c))
        r >= 0 && r < rows && c >= 0 && c < cols
    .concat
  .list
  .concat
  .lst/unique
  .length
  .show
  

