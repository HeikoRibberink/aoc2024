module indexed

pub linear effect indexed<i>
  fun index() : i
  fun next() : ()

pub fun index-in(indexable : a, ?into-indexer : a -> (int -> i), action : () -> <indexed<i>|e> a) : e a
  var i := 0
  val indexer = into-indexer(indexable)
  with handler
    fun index()
      val temp = i
      mask<local<_>>{indexer(temp)}
    fun next()
      i := i + 1
  action()
