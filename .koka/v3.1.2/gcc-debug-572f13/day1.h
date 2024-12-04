#pragma once
#ifndef kk_day1_H
#define kk_day1_H
// Koka generated module: day1, koka version: 3.1.2, platform: 64-bit
#include <kklib.h>
#include "std_core_types.h"
#include "std_core_hnd.h"
#include "std_core_exn.h"
#include "std_core_bool.h"
#include "std_core_order.h"
#include "std_core_char.h"
#include "std_core_int.h"
#include "std_core_vector.h"
#include "std_core_string.h"
#include "std_core_sslice.h"
#include "std_core_list.h"
#include "std_core_maybe.h"
#include "std_core_either.h"
#include "std_core_tuple.h"
#include "std_core_show.h"
#include "std_core_debug.h"
#include "std_core_delayed.h"
#include "std_core_console.h"
#include "std_core.h"

// type declarations

// value declarations

kk_std_core_types__maybe kk_day1_min(kk_std_core_types__list xs, kk_context_t* _ctx); /* (xs : list<int>) -> maybe<int> */ 

kk_std_core_types__tuple2 kk_day1__mlift_partition__h_10014(kk_std_core_types__optional aux1, kk_std_core_types__optional aux2, kk_function_t pred, kk_box_t x, kk_std_core_types__list xs_0, bool _y_x10009, kk_context_t* _ctx); /* forall<a,e> (aux1 : ? (list<a>), aux2 : ? (list<a>), pred : (a) -> e bool, x : a, xs@0 : list<a>, bool) -> e (list<a>, list<a>) */ 

kk_std_core_types__tuple2 kk_day1_partition__h(kk_std_core_types__list xs, kk_function_t pred_0, kk_std_core_types__optional aux1_0, kk_std_core_types__optional aux2_0, kk_context_t* _ctx); /* forall<a,e> (xs : list<a>, pred : (a) -> e bool, aux1 : ? (list<a>), aux2 : ? (list<a>)) -> e (list<a>, list<a>) */ 

static inline kk_box_t kk_day1_sort(kk_box_t xs, kk_context_t* _ctx) { /* forall<a> (xs : a) -> a */ 
  return xs;
}

kk_unit_t kk_day1_main(kk_context_t* _ctx); /* () -> console/console () */ 

void kk_day1__init(kk_context_t* _ctx);


void kk_day1__done(kk_context_t* _ctx);

#endif // header
