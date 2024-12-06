import std/os/path
import std/os/env
import std/os/file

fun aoc/input()
  val path = get-args()[0].unjust.path
  read-text-file(path)
