module day7

import help/util
import help/maybe
import help/lst

pub value struct data
  total : int
  vals : list<int>

pub fun data/show(data : data)
  "Data" ++ (data.total, data.vals).show()

pub fun parse-line(line : string) : _ data
  val [sum_text, vals_text] = line.split(": ")
  val vals = vals_text.split(" ").map fn(x)
    x.parse-int.expect("value to be an int")
  val sum = sum_text.parse-int().expect("sum to be an int.")
  Data(sum, vals)

pub fun parse(text : string) : _ list<data>
  text.lines().filter("").map(parse-line)
