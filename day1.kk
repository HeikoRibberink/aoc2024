fun min(xs : list<int>) : maybe<int>
  match xs
    Nil -> Nothing
    Cons(x, Nil) ->
      Just (x)
    Cons(x, xs) -> min(xs).map fn(y)
      min(x, y)

fun partition_h(xs : list<a>, pred : (a) -> e bool, aux1 : list<a> = [], aux2 : list<a> = []) : e (list<a>, list<a>)
  match xs
    Nil -> (aux1, aux2)
    Cons(x, xs) -> if pred(x) then 
      xs.partition_h(pred, Cons(x, aux1), aux2) 
    else 
      xs.partition_h(pred, aux1, Cons(x, aux2))

fun qsort(xs: list<a>) : list<a>
  match xs
    Nil -> Nil
    Cons(x, Nil) -> [x]
    Cons(x, xs) -> 
      val (l, r) = partition_h(xs)

  
  
fun sort(xs)
  xs

fun main()
  val test = [1, 5, 6, 3, 4, 2]
  test.sort.println
