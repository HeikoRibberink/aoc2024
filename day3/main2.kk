import std/os/path
import std/os/env
import std/os/file
import std/text/regex
import help/lst
import help/maybe

fun main()
  val path = get-args()[0].unjust.path
  val text = read-text-file(path)
  val rgx = regex(r"(mul\(([0-9]*),([0-9]*)\))|(do\(\))|(don't\(\))")
  val matched = rgx.exec-all(text)
  var enable := True
  matched
  .take-every(2)
  .map fn(m)
    match m.map(string)
      [_, _, "", "", "do()", ""] -> 
        enable := True
        0
      [_, _, "", "", "", "don't()"] -> 
        enable := False
        0
      [_, _, a, b, _, _] ->
        if enable then
          val (x, y) = (a, b).map fn(s)
            s.parse-int.expect("int to parse")
          x * y
        else 
          0
  .sum
