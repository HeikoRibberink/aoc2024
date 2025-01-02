module indexed

pub linear effect indexed<i>
  fun index() : i
  fun next() : ()

pub fun index-in(indexable : a, ?into-indexer : a -> e (int -> e i), action : () -> <indexed<i>|e> b) : e b
  val indexer = mask<local<_>> {into-indexer(indexable)}
  var i := 0
  with handler
    fun index()
      val temp = i
      mask<local<_>>{indexer(temp)}
    fun next()
      i := i + 1
  action()
