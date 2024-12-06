import std/os/path
import std/os/env
import std/os/file
import std/text/regex
import help/lst
import help/maybe

fun main()
  val path = get-args()[0].unjust.path
  val text = read-text-file(path)
  val rgx = regex("mul\\(([0-9]*),([0-9]*)\\)")
  val matched = rgx.exec-all(text)
  matched
    .take-every(2)
    .map fn (m)
      val [_, a, b] = m
      val (x, y) = (a, b).map fn(i) i.string.parse-int.expect("string to parse")
      x * y
    .sum
