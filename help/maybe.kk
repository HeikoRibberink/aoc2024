fun expect(m: maybe<a>, msg: string): exn a
  match m
    Just(a) -> a
    Nothing -> throw("Expected `" ++ msg ++ "`")

fun flatten(m: maybe<maybe<a>>) : maybe<a>
  match m
    Nothing -> Nothing
    Just(Nothing) -> Nothing
    Just(Just(x)) -> Just(x)

// Handler that catches an expection, turning it into a `Nothing`.
val try-or-maybe = handler
  final ctl throw-exn(exn) Nothing
  return(a) Just(a)
