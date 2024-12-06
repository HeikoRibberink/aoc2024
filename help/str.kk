import lst

fun str/split(s : string, sep : char)
  s.list.split-when (fn(x) x == sep).map(listchar/string)

