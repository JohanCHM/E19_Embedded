; ModuleID = 'C:/master/EmbeddedPRJ2/E19_Embedded/convolution.prj/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S32"
target triple = "i686-pc-mingw32"

@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535]
@convolution_str = internal unnamed_addr constant [12 x i8] c"convolution\00"
@p_str1 = private unnamed_addr constant [4 x i8] c"Col\00", align 1
@p_str = private unnamed_addr constant [4 x i8] c"Row\00", align 1

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define void @convolution([9 x i32]* %k, [9 x i32]* %wdw, i32* %res) nounwind {
  %tmp = alloca i32
  call void (...)* @_ssdm_op_SpecBitsMap([9 x i32]* %k) nounwind, !map !14
  call void (...)* @_ssdm_op_SpecBitsMap([9 x i32]* %wdw) nounwind, !map !20
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %res) nounwind, !map !24
  call void (...)* @_ssdm_op_SpecTopModule([12 x i8]* @convolution_str) nounwind
  call void @_ssdm_op_Write.ap_auto.i32P(i32* %res, i32 0) nounwind
  store i32 0, i32* %tmp
  br label %1

; <label>:1                                       ; preds = %5, %0
  %i = phi i2 [ 0, %0 ], [ %i_1, %5 ]
  %i_cast2_cast = zext i2 %i to i5
  %tmp_7 = call i4 @_ssdm_op_BitConcatenate.i4.i2.i2(i2 %i, i2 0)
  %p_shl_cast = zext i4 %tmp_7 to i5
  %tmp_8 = sub i5 %p_shl_cast, %i_cast2_cast
  %exitcond1 = icmp eq i2 %i, -1
  %empty = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3) nounwind
  %i_1 = add i2 %i, 1
  br i1 %exitcond1, label %6, label %2

; <label>:2                                       ; preds = %1
  call void (...)* @_ssdm_op_SpecLoopName([4 x i8]* @p_str) nounwind
  %tmp_3 = call i32 (...)* @_ssdm_op_SpecRegionBegin([4 x i8]* @p_str) nounwind
  %tmp_1 = sub i2 -2, %i
  %tmp_1_cast_cast = zext i2 %tmp_1 to i5
  %tmp_9 = call i4 @_ssdm_op_BitConcatenate.i4.i2.i2(i2 %tmp_1, i2 0)
  %p_shl1_cast = zext i4 %tmp_9 to i5
  %tmp_s = sub i5 %p_shl1_cast, %tmp_1_cast_cast
  br label %3

; <label>:3                                       ; preds = %4, %2
  %j = phi i2 [ 0, %2 ], [ %j_1, %4 ]
  %j_cast1_cast = zext i2 %j to i5
  %tmp_2 = add i5 %tmp_8, %j_cast1_cast
  %tmp_11_cast = sext i5 %tmp_2 to i32
  %wdw_addr = getelementptr [9 x i32]* %wdw, i32 0, i32 %tmp_11_cast
  %exitcond = icmp eq i2 %j, -1
  %empty_2 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3) nounwind
  %j_1 = add i2 %j, 1
  br i1 %exitcond, label %5, label %4

; <label>:4                                       ; preds = %3
  %tmp_load = load i32* %tmp
  call void (...)* @_ssdm_op_SpecLoopName([4 x i8]* @p_str1) nounwind
  %tmp_4 = sub i2 -2, %j
  %tmp_4_cast_cast = zext i2 %tmp_4 to i5
  %tmp_10 = add i5 %tmp_s, %tmp_4_cast_cast
  %tmp_12_cast = sext i5 %tmp_10 to i32
  %k_addr = getelementptr [9 x i32]* %k, i32 0, i32 %tmp_12_cast
  %k_load = load i32* %k_addr, align 4
  %wdw_load = load i32* %wdw_addr, align 4
  %tmp_5 = mul nsw i32 %k_load, %wdw_load
  %tmp_6 = add nsw i32 %tmp_load, %tmp_5
  call void @_ssdm_op_Write.ap_auto.i32P(i32* %res, i32 %tmp_6) nounwind
  store i32 %tmp_6, i32* %tmp
  br label %3

; <label>:5                                       ; preds = %3
  %empty_3 = call i32 (...)* @_ssdm_op_SpecRegionEnd([4 x i8]* @p_str, i32 %tmp_3) nounwind
  br label %1

; <label>:6                                       ; preds = %1
  ret void
}

define weak void @_ssdm_op_Write.ap_auto.i32P(i32*, i32) {
entry:
  store i32 %1, i32* %0
  ret void
}

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

define weak i32 @_ssdm_op_SpecRegionEnd(...) {
entry:
  ret i32 0
}

define weak i32 @_ssdm_op_SpecRegionBegin(...) {
entry:
  ret i32 0
}

define weak i32 @_ssdm_op_SpecLoopTripCount(...) {
entry:
  ret i32 0
}

define weak void @_ssdm_op_SpecLoopName(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

define weak i4 @_ssdm_op_BitConcatenate.i4.i2.i2(i2, i2) nounwind readnone {
entry:
  %empty = zext i2 %0 to i4
  %empty_4 = zext i2 %1 to i4
  %empty_5 = shl i4 %empty, 2
  %empty_6 = or i4 %empty_5, %empty_4
  ret i4 %empty_6
}

declare void @_GLOBAL__I_a() nounwind

!opencl.kernels = !{!0}
!hls.encrypted.func = !{}
!llvm.map.gv = !{!7}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 1, i32 0}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"k_t [3]*", metadata !"wdw_t [3]*", metadata !"result_t &"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"k", metadata !"wdw", metadata !"res"}
!6 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!7 = metadata !{metadata !8, [1 x i32]* @llvm_global_ctors_0}
!8 = metadata !{metadata !9}
!9 = metadata !{i32 0, i32 31, metadata !10}
!10 = metadata !{metadata !11}
!11 = metadata !{metadata !"llvm.global_ctors.0", metadata !12, metadata !"", i32 0, i32 31}
!12 = metadata !{metadata !13}
!13 = metadata !{i32 0, i32 0, i32 1}
!14 = metadata !{metadata !15}
!15 = metadata !{i32 0, i32 31, metadata !16}
!16 = metadata !{metadata !17}
!17 = metadata !{metadata !"k", metadata !18, metadata !"int", i32 0, i32 31}
!18 = metadata !{metadata !19, metadata !19}
!19 = metadata !{i32 0, i32 2, i32 1}
!20 = metadata !{metadata !21}
!21 = metadata !{i32 0, i32 31, metadata !22}
!22 = metadata !{metadata !23}
!23 = metadata !{metadata !"wdw", metadata !18, metadata !"int", i32 0, i32 31}
!24 = metadata !{metadata !25}
!25 = metadata !{i32 0, i32 31, metadata !26}
!26 = metadata !{metadata !27}
!27 = metadata !{metadata !"res", metadata !12, metadata !"int", i32 0, i32 31}
