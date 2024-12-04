// Koka generated module: day1, koka version: 3.1.2, platform: 64-bit
#include "day1.h"

kk_std_core_types__maybe kk_day1_min(kk_std_core_types__list xs, kk_context_t* _ctx) { /* (xs : list<int>) -> maybe<int> */ 
  if (kk_std_core_types__is_Nil(xs, _ctx)) {
    return kk_std_core_types__new_Nothing(_ctx);
  }
  {
    struct kk_std_core_types_Cons* _con_x75 = kk_std_core_types__as_Cons(xs, _ctx);
    kk_box_t _box_x0 = _con_x75->head;
    kk_std_core_types__list _pat_1 = _con_x75->tail;
    if (kk_std_core_types__is_Nil(_pat_1, _ctx)) {
      kk_integer_t x = kk_integer_unbox(_box_x0, _ctx);
      if kk_likely(kk_datatype_ptr_is_unique(xs, _ctx)) {
        kk_datatype_ptr_free(xs, _ctx);
      }
      else {
        kk_integer_dup(x, _ctx);
        kk_datatype_ptr_decref(xs, _ctx);
      }
      return kk_std_core_types__new_Just(kk_integer_box(x, _ctx), _ctx);
    }
  }
  {
    struct kk_std_core_types_Cons* _con_x76 = kk_std_core_types__as_Cons(xs, _ctx);
    kk_box_t _box_x2 = _con_x76->head;
    kk_std_core_types__list xs_0 = _con_x76->tail;
    kk_integer_t x_0 = kk_integer_unbox(_box_x2, _ctx);
    if kk_likely(kk_datatype_ptr_is_unique(xs, _ctx)) {
      kk_datatype_ptr_free(xs, _ctx);
    }
    else {
      kk_integer_dup(x_0, _ctx);
      kk_std_core_types__list_dup(xs_0, _ctx);
      kk_datatype_ptr_decref(xs, _ctx);
    }
    kk_std_core_types__maybe m_10000 = kk_day1_min(xs_0, _ctx); /*maybe<int>*/;
    if (kk_std_core_types__is_Nothing(m_10000, _ctx)) {
      kk_integer_drop(x_0, _ctx);
      return kk_std_core_types__new_Nothing(_ctx);
    }
    {
      kk_box_t _box_x3 = m_10000._cons.Just.value;
      kk_integer_t x_1 = kk_integer_unbox(_box_x3, _ctx);
      kk_integer_dup(x_1, _ctx);
      kk_std_core_types__maybe_drop(m_10000, _ctx);
      kk_integer_t _b_x4_6;
      bool _match_x71 = kk_integer_lte_borrow(x_0,x_1,kk_context()); /*bool*/;
      if (_match_x71) {
        kk_integer_drop(x_1, _ctx);
        _b_x4_6 = x_0; /*int*/
      }
      else {
        kk_integer_drop(x_0, _ctx);
        _b_x4_6 = x_1; /*int*/
      }
      return kk_std_core_types__new_Just(kk_integer_box(_b_x4_6, _ctx), _ctx);
    }
  }
}
 
// monadic lift

