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

fun check-rule(update : list<int>, rule : (int, int)) : bool
  update.lst/index-of fn(x)
    x == rule.fst
  .maybe/map fn(x)
    update.lst/index-of fn(y)
      y == rule.snd
    .map fn(y)
      x < y
  .flatten
  .default(True)
  
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
    if (rules.map fn(rule)
          update.check-rule(rule)
        .foldl1((&&))
        ) 
    then
      update[update.length / 2]
    else
      Nothing
  .filter(Nothing)
  .map(unjust)
  .sum

      
    
    


