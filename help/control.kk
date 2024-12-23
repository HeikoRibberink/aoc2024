effect exit<a>
  final ctl exit(res : a) : b
  
fun early-exit(action)
  with handler
    final ctl exit(res) res
  action()

fun else-exit-with(x : maybe<a>, other : b) : exit<b> a
  match x
    Just(x) -> x
    Nothing ->
      exit(other)

fun else-exit(x : maybe<a>) : exit<()> a
  x.else-exit-with(())

