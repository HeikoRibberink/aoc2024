import help/aoc
import help/lst
import help/mat

fun main()
  val text = aoc/input()
  val accepted = ["MAS", "SAM"].map(list)
  val mat = 
    text
    .lines
    .map(list)
  fun is-x-mas(((i : int, j : int), c : char))
    if c == 'A' then
      val main-d = mat.take-line((1, 1), (i - 1, j - 1), 3)
      val cross-d = mat.take-line((-1, 1), (i + 1, j - 1), 3)
      [main-d, cross-d]
      .map fn(l)
        accepted.contains(l)
      .foldl(True, (&&))
    else
      False
    
  mat
  .with-indices
  .map fn(l)
    l
    .keep-when(is-x-mas)
    .length
  .sum