kk_std_core_types__tuple2 kk_day1__mlift_partition__h_10014(kk_std_core_types__optional aux1, kk_std_core_types__optional aux2, kk_function_t pred, kk_box_t x, kk_std_core_types__list xs_0, bool _y_x10009, kk_context_t* _ctx) { /* forall<a,e> (aux1 : ? (list<a>), aux2 : ? (list<a>), pred : (a) -> e bool, x : a, xs@0 : list<a>, bool) -> e (list<a>, list<a>) */ 
  if (_y_x10009) {
    kk_std_core_types__optional _x_x77;
    kk_box_t _x_x78;
    kk_std_core_types__list _x_x79;
    kk_std_core_types__list _x_x80;
    if (kk_std_core_types__is_Optional(aux1, _ctx)) {
      kk_box_t _box_x7 = aux1._cons._Optional.value;
      kk_std_core_types__list _uniq_aux1_100_0 = kk_std_core_types__list_unbox(_box_x7, KK_BORROWED, _ctx);
      kk_std_core_types__list_dup(_uniq_aux1_100_0, _ctx);
      kk_std_core_types__optional_drop(aux1, _ctx);
      _x_x80 = _uniq_aux1_100_0; /*list<195>*/
    }
    else {
      kk_std_core_types__optional_drop(aux1, _ctx);
      _x_x80 = kk_std_core_types__new_Nil(_ctx); /*list<195>*/
    }
    _x_x79 = kk_std_core_types__new_Cons(kk_reuse_null, 0, x, _x_x80, _ctx); /*list<1024>*/
    _x_x78 = kk_std_core_types__list_box(_x_x79, _ctx); /*1003*/
    _x_x77 = kk_std_core_types__new_Optional(_x_x78, _ctx); /*? 1003*/
    kk_std_core_types__optional _x_x81;
    kk_box_t _x_x82;
    kk_std_core_types__list _x_x83;
    if (kk_std_core_types__is_Optional(aux2, _ctx)) {
      kk_box_t _box_x9 = aux2._cons._Optional.value;
      kk_std_core_types__list _uniq_aux2_106_0 = kk_std_core_types__list_unbox(_box_x9, KK_BORROWED, _ctx);
      kk_std_core_types__list_dup(_uniq_aux2_106_0, _ctx);
      kk_std_core_types__optional_drop(aux2, _ctx);
      _x_x83 = _uniq_aux2_106_0; /*list<195>*/
    }
    else {
      kk_std_core_types__optional_drop(aux2, _ctx);
      _x_x83 = kk_std_core_types__new_Nil(_ctx); /*list<195>*/
    }
    _x_x82 = kk_std_core_types__list_box(_x_x83, _ctx); /*1003*/
    _x_x81 = kk_std_core_types__new_Optional(_x_x82, _ctx); /*? 1003*/
    return kk_day1_partition__h(xs_0, pred, _x_x77, _x_x81, _ctx);
  }
  {
    kk_std_core_types__optional _x_x84;
    kk_box_t _x_x85;
    kk_std_core_types__list _x_x86;
    if (kk_std_core_types__is_Optional(aux1, _ctx)) {
      kk_box_t _box_x11 = aux1._cons._Optional.value;
      kk_std_core_types__list _uniq_aux1_100_1 = kk_std_core_types__list_unbox(_box_x11, KK_BORROWED, _ctx);
      kk_std_core_types__list_dup(_uniq_aux1_100_1, _ctx);
      kk_std_core_types__optional_drop(aux1, _ctx);
      _x_x86 = _uniq_aux1_100_1; /*list<195>*/
    }
    else {
      kk_std_core_types__optional_drop(aux1, _ctx);
      _x_x86 = kk_std_core_types__new_Nil(_ctx); /*list<195>*/
    }
    _x_x85 = kk_std_core_types__list_box(_x_x86, _ctx); /*1003*/
    _x_x84 = kk_std_core_types__new_Optional(_x_x85, _ctx); /*? 1003*/
    kk_std_core_types__optional _x_x87;
    kk_box_t _x_x88;
    kk_std_core_types__list _x_x89;
    kk_std_core_types__list _x_x90;
    if (kk_std_core_types__is_Optional(aux2, _ctx)) {
      kk_box_t _box_x13 = aux2._cons._Optional.value;
      kk_std_core_types__list _uniq_aux2_106_1 = kk_std_core_types__list_unbox(_box_x13, KK_BORROWED, _ctx);
      kk_std_core_types__list_dup(_uniq_aux2_106_1, _ctx);
      kk_std_core_types__optional_drop(aux2, _ctx);
      _x_x90 = _uniq_aux2_106_1; /*list<195>*/
    }
    else {
      kk_std_core_types__optional_drop(aux2, _ctx);
      _x_x90 = kk_std_core_types__new_Nil(_ctx); /*list<195>*/
    }
    _x_x89 = kk_std_core_types__new_Cons(kk_reuse_null, 0, x, _x_x90, _ctx); /*list<1024>*/
    _x_x88 = kk_std_core_types__list_box(_x_x89, _ctx); /*1003*/
    _x_x87 = kk_std_core_types__new_Optional(_x_x88, _ctx); /*? 1003*/
    return kk_day1_partition__h(xs_0, pred, _x_x84, _x_x87, _ctx);
  }
}


