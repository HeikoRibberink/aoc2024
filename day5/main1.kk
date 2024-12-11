import help/aoc
import help/lst
import help/maybe
import help/pair

fun main()
  val text = aoc/input()

  val [rules, updates] = text
  .lines
  .split-when(is-empty)
  .filter([])

  fun split-rule(str : string)
    str
    .list
    .split-when fn(c)
      c == '|'
    .map fn(l)
      l
      .listchar/string
      .parse-int
      .expect("int to parse")
    .to-pair
    .unjust
  rules
  .map(split-rule)

