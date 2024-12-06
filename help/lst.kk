fun lst/min(xs : list<int>) : maybe<int>
  match xs
    Nil -> Nothing
    Cons(x, Nil) ->
      Just (x)
    Cons(x, xs) -> lst/min(xs).map fn(y)
      min(x, y)

tail fun lst/count(xs: list<a>, pred: a -> e bool): e int
  match xs
    Nil -> 0
    Cons(x, xs) ->
      val add = if pred(x) then 1 else 0
      add + count(xs, pred)

fun lst/partition(xs : list<a>, pred : a -> e bool, aux1 : list<a> = [], aux2 : list<a> = []) : e (list<a>, list<a>)
  match xs
    Nil -> (aux1, aux2)
    Cons(x, xs) -> if pred(x) then 
      xs.lst/partition(pred, Cons(x, aux1), aux2) 
    else 
      xs.lst/partition(pred, aux1, Cons(x, aux2))

fun lst/qsort(xs : list<a>, ?(<) : (a, a) -> bool) : div list<a>
  match xs
    Nil -> Nil
    Cons(x, Nil) -> [x]
    Cons(x, xs) -> 
      val (l, r) = xs.lst/partition fn(y) y < x
      l.qsort ++ [x] ++ r.qsort

fun lst/zip(xs, ys)
  match (xs, ys)
    (Nil, _) -> Nil
    (_, Nil) -> Nil
    (Cons(x, xs), Cons(y, ys)) ->
      Cons((x, y), lst/zip(xs, ys))

fun lst/unzip(xys : list<(a, b)>) : (list<a>, list<b>)
  match xys
    Nil -> (Nil, Nil)
    Cons((x, y), xys) ->
      val (xs, ys) = xys.lst/unzip
      (Cons(x, xs), Cons(y, ys))

fun lst/split-when(xs : list<a>, pred : a -> e bool) : e list<list<a>>
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

fun lst/filter-when(xs : list<a>, pred : a -> e bool): e list<a>
  match xs
    Nil -> Nil
    Cons(x, xs) ->
      if pred(x) then
        xs.filter-when(pred)
      else
        Cons(x, xs.filter-when(pred))

fun lst/filter(xs : list<a>, y : a, ?(==) : (a, a) -> bool) : list<a>
  xs.filter-when fn(e) e == y

// Let `xs` be `a0, a1, a2, ..., a(n-1) an`,
// then `windowed(xs)` is `(a0, a1), (a1, a2), ..., (a(n-1), an)`.
fun lst/windowed(xs : list<a>) : div list<(a, a)>
  match xs
    Cons(a, Cons(b, xs)) -> Cons((a, b), windowed(Cons(b, xs)))
    _ -> Nil

fun lst/all-equal(xs: list<a>, ?(==) : (a, a) -> bool)
  xs.windowed.map fn((a, b))
    a == b
  .foldl1((&&))

// Returns `xs` without the element at index `i`. If `i` is out of range, returns `xs`
fun without(xs : list<a>, i : int) : list<a>
  match xs
    Nil -> Nil
    Cons(x, xs) -> 
      if i == 0 then
        xs
      else
        Cons(x, xs.without(i - 1))