// lift anonymous function
struct kk_day1_partition__h_fun99__t {
  struct kk_function_s _base;
  kk_std_core_types__optional aux1_0;
  kk_std_core_types__optional aux2_0;
  kk_function_t pred_0;
  kk_box_t x_0;
  kk_std_core_types__list xs_0_0;
};
static kk_box_t kk_day1_partition__h_fun99(kk_function_t _fself, kk_box_t _b_x24, kk_context_t* _ctx);
static kk_function_t kk_day1_new_partition__h_fun99(kk_std_core_types__optional aux1_0, kk_std_core_types__optional aux2_0, kk_function_t pred_0, kk_box_t x_0, kk_std_core_types__list xs_0_0, kk_context_t* _ctx) {
  struct kk_day1_partition__h_fun99__t* _self = kk_function_alloc_as(struct kk_day1_partition__h_fun99__t, 8, _ctx);
  _self->_base.fun = kk_kkfun_ptr_box(&kk_day1_partition__h_fun99, kk_context());
  _self->aux1_0 = aux1_0;
  _self->aux2_0 = aux2_0;
  _self->pred_0 = pred_0;
  _self->x_0 = x_0;
  _self->xs_0_0 = xs_0_0;
  return kk_datatype_from_base(&_self->_base, kk_context());
}

static kk_box_t kk_day1_partition__h_fun99(kk_function_t _fself, kk_box_t _b_x24, kk_context_t* _ctx) {
  struct kk_day1_partition__h_fun99__t* _self = kk_function_as(struct kk_day1_partition__h_fun99__t*, _fself, _ctx);
  kk_std_core_types__optional aux1_0 = _self->aux1_0; /* ? (list<195>) */
  kk_std_core_types__optional aux2_0 = _self->aux2_0; /* ? (list<195>) */
  kk_function_t pred_0 = _self->pred_0; /* (195) -> 196 bool */
  kk_box_t x_0 = _self->x_0; /* 195 */
  kk_std_core_types__list xs_0_0 = _self->xs_0_0; /* list<195> */
  kk_drop_match(_self, {kk_std_core_types__optional_dup(aux1_0, _ctx);kk_std_core_types__optional_dup(aux2_0, _ctx);kk_function_dup(pred_0, _ctx);kk_box_dup(x_0, _ctx);kk_std_core_types__list_dup(xs_0_0, _ctx);}, {}, _ctx)
  bool _y_x10009_0_40 = kk_bool_unbox(_b_x24); /*bool*/;
  kk_std_core_types__tuple2 _x_x100 = kk_day1__mlift_partition__h_10014(aux1_0, aux2_0, pred_0, x_0, xs_0_0, _y_x10009_0_40, _ctx); /*(list<195>, list<195>)*/
  return kk_std_core_types__tuple2_box(_x_x100, _ctx);
}

