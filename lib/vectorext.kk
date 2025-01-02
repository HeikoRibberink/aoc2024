import std/core/undiv

pub fun foldl(^v : vector<_>, s, ^f, i : int = 0)
  match v.at(i)
    Nothing -> s
    Just(e) ->
      val n = f(s, e)
      foldl(v, n, f, pretend-decreasing(i + 1))

pub fun show(v : vector<a>, ?show : a -> _ string) : _ string
  if v.length > 0 then
    val mapped = v.map(show)
    val middle = mapped.foldl(mapped[0], i = 1) fn(s, x)
      s ++ ", " ++ x
    "[" ++ middle ++ "]"
  else
    "[]"

    
     
