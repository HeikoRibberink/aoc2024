effect counter
  fun increment() : int
  fun get() : int

fun counter(s : int, action : () -> <counter|e> a) : e a
  var i := s - 1
  with handler 
    fun increment()
      i := i + 1
      i
    fun get() 
      val i1 = i
      i1

  action()