kk_std_core_types__tuple2 kk_day1_partition__h(kk_std_core_types__list xs, kk_function_t pred_0, kk_std_core_types__optional aux1_0, kk_std_core_types__optional aux2_0, kk_context_t* _ctx) { /* forall<a,e> (xs : list<a>, pred : (a) -> e bool, aux1 : ? (list<a>), aux2 : ? (list<a>)) -> e (list<a>, list<a>) */ 
  kk__tailcall: ;
  if (kk_std_core_types__is_Nil(xs, _ctx)) {
    kk_function_drop(pred_0, _ctx);
    kk_box_t _x_x91;
    kk_std_core_types__list _x_x92;
    if (kk_std_core_types__is_Optional(aux1_0, _ctx)) {
      kk_box_t _box_x19 = aux1_0._cons._Optional.value;
      kk_std_core_types__list _uniq_aux1_100 = kk_std_core_types__list_unbox(_box_x19, KK_BORROWED, _ctx);
      kk_std_core_types__list_dup(_uniq_aux1_100, _ctx);
      kk_std_core_types__optional_drop(aux1_0, _ctx);
      _x_x92 = _uniq_aux1_100; /*list<195>*/
    }
    else {
      kk_std_core_types__optional_drop(aux1_0, _ctx);
      _x_x92 = kk_std_core_types__new_Nil(_ctx); /*list<195>*/
    }
    _x_x91 = kk_std_core_types__list_box(_x_x92, _ctx); /*1038*/
    kk_box_t _x_x93;
    kk_std_core_types__list _x_x94;
    if (kk_std_core_types__is_Optional(aux2_0, _ctx)) {
      kk_box_t _box_x20 = aux2_0._cons._Optional.value;
      kk_std_core_types__list _uniq_aux2_106 = kk_std_core_types__list_unbox(_box_x20, KK_BORROWED, _ctx);
      kk_std_core_types__list_dup(_uniq_aux2_106, _ctx);
      kk_std_core_types__optional_drop(aux2_0, _ctx);
      _x_x94 = _uniq_aux2_106; /*list<195>*/
    }
    else {
      kk_std_core_types__optional_drop(aux2_0, _ctx);
      _x_x94 = kk_std_core_types__new_Nil(_ctx); /*list<195>*/
    }
    _x_x93 = kk_std_core_types__list_box(_x_x94, _ctx); /*1039*/
    return kk_std_core_types__new_Tuple2(_x_x91, _x_x93, _ctx);
  }
  {
    struct kk_std_core_types_Cons* _con_x95 = kk_std_core_types__as_Cons(xs, _ctx);
    kk_box_t x_0 = _con_x95->head;
    kk_std_core_types__list xs_0_0 = _con_x95->tail;
    kk_reuse_t _ru_x74 = kk_reuse_null; /*@reuse*/;
    if kk_likely(kk_datatype_ptr_is_unique(xs, _ctx)) {
      _ru_x74 = (kk_datatype_ptr_reuse(xs, _ctx));
    }
    else {
      kk_box_dup(x_0, _ctx);
      kk_std_core_types__list_dup(xs_0_0, _ctx);
      kk_datatype_ptr_decref(xs, _ctx);
    }
    bool x_1_10015;
    kk_function_t _x_x97 = kk_function_dup(pred_0, _ctx); /*(195) -> 196 bool*/
    kk_box_t _x_x96 = kk_box_dup(x_0, _ctx); /*195*/
    x_1_10015 = kk_function_call(bool, (kk_function_t, kk_box_t, kk_context_t*), _x_x97, (_x_x97, _x_x96, _ctx), _ctx); /*bool*/
    if (kk_yielding(kk_context())) {
      kk_reuse_drop(_ru_x74,kk_context());
      kk_box_t _x_x98 = kk_std_core_hnd_yield_extend(kk_day1_new_partition__h_fun99(aux1_0, aux2_0, pred_0, x_0, xs_0_0, _ctx), _ctx); /*3003*/
      return kk_std_core_types__tuple2_unbox(_x_x98, KK_OWNED, _ctx);
    }
    if (x_1_10015) { // tailcall
                     kk_std_core_types__optional _x_x101;
                     kk_box_t _x_x102;
                     kk_std_core_types__list _x_x103;
                     kk_std_core_types__list _x_x104;
                     if (kk_std_core_types__is_Optional(aux1_0, _ctx)) {
                       kk_box_t _box_x25 = aux1_0._cons._Optional.value;
                       kk_std_core_types__list _uniq_aux1_100_0_0 = kk_std_core_types__list_unbox(_box_x25, KK_BORROWED, _ctx);
                       kk_std_core_types__list_dup(_uniq_aux1_100_0_0, _ctx);
                       kk_std_core_types__optional_drop(aux1_0, _ctx);
                       _x_x104 = _uniq_aux1_100_0_0; /*list<195>*/
                     }
                     else {
                       kk_std_core_types__optional_drop(aux1_0, _ctx);
                       _x_x104 = kk_std_core_types__new_Nil(_ctx); /*list<195>*/
                     }
                     _x_x103 = kk_std_core_types__new_Cons(_ru_x74, 0, x_0, _x_x104, _ctx); /*list<1024>*/
                     _x_x102 = kk_std_core_types__list_box(_x_x103, _ctx); /*1003*/
                     _x_x101 = kk_std_core_types__new_Optional(_x_x102, _ctx); /*? 1003*/
                     kk_std_core_types__optional _x_x105;
                     kk_box_t _x_x106;
                     kk_std_core_types__list _x_x107;
                     if (kk_std_core_types__is_Optional(aux2_0, _ctx)) {
                       kk_box_t _box_x27 = aux2_0._cons._Optional.value;
                       kk_std_core_types__list _uniq_aux2_106_0_0 = kk_std_core_types__list_unbox(_box_x27, KK_BORROWED, _ctx);
                       kk_std_core_types__list_dup(_uniq_aux2_106_0_0, _ctx);
                       kk_std_core_types__optional_drop(aux2_0, _ctx);
                       _x_x107 = _uniq_aux2_106_0_0; /*list<195>*/
                     }
                     else {
                       kk_std_core_types__optional_drop(aux2_0, _ctx);
                       _x_x107 = kk_std_core_types__new_Nil(_ctx); /*list<195>*/
                     }
                     _x_x106 = kk_std_core_types__list_box(_x_x107, _ctx); /*1003*/
                     _x_x105 = kk_std_core_types__new_Optional(_x_x106, _ctx); /*? 1003*/
                     xs = xs_0_0;
                     aux1_0 = _x_x101;
                     aux2_0 = _x_x105;
                     goto kk__tailcall;
    }
    { // tailcall
      kk_std_core_types__optional _x_x108;
      kk_box_t _x_x109;
      kk_std_core_types__list _x_x110;
      if (kk_std_core_types__is_Optional(aux1_0, _ctx)) {
        kk_box_t _box_x29 = aux1_0._cons._Optional.value;
        kk_std_core_types__list _uniq_aux1_100_1_0 = kk_std_core_types__list_unbox(_box_x29, KK_BORROWED, _ctx);
        kk_std_core_types__list_dup(_uniq_aux1_100_1_0, _ctx);
        kk_std_core_types__optional_drop(aux1_0, _ctx);
        _x_x110 = _uniq_aux1_100_1_0; /*list<195>*/
      }
      else {
        kk_std_core_types__optional_drop(aux1_0, _ctx);
        _x_x110 = kk_std_core_types__new_Nil(_ctx); /*list<195>*/
      }
      _x_x109 = kk_std_core_types__list_box(_x_x110, _ctx); /*1003*/
      _x_x108 = kk_std_core_types__new_Optional(_x_x109, _ctx); /*? 1003*/
      kk_std_core_types__optional _x_x111;
      kk_box_t _x_x112;
      kk_std_core_types__list _x_x113;
      kk_std_core_types__list _x_x114;
      if (kk_std_core_types__is_Optional(aux2_0, _ctx)) {
        kk_box_t _box_x31 = aux2_0._cons._Optional.value;
        kk_std_core_types__list _uniq_aux2_106_1_0 = kk_std_core_types__list_unbox(_box_x31, KK_BORROWED, _ctx);
        kk_std_core_types__list_dup(_uniq_aux2_106_1_0, _ctx);
        kk_std_core_types__optional_drop(aux2_0, _ctx);
        _x_x114 = _uniq_aux2_106_1_0; /*list<195>*/
      }
      else {
        kk_std_core_types__optional_drop(aux2_0, _ctx);
        _x_x114 = kk_std_core_types__new_Nil(_ctx); /*list<195>*/
      }
      _x_x113 = kk_std_core_types__new_Cons(_ru_x74, 0, x_0, _x_x114, _ctx); /*list<1024>*/
      _x_x112 = kk_std_core_types__list_box(_x_x113, _ctx); /*1003*/
      _x_x111 = kk_std_core_types__new_Optional(_x_x112, _ctx); /*? 1003*/
      xs = xs_0_0;
      aux1_0 = _x_x108;
      aux2_0 = _x_x111;
      goto kk__tailcall;
    }
  }
}


