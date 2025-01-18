import help/maybe

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

fun lst/qsort(xs : list<a>, ^?(<) : (a, a) -> bool) : div list<a>
  match xs
    Nil -> Nil
    Cons(x, Nil) -> [x]
    Cons(x, xs) -> 
      val (l, r) = xs.lst/partition fn(y) y < x
      l.qsort ++ Cons(x, r.qsort)

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

fun lst/filter-when(xs : list<a>, ^pred : a -> e bool) : e list<a>
  match xs
    Nil -> Nil
    Cons(x, xs) -> if pred(x) then 
      xs.filter-when(pred) 
    else
      Cons(x, xs.filter-when(pred))

fun lst/filter(xs : list<a>, y : a, ?(==) : (a, a) -> bool) : list<a>
  match xs
    Nil -> Nil
    Cons(x, xs) | x == y -> xs.filter(y)
    Cons(x, xs) -> Cons(x, xs.filter(y))

fun lst/keep-when(xs : list<a>, ^pred : a -> e bool) : e list<a>
  xs.filter-when fn(a)
    not(pred(a))

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

fun take-every(xs : list<a>, n : int, start : int = 1) : list<a>
  match xs
    Nil -> Nil
    Cons(x, xs) ->
      if start % n == 0 then
        Cons(x, xs.take-every(n, start + 1))
      else
        xs.take-every(n, start + 1)
  

fip fun with-index(xs : list<a>, i : int = 0) : list<(int, a)>
  match xs
    Nil -> Nil
    Cons(x, xs) ->
      Cons((i, x), xs.with-index(i + 1))

fbip fun contains(xs : list<a>, ex : a, ^?(==) : (a, a) -> bool) : bool
  match xs
    Cons(x, _) | ex == x -> True
    Cons(_, xs) -> xs.contains(ex)
    _ -> False

type insert-result<a>
  Success(set : list<a>)
  Failure(set : list<a>, elem : a)

fip(1) fun insert-result/cons(res, e)
  match res
    Success(set) -> Success(Cons(e, set))
    Failure(set, elem) -> Failure(Cons(e, set), elem)
  

fun insert-unique(xs : list<a>, elem : a, ^?cmp : (a, a) -> order) : insert-result<a>
  match xs
    Nil -> Success(Cons(elem, Nil))
    Cons(current, tail) -> 
      if current == elem then
        Failure(Cons(current, tail), elem)
      else
        insert-unique(tail, elem).cons(current)
          
  

fbip fun index-of(xs : list<a>, ^pred : a -> e bool, n : int = 0) : e maybe<int>
  match xs
    Nil -> Nothing
    Cons(x, xs) -> 
      if pred(x) then
        Just(n) 
      else 
        xs.index-of(pred, n + 1)

fip fun map-at(xs : list<a>, i : int, ^f : a -> e a) : e list<a>
  match xs
    xs | i < 0 -> xs
    Nil -> Nil
    Cons(x, xs) | i == 0 -> Cons(f(x), xs)
    Cons(x, xs) -> Cons(x, xs.map-at(i - 1, f))

fun set(xs : list<a>, i : int, new : a) : _ list<a>
  fun const(_)
    new
  xs.map-at(i, const)

fun swap(xs : list<a>, i : int, j : int) : _ maybe<list<a>>
  xs[i].map fn(a)
    xs[j].map fn(b)
      xs
      .set(i, b)
      .set(j, a)
  .flatten

fun categorize(l, max : int, ^categorizer : _ -> _ int)
  var cats := vector(max, Nil)
  fun help(xs)
    match xs
      Nil -> ()
      Cons(x, xs) ->
        val cat = mask<local<_>> {categorizer(x)}
        val tail = cats
          .at(cat)
          .expect("categorize to index between 0 and " ++ max.show ++ " inclusive, but was " ++ cat.show)
        cats[cat] := Cons(x, tail)
        help(xs)
  help(l)
  cats
        
fun unique(xs : list<a>, ^?cmp : (a, a) -> order) : _ list<a>
  match xs
    Nil -> Nil
    Cons(x, xs) ->
      val u = xs.unique()
      match u.insert-unique(x)
        Success(set) -> set
        Failure(set, _) -> set

// Calculates the cartesian product of `xs` and `ys`
fun product(xs : list<a>, ys : list<b>) : list<(a, b)>
  match xs
    Nil -> Nil
    Cons(x, xs) ->
      val paired = ys.map fn(e)
        (x, e)
      paired ++ product(xs, ys)

fun self/product(xs : list<a>) : list<(a, a)>
  product(xs, xs)

fun self/unique-pairs(xs : list<a>) : list<(a, a)>
  match xs
    Nil -> Nil
    Cons(x, xs) ->
      val paired = xs.map fn(e)
        (x, e)
      paired ++ unique-pairs(xs)
