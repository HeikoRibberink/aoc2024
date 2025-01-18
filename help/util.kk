effect counter
  fun increment() : int
  fun get() : int

fun counter(s : int, action : () -> <counter|e> a) : e a
  var i := s
  with handler 
    fun increment()
      val temp = i
      i := i + 1
      temp
    fun get() 
      i
  action()

fun todo(?kk-file-line : string) : exn a
  throw("TODO reached at " ++ kk-file-line)

fun inline-print(x, ?show)
  x.println
  x
  
fun peep(x, action)
  action(x)
  x
