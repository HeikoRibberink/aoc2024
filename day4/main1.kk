import std/os/path
import std/os/env
import std/os/file
import help/aoc
import help/str
import help/mat
import help/lst

fun main()
  val text = aoc/input()
  val dirs = [
    (0, 1),
    (1, 1),
    (1, 0),
    (1, -1),
    (0, -1),
    (-1, -1),
    (-1, 0),
    (-1, 1)
  ]
  val mat = 
    text
    .lines()
    .map(list)
  val xmas = "XMAS".string/list
  mat
  // Add indices to the matrix
  .with-indices
  .map fn(l)
    // Take only 'X'
    l.filter-when fn((_, c))
      c != 'X'
    // Use the indices of each 'X'
    .map fn((pos, _))
      // For each direction
      dirs.map fn(del)
        // Build a matrix of lines from `mat1`
        mat.take-line(del, pos, 4)
        // Then compare those lines to `xmas`
        == xmas
      .map(int)
      .sum
    .sum
  .sum
