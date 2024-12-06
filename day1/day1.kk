import std/os/path
import std/os/file
import help/lst
import help/str
import help/pair

fun day1/get-int-pairs(path: path)
  val file = read-text-file(path)
  fun keep-ints(s) str/split(s, ' ').filter("")
  fun make-int-pairs(l) list/map(l, fn(s) s.parse-int.unjust).to-pair.unjust
  file
      .str/split('\n')
      .map (keep-ints)
      .filter([])
      .map (make-int-pairs)