// lift anonymous function
struct kk_day1_main_fun122__t {
  struct kk_function_s _base;
};
static kk_string_t kk_day1_main_fun122(kk_function_t _fself, kk_box_t _b_x55, kk_context_t* _ctx);
static kk_function_t kk_day1_new_main_fun122(kk_context_t* _ctx) {
  kk_define_static_function(_fself, kk_day1_main_fun122, _ctx)
  return kk_function_dup(_fself,kk_context());
}

static kk_string_t kk_day1_main_fun122(kk_function_t _fself, kk_box_t _b_x55, kk_context_t* _ctx) {
  kk_unused(_fself);
  kk_integer_t _x_x123 = kk_integer_unbox(_b_x55, _ctx); /*int*/
  return kk_std_core_int_show(_x_x123, _ctx);
}

kk_unit_t kk_day1_main(kk_context_t* _ctx) { /* () -> console/console () */ 
  kk_string_t _x_x115;
  kk_std_core_types__list _x_x116;
  kk_std_core_types__list _x_x117;
  kk_std_core_types__list _x_x118;
  kk_std_core_types__list _x_x119;
  kk_std_core_types__list _x_x120;
  kk_std_core_types__list _x_x121 = kk_std_core_types__new_Cons(kk_reuse_null, 0, kk_integer_box(kk_integer_from_small(2), _ctx), kk_std_core_types__new_Nil(_ctx), _ctx); /*list<1024>*/
  _x_x120 = kk_std_core_types__new_Cons(kk_reuse_null, 0, kk_integer_box(kk_integer_from_small(4), _ctx), _x_x121, _ctx); /*list<1024>*/
  _x_x119 = kk_std_core_types__new_Cons(kk_reuse_null, 0, kk_integer_box(kk_integer_from_small(3), _ctx), _x_x120, _ctx); /*list<1024>*/
  _x_x118 = kk_std_core_types__new_Cons(kk_reuse_null, 0, kk_integer_box(kk_integer_from_small(6), _ctx), _x_x119, _ctx); /*list<1024>*/
  _x_x117 = kk_std_core_types__new_Cons(kk_reuse_null, 0, kk_integer_box(kk_integer_from_small(5), _ctx), _x_x118, _ctx); /*list<1024>*/
  _x_x116 = kk_std_core_types__new_Cons(kk_reuse_null, 0, kk_integer_box(kk_integer_from_small(1), _ctx), _x_x117, _ctx); /*list<1024>*/
  _x_x115 = kk_std_core_list_show(_x_x116, kk_day1_new_main_fun122(_ctx), _ctx); /*string*/
  kk_std_core_console_printsln(_x_x115, _ctx); return kk_Unit;
}

