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

fun todo() : exn a
  throw("TODO reached.")
