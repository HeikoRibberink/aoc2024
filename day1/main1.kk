import std/os/env
import std/os/path
import std/os/file
import help/lst
import help/pair
import day1

fun main()
  val path = get-args()[0].unjust.path
  val int-pairs = day1/get-int-pairs(path)
  fun diff((x, y)) abs(x - y)
  val sorted = int-pairs.lst/unzip.pair/map(fn (l) l.lst/qsort).zip
  sorted.map(diff).sum

