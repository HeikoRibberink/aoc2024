import std/os/file
import std/os/path
import help/str
import help/maybe
import help/lst

fun day2/parse(path: path) : <console,exn,fsys> list<list<int>>
  val file = read-text-file(path)
  val lines = file.str/split('\n').filter("")
  val matrix =
    lines.map fn(s)
      s.str/split(' ').map fn(i)
        i.parse-int.expect("int should parse")
  matrix

fun day2/is-safe(xs : list<int>)
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
  maxdiff && samedir
