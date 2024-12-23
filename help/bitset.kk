module bitset

pub alias bitset = vector<bool>

pub fun bitset(size : int) : bitset
  vector(size, False)

pub fun contains(set : bitset, ^x : a, ?int : a -> _ int)
  set[x.int]

pub fun insert(set : ref<_,bitset>, x : a, ?int : a -> _ int) : _ () 
  set.modify fn(s)
    val i = mask<local<_>>{mask<exn>{x.int}}
    s[i] := True

pub fun remove(set : ref<_,bitset>, x : a, ?int : a -> _ int) : _ () 
  set.modify fn(s)
    val i = mask<local<_>>{mask<exn>{x.int}}
    s[i] := False
