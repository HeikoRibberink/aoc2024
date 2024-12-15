type direction
  North
  East
  South
  West

fun direction/(==)(a : direction, b : direction) : bool
  match (a, b)
    (North, North) -> True
    (East, East) -> True
    (South, South) -> True
    (West, West) -> True
    _ -> False

fun direction/delta(dir : direction) : (int, int)
  match dir
    North -> (-1, 0)
    East -> (0, 1)
    South -> (1, 0)
    West -> (0, -1)

fun direction/next(dir : direction) : direction
  match dir
    North -> East
    East -> South
    South -> West
    West -> North

fun direction/show(dir : direction) : string
  match dir 
    North -> "North"
    East -> "East"
    South -> "South"
    West -> "West"
