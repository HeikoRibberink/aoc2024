import help/aoc
import help/lst
import day7

fun concat-ints(s : int, x : int)
  val digits = x.count-digits
  s * (10 ^ digits) + x

type operator
  Add
  Mul
  Concat

effect ctl choice() : operator

val choice-all = handler
  return(x) [x]
  ctl choice() resume(Add) ++ resume(Mul) ++ resume(Concat)
  
fun try-sum(Data(total, vals) : data)
  with choice-all
  vals.foldl1 fn(s, x)
    match choice()
      Add -> s + x
      Mul -> s * x
      Concat -> concat-ints(s, x)
  == total

fun main()
  val text = aoc/input()
  val data = text.parse()
  data.keep-when fn(d)
    d.try-sum().foldl(False, (||))
  .map(total)
  .sum

      

