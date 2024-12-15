import help/matrix

alias pos = (int, int)

type tile
  Empty
  Obstructed

fun tile/show(t)
  match t
    Empty -> "."
    Obstructed -> "#"

fun parse-state(text : string) : _ (pos, matrix<tile>)
  var player := Nothing
  val mat = 
    text
    .charmatrix/parse
    .matrix/map-lexical-indexed fn(pos, elem)
        match elem
          '.' -> Empty
          '#' -> Obstructed
          '^' ->
            player := Just(pos)
            Empty
  val p = player.unjust
  (p, mat)
        
