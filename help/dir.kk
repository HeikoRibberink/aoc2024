type dir
  North
  East
  South
  West

fun dir/(==)(a : dir, b : dir) : bool
  match (a, b)
    (North, North) -> True
    (East, East) -> True
    (South, South) -> True
    (West, West) -> True
    _ -> False

fun dir/delta(dir : dir) : (int, int)
  match dir
    North -> (-1, 0)
    East -> (0, 1)
    South -> (1, 0)
    West -> (0, -1)

fun dir/next(dir : dir) : dir
  match dir
    North -> East
    East -> South
    South -> West
    West -> North

fun dir/show(dir : dir) : string
  match dir 
    North -> "North"
    East -> "East"
    South -> "South"
    West -> "West"

fun dir/int(dir : dir) : int
  match dir
    North -> 0
    East -> 1
    South -> 2
    West -> 3
