import std/os/path
import std/os/env
import day2
import help/lst

fun main()
  val path = env/get-args()[0].unjust.path
  val matrix = day2/parse(path)
  matrix
    .map(day2/is-safe)
    .map fn (b)
      if b then 1 else 0
    .sum
    
