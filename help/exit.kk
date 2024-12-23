effect exit<a>
  final ctl exit(res : a) : b
  
// Allows exiting with an early result using `exit(result)`.
fun early-exit(action)
  with handler
    final ctl exit(res) res
  action()

// If `exit` is called, `Nothing` is returned, otherwise the result is wrapped in `Just`.
fun exit-nothing(action)
  with handler
    final ctl exit(_) Nothing
  action().Just

fun else-exit-with(x : maybe<a>, other : b) : exit<b> a
  match x
    Just(x) -> x
    Nothing ->
      exit(other)

fun else-exit(x : maybe<a>) : exit<()> a
  x.else-exit-with(())
