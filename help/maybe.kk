fun expect(m: maybe<a>, msg: string): exn a
  match m
    Just(a) -> a
    Nothing -> throw("Expected `" ++ msg ++ "`")

fun flatten(m: maybe<maybe<a>>) : maybe<a>
  match m
    Nothing -> Nothing
    Just(Nothing) -> Nothing
    Just(Just(x)) -> Just(x)
