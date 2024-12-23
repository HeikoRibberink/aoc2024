import lib/matrix

type tile
  Empty
  Obstructed

fun tile/show(t)
  match t
    Empty -> "."
    Obstructed -> "#"

fun parse-state(text : string) : _ (idx, matrix<tile>)
  var player := Nothing
  val mat = 
    text
    .charlistlist/parse
    .unjust
    .matrix/map-indexed fn(pos, elem)
        match elem
          '.' -> Empty
          '#' -> Obstructed
          '^' ->
            player := Just(pos)
            Empty
  val p = player.unjust
  (p, mat)
        