// initialization
void kk_day1__init(kk_context_t* _ctx){
  static bool _kk_initialized = false;
  if (_kk_initialized) return;
  _kk_initialized = true;
  kk_std_core_types__init(_ctx);
  kk_std_core_hnd__init(_ctx);
  kk_std_core_exn__init(_ctx);
  kk_std_core_bool__init(_ctx);
  kk_std_core_order__init(_ctx);
  kk_std_core_char__init(_ctx);
  kk_std_core_int__init(_ctx);
  kk_std_core_vector__init(_ctx);
  kk_std_core_string__init(_ctx);
  kk_std_core_sslice__init(_ctx);
  kk_std_core_list__init(_ctx);
  kk_std_core_maybe__init(_ctx);
  kk_std_core_either__init(_ctx);
  kk_std_core_tuple__init(_ctx);
  kk_std_core_show__init(_ctx);
  kk_std_core_debug__init(_ctx);
  kk_std_core_delayed__init(_ctx);
  kk_std_core_console__init(_ctx);
  kk_std_core__init(_ctx);
  #if defined(KK_CUSTOM_INIT)
    KK_CUSTOM_INIT (_ctx);
  #endif
}

// termination
void kk_day1__done(kk_context_t* _ctx){
  static bool _kk_done = false;
  if (_kk_done) return;
  _kk_done = true;
  #if defined(KK_CUSTOM_DONE)
    KK_CUSTOM_DONE (_ctx);
  #endif
  kk_std_core__done(_ctx);
  kk_std_core_console__done(_ctx);
  kk_std_core_delayed__done(_ctx);
  kk_std_core_debug__done(_ctx);
  kk_std_core_show__done(_ctx);
  kk_std_core_tuple__done(_ctx);
  kk_std_core_either__done(_ctx);
  kk_std_core_maybe__done(_ctx);
  kk_std_core_list__done(_ctx);
  kk_std_core_sslice__done(_ctx);
  kk_std_core_string__done(_ctx);
  kk_std_core_vector__done(_ctx);
  kk_std_core_int__done(_ctx);
  kk_std_core_char__done(_ctx);
  kk_std_core_order__done(_ctx);
  kk_std_core_bool__done(_ctx);
  kk_std_core_exn__done(_ctx);
  kk_std_core_hnd__done(_ctx);
  kk_std_core_types__done(_ctx);
}
