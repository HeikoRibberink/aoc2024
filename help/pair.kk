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

fun intpair/cmp((a1, b1) : (int, int), (a2, b2) : (int, int)) : order
  if a1 > a2 then
    Gt
  else if a1 < a2 then
    Lt
  else if b1 > b2 then
    Gt
  else if b1 < b2 then
    Lt
  else
    Eq

fun intpair/(+)(p1 : (int, int), p2 : (int, int)) : (int, int)
  val (a1, b1) = p1
  val (a2, b2) = p2
  (a1 + a2, b1 + b2)

fun intpair/(~)((a, b) : (int, int)) : (int, int)
  (~a, ~b)

fun intpair/(-)(p1 : (int, int), p2 : (int, int)) : (int, int)
  p1 + ~p2

fun intpair/int((i, j) : (int, int), width : int) : int
  i * width + j
