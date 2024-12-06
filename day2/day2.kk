import std/os/file
import std/os/path
import help/str

fun day2/parse(path: path): <exn,fsys> list<list<int>>
  val file = read-text-file(path)
  val lines = file.str/split('\n')
  val matrix =
    lines.map fn(s)
      s.str/split(' ')
      .map fn(i)
        i.parse-int.unjust
  matrix
