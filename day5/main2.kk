import help/aoc
import help/lst
import help/maybe
import help/pair

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
  .expect("each list to be two elements")

fun get-indices(update : list<int>, rule : (int, int)) : maybe<(int, int)>
  update.lst/index-of fn(x)
    x == rule.fst
  .maybe/map fn(x)
    update.lst/index-of fn(y)
      y == rule.snd
    .map fn(y)
      (x, y)
  .flatten

fun check-rule(update : list<int>, rule : (int, int)) : bool
  update.get-indices(rule).map fn((x, y))
    x < y
  .default(True)

fun check-rules(update, rules)
  rules
  .map fn(rule)
    update
    .check-rule(rule)
  .foldl1((&&))

fun reorder(update : list<int>, rule : (int, int)) : _ list<int>
  match update.get-indices(rule)
    Just((i, j)) | i > j -> update.swap(i, j).unjust
    _ -> update
  
fun main()
  val text = aoc/input()

  val [rules_t, updates_t] = text
  .lines
  .split-when(is-empty)
  .filter([])

  val rules = rules_t
    .map(split-rule)
  val updates = 
    updates_t
    .map fn(l)
      l
      .string/split(",")
      .map fn(s)
        s.parse-int.unjust


  updates
  .map fn(update)
    if check-rules(update, rules) then
      Nothing
    else
      var update := update
      while{ !check-rules(update, rules) }
        update := rules.foldl(update) fn(update, rule)
          update.reorder(rule)
      update[update.length / 2]
  .map fn(m)
    m.maybe/default(0)
  .sum

