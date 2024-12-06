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
