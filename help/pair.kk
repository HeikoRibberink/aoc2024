import aoc

fun pair/map(p : (a, a), f : a -> e b) : e (b, b)
  val (x, y) = p
  (f(x), f(y))

fun pair/to-pair(xx : list<a>) : maybe<(a, a)>
  match xx
    Cons(x, Cons(y, Nil)) -> Just((x, y))
    _ -> Nothing

fun pairlist/zip(p)
  val (a, b) = p
  aoc/zip(a, b)
