import help/lst
import help/mat
import help/aoc
import lib/vectorext
fun main()
  val text = aoc/input()
  val board = text.lines.map(list)
  val unique = board.concat.unique
  val boards =
    board
    .with-indices
    .concat
    .filter fn((_, x))
      x != '.'
    .categorize(unique.length - 1) fn((_, x))
      unique.index-of fn(y)
        x == y
  boards.vectorext/show
