import lst
import maybe

fun take-line(mat : list<list<a>>, step : (int, int), start : (int, int), n : int = -1): div list<a>
  if n == 0 then
    Nil
  else
    val (r, c) = start
    val (dr, dc) = step
    val v = match mat[r]
      Nothing -> Nothing
      Just(m) -> m[c]
    match v
      Nothing -> Nil
      Just(x) -> 
        Cons(x, mat.take-line(step, (r + dr, c + dc), n - 1))
   

fun with-indices(mat : list<list<a>>, start : (int, int) = (0, 0)) : list<list<((int, int), a)>>
  mat
  .with-index
  .map fn((i, l))
    l.with-index.map fn((j, e))
      ((i, j), e)

fun mat/at(mat : list<list<a>>, cs : (int, int)) : maybe<a>
  val (i, j) = cs
  if i < 0 || j < 0 then
    Nothing
  else
    with try-or-maybe
    val row : list<_> = mat[i].unjust
    row[j].unjust
