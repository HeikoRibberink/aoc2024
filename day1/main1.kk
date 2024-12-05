import std/os/env
import std/os/path
import std/os/file
import help/aoc
import help/pair

fun str/split(s : string, sep : char)
  s.list.split-when (fn(x) x == sep).map(listchar/string)

fun main()
  val args = get-args()[0].unjust.path
  val file = read-text-file(args)
  fun keep-ints(s) str/split(s, ' ').filter("")
  fun make-int-pairs(l) list/map(l, fn(s) s.parse-int.unjust).to-pair.unjust
  val int-pairs = file
      .str/split('\n')
      .map (keep-ints)
      .filter([])
      .map (make-int-pairs)
  fun diff((x, y)) abs(x - y)
  val sorted = int-pairs.aoc/unzip.pair/map(fn (l) l.aoc/qsort).zip
  sorted.map(diff).sum

