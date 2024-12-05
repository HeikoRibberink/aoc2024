fun aoc/min(xs : list<int>) : maybe<int>
  match xs
    Nil -> Nothing
    Cons(x, Nil) ->
      Just (x)
    Cons(x, xs) -> aoc/min(xs).map fn(y)
      min(x, y)

fun aoc/partition(xs : list<a>, pred : a -> e bool, aux1 : list<a> = [], aux2 : list<a> = []) : e (list<a>, list<a>)
  match xs
    Nil -> (aux1, aux2)
    Cons(x, xs) -> if pred(x) then 
      xs.aoc/partition(pred, Cons(x, aux1), aux2) 
    else 
      xs.aoc/partition(pred, aux1, Cons(x, aux2))

fun aoc/qsort(xs : list<a>, ?(<) : (a, a) -> bool) : div list<a>
  match xs
    Nil -> Nil
    Cons(x, Nil) -> [x]
    Cons(x, xs) -> 
      val (l, r) = xs.aoc/partition fn(y) y < x
      l.qsort ++ [x] ++ r.qsort

fun aoc/zip(xs, ys)
  match (xs, ys)
    (Nil, _) -> Nil
    (_, Nil) -> Nil
    (Cons(x, xs), Cons(y, ys)) ->
      Cons((x, y), aoc/zip(xs, ys))

fun aoc/unzip(xys : list<(a, a)>) : (list<a>, list<a>)
  match xys
    Nil -> (Nil, Nil)
    Cons((x, y), xys) ->
      val (xs, ys) = xys.aoc/unzip
      (Cons(x, xs), Cons(y, ys))

fun aoc/split-when(xs : list<a>, pred : a -> e bool) : e list<list<a>>
  match xs
    Nil -> Cons(Nil, Nil)
    Cons(x, xs) ->
      match xs.split-when(pred)
        Cons(ys, yss) ->
          if pred(x) then
            Cons(Nil, Cons(ys, yss))
          else
            Cons(Cons(x, ys), yss)
        _ -> Nil

fun aoc/filter-when(xs : list<a>, pred : a -> e bool): e list<a>
  match xs
    Nil -> Nil
    Cons(x, xs) ->
      if pred(x) then
        xs.filter-when(pred)
      else
        Cons(x, xs.filter-when(pred))

fun aoc/filter(xs : list<a>, y : a, ?(==) : (a, a) -> bool) : list<a>
  xs.filter-when fn(e) e == y
