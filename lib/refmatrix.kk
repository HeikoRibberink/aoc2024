import matrix

pub value struct refmatrix<h,a>
  rows : int
  cols : int
  data : ref<h, vector<a>>

// pub fun matrix/ref(mat : matrix<a>) : alloc<h> refmatrix<h,a>
//   Refmatrix(mat.rows, mat.cols, ref(mat.data))

pub fun refmatrix/@index(^mat : refmatrix<h,a>, ^idx : idx) : <read<h>,pure> a
  val data = !mat.data
  data[idx.int(mat.cols)]

pub fun refmatrix/set(mat : refmatrix<h,a>, ^idx : idx, assigned : a) : <read<h>,write<h>,pure> ()
  mat.data.modify fn(d)
    d[idx.int(mat.cols)] := assigned 
    
