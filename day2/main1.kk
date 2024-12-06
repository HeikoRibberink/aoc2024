import std/os/path
import std/os/env
import day2
import help/lst

fun main()
  val path = env/get-args()[0].unjust.path
  val matrix = day2/parse(path)
  matrix
    .map fn(xs)
      // List of pairwise differences
      val diff =
        xs
        .windowed
        .map fn((a, b))
          b - a
      // Whether the differenences are in [1, 3]
      val maxdiff =
        diff.map fn(i)
          val a = i.abs
          a >= 1 && a <= 3
        .foldl(True, (&&))
      // Whether the range is all in- or decreasing
      val samedir = 
        diff
          .map(sign)
          .all-equal
      // Combine that into an int
      if maxdiff && samedir then 1 else 0
    .sum
