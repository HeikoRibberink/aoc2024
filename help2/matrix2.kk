// An efficient 2d matrix built upon vectors.

module matrix2

value struct idx
  i : int
  j : int

value struct matrix<a>
  n_rows : int
  n_cols : int
  data : vector<a>


