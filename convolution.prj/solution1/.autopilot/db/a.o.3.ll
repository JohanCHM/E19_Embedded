; ModuleID = 'C:/master/EmbeddedPRJ2/E19_Embedded/convolution.prj/solution1/.autopilot/db/a.o.3.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S32"
target triple = "i686-pc-mingw32"

@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a] ; [#uses=0 type=[1 x void ()*]*]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535] ; [#uses=0 type=[1 x i32]*]
@convolution_str = internal unnamed_addr constant [12 x i8] c"convolution\00" ; [#uses=1 type=[12 x i8]*]
@p_str1 = private unnamed_addr constant [4 x i8] c"Col\00", align 1 ; [#uses=1 type=[4 x i8]*]
@p_str = private unnamed_addr constant [4 x i8] c"Row\00", align 1 ; [#uses=3 type=[4 x i8]*]

; [#uses=5]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=0]
define void @convolution([9 x i32]* %k, [9 x i32]* %wdw, i32* %res) nounwind {
  %tmp = alloca i32                               ; [#uses=3 type=i32*]
  call void (...)* @_ssdm_op_SpecBitsMap([9 x i32]* %k) nounwind, !map !14
  call void (...)* @_ssdm_op_SpecBitsMap([9 x i32]* %wdw) nounwind, !map !20
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %res) nounwind, !map !24
  call void (...)* @_ssdm_op_SpecTopModule([12 x i8]* @convolution_str) nounwind
  call void @llvm.dbg.value(metadata !{[9 x i32]* %k}, i64 0, metadata !28), !dbg !48 ; [debug line = 4:9] [debug variable = k]
  call void @llvm.dbg.value(metadata !{[9 x i32]* %wdw}, i64 0, metadata !49), !dbg !51 ; [debug line = 5:11] [debug variable = wdw]
  call void @llvm.dbg.value(metadata !{i32* %res}, i64 0, metadata !52), !dbg !53 ; [debug line = 6:15] [debug variable = res]
  call void @_ssdm_op_Write.ap_auto.i32P(i32* %res, i32 0) nounwind, !dbg !54 ; [debug line = 9:5]
  store i32 0, i32* %tmp
  br label %1, !dbg !56                           ; [debug line = 10:24]

; <label>:1                                       ; preds = %5, %0
  %i = phi i2 [ 0, %0 ], [ %i_1, %5 ]             ; [#uses=5 type=i2]
  %i_cast2_cast = zext i2 %i to i5                ; [#uses=1 type=i5]
  %tmp_7 = call i4 @_ssdm_op_BitConcatenate.i4.i2.i2(i2 %i, i2 0) ; [#uses=1 type=i4]
  %p_shl_cast = zext i4 %tmp_7 to i5, !dbg !58    ; [#uses=1 type=i5] [debug line = 14:13]
  %tmp_8 = sub i5 %p_shl_cast, %i_cast2_cast, !dbg !58 ; [#uses=1 type=i5] [debug line = 14:13]
  %exitcond1 = icmp eq i2 %i, -1, !dbg !56        ; [#uses=1 type=i1] [debug line = 10:24]
  %empty = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3) nounwind ; [#uses=0 type=i32]
  %i_1 = add i2 %i, 1, !dbg !62                   ; [#uses=1 type=i2] [debug line = 10:33]
  br i1 %exitcond1, label %6, label %2, !dbg !56  ; [debug line = 10:24]

; <label>:2                                       ; preds = %1
  call void (...)* @_ssdm_op_SpecLoopName([4 x i8]* @p_str) nounwind, !dbg !63 ; [debug line = 11:6]
  %tmp_3 = call i32 (...)* @_ssdm_op_SpecRegionBegin([4 x i8]* @p_str) nounwind, !dbg !63 ; [#uses=1 type=i32] [debug line = 11:6]
  %tmp_1 = sub i2 -2, %i, !dbg !58                ; [#uses=2 type=i2] [debug line = 14:13]
  %tmp_1_cast_cast = zext i2 %tmp_1 to i5         ; [#uses=1 type=i5]
  %tmp_9 = call i4 @_ssdm_op_BitConcatenate.i4.i2.i2(i2 %tmp_1, i2 0) ; [#uses=1 type=i4]
  %p_shl1_cast = zext i4 %tmp_9 to i5, !dbg !58   ; [#uses=1 type=i5] [debug line = 14:13]
  %tmp_s = sub i5 %p_shl1_cast, %tmp_1_cast_cast, !dbg !58 ; [#uses=1 type=i5] [debug line = 14:13]
  br label %3, !dbg !64                           ; [debug line = 12:28]

; <label>:3                                       ; preds = %4, %2
  %j = phi i2 [ 0, %2 ], [ %j_1, %4 ]             ; [#uses=4 type=i2]
  %j_cast1_cast = zext i2 %j to i5, !dbg !58      ; [#uses=1 type=i5] [debug line = 14:13]
  %tmp_2 = add i5 %tmp_8, %j_cast1_cast, !dbg !58 ; [#uses=1 type=i5] [debug line = 14:13]
  %tmp_11_cast = sext i5 %tmp_2 to i32, !dbg !58  ; [#uses=1 type=i32] [debug line = 14:13]
  %wdw_addr = getelementptr [9 x i32]* %wdw, i32 0, i32 %tmp_11_cast, !dbg !58 ; [#uses=1 type=i32*] [debug line = 14:13]
  %exitcond = icmp eq i2 %j, -1, !dbg !64         ; [#uses=1 type=i1] [debug line = 12:28]
  %empty_2 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3) nounwind ; [#uses=0 type=i32]
  %j_1 = add i2 %j, 1, !dbg !65                   ; [#uses=1 type=i2] [debug line = 12:37]
  br i1 %exitcond, label %5, label %4, !dbg !64   ; [debug line = 12:28]

; <label>:4                                       ; preds = %3
  %tmp_load = load i32* %tmp, !dbg !58            ; [#uses=1 type=i32] [debug line = 14:13]
  call void (...)* @_ssdm_op_SpecLoopName([4 x i8]* @p_str1) nounwind, !dbg !66 ; [debug line = 13:10]
  %tmp_4 = sub i2 -2, %j, !dbg !58                ; [#uses=1 type=i2] [debug line = 14:13]
  %tmp_4_cast_cast = zext i2 %tmp_4 to i5, !dbg !58 ; [#uses=1 type=i5] [debug line = 14:13]
  %tmp_10 = add i5 %tmp_s, %tmp_4_cast_cast, !dbg !58 ; [#uses=1 type=i5] [debug line = 14:13]
  %tmp_12_cast = sext i5 %tmp_10 to i32, !dbg !58 ; [#uses=1 type=i32] [debug line = 14:13]
  %k_addr = getelementptr [9 x i32]* %k, i32 0, i32 %tmp_12_cast, !dbg !58 ; [#uses=1 type=i32*] [debug line = 14:13]
  %k_load = load i32* %k_addr, align 4, !dbg !58  ; [#uses=1 type=i32] [debug line = 14:13]
  %wdw_load = load i32* %wdw_addr, align 4, !dbg !58 ; [#uses=1 type=i32] [debug line = 14:13]
  %tmp_5 = mul nsw i32 %k_load, %wdw_load, !dbg !58 ; [#uses=1 type=i32] [debug line = 14:13]
  %tmp_6 = add nsw i32 %tmp_load, %tmp_5, !dbg !58 ; [#uses=2 type=i32] [debug line = 14:13]
  call void @_ssdm_op_Write.ap_auto.i32P(i32* %res, i32 %tmp_6) nounwind, !dbg !58 ; [debug line = 14:13]
  call void @llvm.dbg.value(metadata !{i2 %j_1}, i64 0, metadata !67), !dbg !65 ; [debug line = 12:37] [debug variable = j]
  store i32 %tmp_6, i32* %tmp
  br label %3, !dbg !65                           ; [debug line = 12:37]

; <label>:5                                       ; preds = %3
  %empty_3 = call i32 (...)* @_ssdm_op_SpecRegionEnd([4 x i8]* @p_str, i32 %tmp_3) nounwind, !dbg !68 ; [#uses=0 type=i32] [debug line = 17:5]
  call void @llvm.dbg.value(metadata !{i2 %i_1}, i64 0, metadata !69), !dbg !62 ; [debug line = 10:33] [debug variable = i]
  br label %1, !dbg !62                           ; [debug line = 10:33]

; <label>:6                                       ; preds = %1
  ret void, !dbg !70                              ; [debug line = 19:1]
}

; [#uses=2]
define weak void @_ssdm_op_Write.ap_auto.i32P(i32*, i32) {
entry:
  store i32 %1, i32* %0
  ret void
}

; [#uses=1]
define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

; [#uses=1]
define weak i32 @_ssdm_op_SpecRegionEnd(...) {
entry:
  ret i32 0
}

; [#uses=1]
define weak i32 @_ssdm_op_SpecRegionBegin(...) {
entry:
  ret i32 0
}

; [#uses=2]
define weak i32 @_ssdm_op_SpecLoopTripCount(...) {
entry:
  ret i32 0
}

; [#uses=2]
define weak void @_ssdm_op_SpecLoopName(...) nounwind {
entry:
  ret void
}

; [#uses=3]
define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

; [#uses=2]
define weak i4 @_ssdm_op_BitConcatenate.i4.i2.i2(i2, i2) nounwind readnone {
entry:
  %empty = zext i2 %0 to i4                       ; [#uses=1 type=i4]
  %empty_4 = zext i2 %1 to i4                     ; [#uses=1 type=i4]
  %empty_5 = shl i4 %empty, 2                     ; [#uses=1 type=i4]
  %empty_6 = or i4 %empty_5, %empty_4             ; [#uses=1 type=i4]
  ret i4 %empty_6
}

; [#uses=1]
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
!28 = metadata !{i32 786689, metadata !29, metadata !"k", null, i32 4, metadata !46, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!29 = metadata !{i32 786478, i32 0, metadata !30, metadata !"convolution", metadata !"convolution", metadata !"_Z11convolutionPA3_iS0_Ri", metadata !30, i32 3, metadata !31, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !44, i32 7} ; [ DW_TAG_subprogram ]
!30 = metadata !{i32 786473, metadata !"MiniProjectCPP/MiniProjectCPP.sdk/harrisProject/src/convolution.cpp", metadata !"C:\5Cmaster\5CEmbeddedPRJ2\5CE19_Embedded", null} ; [ DW_TAG_file_type ]
!31 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !32, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!32 = metadata !{null, metadata !33, metadata !39, metadata !42}
!33 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !34} ; [ DW_TAG_pointer_type ]
!34 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 96, i64 32, i32 0, i32 0, metadata !35, metadata !37, i32 0, i32 0} ; [ DW_TAG_array_type ]
!35 = metadata !{i32 786454, null, metadata !"k_t", metadata !30, i32 13, i64 0, i64 0, i64 0, i32 0, metadata !36} ; [ DW_TAG_typedef ]
!36 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!37 = metadata !{metadata !38}
!38 = metadata !{i32 786465, i64 0, i64 2}        ; [ DW_TAG_subrange_type ]
!39 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !40} ; [ DW_TAG_pointer_type ]
!40 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 96, i64 32, i32 0, i32 0, metadata !41, metadata !37, i32 0, i32 0} ; [ DW_TAG_array_type ]
!41 = metadata !{i32 786454, null, metadata !"wdw_t", metadata !30, i32 14, i64 0, i64 0, i64 0, i32 0, metadata !36} ; [ DW_TAG_typedef ]
!42 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !43} ; [ DW_TAG_reference_type ]
!43 = metadata !{i32 786454, null, metadata !"result_t", metadata !30, i32 15, i64 0, i64 0, i64 0, i32 0, metadata !36} ; [ DW_TAG_typedef ]
!44 = metadata !{metadata !45}
!45 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!46 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 288, i64 32, i32 0, i32 0, metadata !35, metadata !47, i32 0, i32 0} ; [ DW_TAG_array_type ]
!47 = metadata !{metadata !38, metadata !38}
!48 = metadata !{i32 4, i32 9, metadata !29, null}
!49 = metadata !{i32 786689, metadata !29, metadata !"wdw", null, i32 5, metadata !50, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!50 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 288, i64 32, i32 0, i32 0, metadata !41, metadata !47, i32 0, i32 0} ; [ DW_TAG_array_type ]
!51 = metadata !{i32 5, i32 11, metadata !29, null}
!52 = metadata !{i32 786689, metadata !29, metadata !"res", metadata !30, i32 50331654, metadata !42, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!53 = metadata !{i32 6, i32 15, metadata !29, null}
!54 = metadata !{i32 9, i32 5, metadata !55, null}
!55 = metadata !{i32 786443, metadata !29, i32 7, i32 1, metadata !30, i32 0} ; [ DW_TAG_lexical_block ]
!56 = metadata !{i32 10, i32 24, metadata !57, null}
!57 = metadata !{i32 786443, metadata !55, i32 10, i32 10, metadata !30, i32 1} ; [ DW_TAG_lexical_block ]
!58 = metadata !{i32 14, i32 13, metadata !59, null}
!59 = metadata !{i32 786443, metadata !60, i32 13, i32 9, metadata !30, i32 4} ; [ DW_TAG_lexical_block ]
!60 = metadata !{i32 786443, metadata !61, i32 12, i32 14, metadata !30, i32 3} ; [ DW_TAG_lexical_block ]
!61 = metadata !{i32 786443, metadata !57, i32 11, i32 5, metadata !30, i32 2} ; [ DW_TAG_lexical_block ]
!62 = metadata !{i32 10, i32 33, metadata !57, null}
!63 = metadata !{i32 11, i32 6, metadata !61, null}
!64 = metadata !{i32 12, i32 28, metadata !60, null}
!65 = metadata !{i32 12, i32 37, metadata !60, null}
!66 = metadata !{i32 13, i32 10, metadata !59, null}
!67 = metadata !{i32 786688, metadata !60, metadata !"j", metadata !30, i32 12, metadata !36, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!68 = metadata !{i32 17, i32 5, metadata !61, null}
!69 = metadata !{i32 786688, metadata !57, metadata !"i", metadata !30, i32 10, metadata !36, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!70 = metadata !{i32 19, i32 1, metadata !55, null}
