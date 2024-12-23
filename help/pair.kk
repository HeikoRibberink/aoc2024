import lst

fun pair/map(p : (a, a), f : a -> e b) : e (b, b)
  val (x, y) = p
  (f(x), f(y))

fun pair/to-pair(xx : list<a>) : maybe<(a, a)>
  match xx
    Cons(x, Cons(y, Nil)) -> Just((x, y))
    _ -> Nothing

fun pairlist/zip(p)
  val (a, b) = p
  lst/zip(a, b)

fun intpair/(+)(p1 : (int, int), p2 : (int, int)) : (int, int)
  val (a1, b1) = p1
  val (a2, b2) = p2
  (a1 + a2, b1 + b2)

fun intpair/int((i, j) : (int, int), width : int) : int
  i * width + j
