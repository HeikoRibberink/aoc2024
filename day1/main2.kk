import std/os/env
import std/os/path
import std/os/file
import help/lst
import day1

fun main()
  val path = get-args()[0].unjust.path
  val int-pairs = day1/get-int-pairs(path)
  val (l, r) = int-pairs.lst/unzip
  l.map fn(x)
    r.count fn(y)
      x == y
    * x
  .sum

