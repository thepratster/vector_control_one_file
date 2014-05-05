; ModuleID = 'prog.opt.o'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private constant [9 x i8] c"in_data1\00"
@.str1 = private constant [9 x i8] c"in_data2\00"
@.str2 = private constant [9 x i8] c"in_data3\00"
@.str3 = private constant [9 x i8] c"in_data4\00"
@.str4 = private constant [9 x i8] c"in_data5\00"
@.str5 = private constant [10 x i8] c"out_data1\00"
@.str6 = private constant [10 x i8] c"out_data2\00"
@.str7 = private constant [10 x i8] c"out_data3\00"
@.str8 = private constant [10 x i8] c"out_data4\00"

define i64 @getSlice64(i64 %reg, i8 zeroext %h, i8 zeroext %l) nounwind readnone {
  %1 = zext i8 %h to i64
  %2 = sub i64 63, %1
  %3 = and i64 %2, 4294967295
  %4 = shl i64 %reg, %3
  %5 = zext i8 %l to i64
  %6 = add i64 %2, %5
  %7 = and i64 %6, 4294967295
  %8 = lshr i64 %4, %7
  ret i64 %8
}

define zeroext i8 @getBit64(i64 %reg, i8 zeroext %pos) nounwind readnone {
  %1 = zext i8 %pos to i64
  %2 = sub i64 63, %1
  %3 = and i64 %2, 4294967295
  %4 = shl i64 %reg, %3
  %5 = lshr i64 %4, 63
  %6 = trunc i64 %5 to i8
  ret i8 %6
}

define i64 @setSlice64(i64 %reg, i8 zeroext %h, i8 zeroext %l, i64 %value) nounwind readnone {
  %1 = zext i8 %h to i64
  %2 = zext i8 %l to i64
  %3 = sub i64 63, %1
  %4 = add i64 %3, %2
  %5 = and i64 %4, 4294967295
  %6 = lshr i64 -1, %5
  %7 = and i64 %6, %value
  %8 = shl i64 %7, %2
  %9 = shl i64 %6, %2
  %10 = xor i64 %9, -1
  %11 = and i64 %10, %reg
  %12 = or i64 %11, %8
  ret i64 %12
}

define i64 @setBit64(i64 %reg, i8 zeroext %pos, i8 zeroext %value) nounwind readnone {
  %1 = zext i8 %value to i64
  %2 = zext i8 %pos to i64
  %3 = and i64 %1, 1
  %4 = shl i64 %3, %2
  %5 = shl i64 1, %2
  %6 = xor i64 %5, -1
  %7 = and i64 %6, %reg
  %8 = or i64 %7, %4
  ret i64 %8
}

define double @fdiv32(double %a, double %b) nounwind readnone {
; <label>:0
  %tmp17 = bitcast double %a to i64
  %tmp15 = bitcast double %b to i64
  %1 = and i64 %tmp17, 9223372036854775807
  %2 = and i64 %tmp15, 9223372036854775807
  %3 = icmp eq i64 %1, 0
  br i1 %3, label %7, label %4

; <label>:4                                       ; preds = %0
  %5 = and i64 %tmp15, 9218868437227405312
  %tmp17.mask = and i64 %tmp17, 9218868437227405312
  %6 = add i64 %tmp17.mask, 4602678819172646912
  %phitmp = sub i64 %6, %5
  %phitmp20 = and i64 %phitmp, 9218868437227405312
  br label %7

; <label>:7                                       ; preds = %4, %0
  %8 = phi i64 [ %phitmp20, %4 ], [ 0, %0 ]
  %9 = and i64 %tmp17, 4503599627370495
  %10 = or i64 %tmp15, 4602678819172646912
  %11 = or i64 %8, %9
  %12 = and i64 %10, 4607182418800017407
  %tmp13 = bitcast i64 %11 to double
  %tmp11 = bitcast i64 %12 to double
  %13 = fmul double %tmp11, 0x3FFE1E1E20000000
  %14 = fsub double 0x40069696A0000000, %13
  %15 = fmul double %tmp11, %14
  %16 = fsub double 2.000000e+00, %15
  %17 = fmul double %14, %16
  %18 = fmul double %tmp11, %17
  %19 = fsub double 2.000000e+00, %18
  %20 = fmul double %17, %19
  %21 = fmul double %tmp11, %20
  %22 = fsub double 2.000000e+00, %21
  %23 = fmul double %20, %22
  %24 = fmul double %tmp11, %23
  %25 = fsub double 2.000000e+00, %24
  %26 = fmul double %23, %25
  %27 = icmp eq i64 %2, 0
  %or.cond = or i1 %3, %27
  br i1 %or.cond, label %30, label %28

; <label>:28                                      ; preds = %7
  %29 = fmul double %tmp13, %26
  %phitmp19 = bitcast double %29 to i64
  %phitmp21 = and i64 %phitmp19, 9223372036854775807
  br label %30

; <label>:30                                      ; preds = %28, %7
  %31 = phi i64 [ %phitmp21, %28 ], [ 0, %7 ]
  %32 = xor i64 %tmp15, %tmp17
  %33 = and i64 %32, -9223372036854775808
  %34 = or i64 %31, %33
  %tmp4 = bitcast i64 %34 to double
  ret double %tmp4
}

define float @fpmul32f(float %x, float %y) nounwind readnone {
  %1 = fmul float %x, %y
  ret float %1
}

define float @fpadd32f(float %x, float %y) nounwind readnone {
  %1 = fadd float %x, %y
  ret float %1
}

define float @fpsub32f(float %x, float %y) nounwind readnone {
  %1 = fsub float %x, %y
  ret float %1
}

define i32 @fpadd32fi(i32 %x, i32 %y) nounwind readnone {
  %1 = add i32 %y, %x
  ret i32 %1
}

define i32 @fpsub32fi(i32 %x, i32 %y) nounwind readnone {
  %1 = sub i32 %x, %y
  ret i32 %1
}

define float @rotor_flux_calc(float %del_t, float %Lm, float %id, float %flux_rotor_prev, float %tau_new, float %tau_r) nounwind readnone {
  %1 = fmul float %flux_rotor_prev, 0x3FEFFBE760000000
  %2 = fmul float %id, 0x3FE9E83E40000000
  %3 = fmul float %2, 0x3F40624DE0000000
  %4 = fadd float %3, %1
  ret float %4
}

define float @omega_calc(float %Lm, float %iq, float %tau_r, float %flux_rotor) nounwind readnone {
; <label>:0
  %1 = fmul float %iq, 0x3FE9E83E40000000
  %2 = fmul float %tau_r, %flux_rotor
  %3 = fpext float %1 to double
  %4 = fpext float %2 to double
  %tmp17.i = bitcast double %3 to i64
  %tmp15.i = bitcast double %4 to i64
  %5 = and i64 %tmp17.i, 9223372036854775807
  %6 = and i64 %tmp15.i, 9223372036854775807
  %7 = icmp eq i64 %5, 0
  br i1 %7, label %11, label %8

; <label>:8                                       ; preds = %0
  %9 = and i64 %tmp15.i, 9218868437227405312
  %tmp17.mask.i = and i64 %tmp17.i, 9218868437227405312
  %10 = add i64 %tmp17.mask.i, 4602678819172646912
  %phitmp.i = sub i64 %10, %9
  %phitmp20.i = and i64 %phitmp.i, 9218868437227405312
  br label %11

; <label>:11                                      ; preds = %8, %0
  %12 = phi i64 [ %phitmp20.i, %8 ], [ 0, %0 ]
  %13 = or i64 %tmp15.i, 4602678819172646912
  %14 = and i64 %13, 4607182418800017407
  %tmp11.i = bitcast i64 %14 to double
  %15 = fmul double %tmp11.i, 0x3FFE1E1E20000000
  %16 = fsub double 0x40069696A0000000, %15
  %17 = fmul double %tmp11.i, %16
  %18 = fsub double 2.000000e+00, %17
  %19 = fmul double %16, %18
  %20 = fmul double %tmp11.i, %19
  %21 = fsub double 2.000000e+00, %20
  %22 = fmul double %19, %21
  %23 = fmul double %tmp11.i, %22
  %24 = fsub double 2.000000e+00, %23
  %25 = fmul double %22, %24
  %26 = icmp eq i64 %6, 0
  %or.cond.i = or i1 %7, %26
  br i1 %or.cond.i, label %fdiv32.exit, label %27

; <label>:27                                      ; preds = %11
  %28 = fmul double %tmp11.i, %25
  %29 = and i64 %tmp17.i, 4503599627370495
  %30 = fsub double 2.000000e+00, %28
  %31 = or i64 %12, %29
  %32 = fmul double %25, %30
  %tmp13.i = bitcast i64 %31 to double
  %33 = fmul double %tmp13.i, %32
  %phitmp19.i = bitcast double %33 to i64
  %phitmp21.i = and i64 %phitmp19.i, 9223372036854775807
  br label %fdiv32.exit

fdiv32.exit:                                      ; preds = %27, %11
  %34 = phi i64 [ %phitmp21.i, %27 ], [ 0, %11 ]
  %35 = xor i64 %tmp15.i, %tmp17.i
  %36 = and i64 %35, -9223372036854775808
  %37 = or i64 %34, %36
  %tmp4.i = bitcast i64 %37 to double
  %38 = fptrunc double %tmp4.i to float
  ret float %38
}

define float @theta_calc(float %omega_r, float %omega_m, float %del_t, float %theta_prev) nounwind readnone {
  %1 = fmul float %omega_m, %del_t
  %2 = fadd float %1, %theta_prev
  ret float %2
}

define float @iq_err_calc(float %Lr, float %torque_ref, float %constant_1, float %flux_rotor) nounwind readnone {
; <label>:0
  %1 = fmul float %Lr, 4.000000e+00
  %2 = fmul float %1, %torque_ref
  %3 = fmul float %constant_1, %flux_rotor
  %4 = fpext float %2 to double
  %5 = fpext float %3 to double
  %tmp17.i = bitcast double %4 to i64
  %tmp15.i = bitcast double %5 to i64
  %6 = and i64 %tmp17.i, 9223372036854775807
  %7 = and i64 %tmp15.i, 9223372036854775807
  %8 = icmp eq i64 %6, 0
  br i1 %8, label %12, label %9

; <label>:9                                       ; preds = %0
  %10 = and i64 %tmp15.i, 9218868437227405312
  %tmp17.mask.i = and i64 %tmp17.i, 9218868437227405312
  %11 = add i64 %tmp17.mask.i, 4602678819172646912
  %phitmp.i = sub i64 %11, %10
  %phitmp20.i = and i64 %phitmp.i, 9218868437227405312
  br label %12

; <label>:12                                      ; preds = %9, %0
  %13 = phi i64 [ %phitmp20.i, %9 ], [ 0, %0 ]
  %14 = or i64 %tmp15.i, 4602678819172646912
  %15 = and i64 %14, 4607182418800017407
  %tmp11.i = bitcast i64 %15 to double
  %16 = fmul double %tmp11.i, 0x3FFE1E1E20000000
  %17 = fsub double 0x40069696A0000000, %16
  %18 = fmul double %tmp11.i, %17
  %19 = fsub double 2.000000e+00, %18
  %20 = fmul double %17, %19
  %21 = fmul double %tmp11.i, %20
  %22 = fsub double 2.000000e+00, %21
  %23 = fmul double %20, %22
  %24 = fmul double %tmp11.i, %23
  %25 = fsub double 2.000000e+00, %24
  %26 = fmul double %23, %25
  %27 = icmp eq i64 %7, 0
  %or.cond.i = or i1 %8, %27
  br i1 %or.cond.i, label %fdiv32.exit, label %28

; <label>:28                                      ; preds = %12
  %29 = fmul double %tmp11.i, %26
  %30 = and i64 %tmp17.i, 4503599627370495
  %31 = fsub double 2.000000e+00, %29
  %32 = or i64 %13, %30
  %33 = fmul double %26, %31
  %tmp13.i = bitcast i64 %32 to double
  %34 = fmul double %tmp13.i, %33
  %phitmp19.i = bitcast double %34 to i64
  %phitmp21.i = and i64 %phitmp19.i, 9223372036854775807
  br label %fdiv32.exit

fdiv32.exit:                                      ; preds = %28, %12
  %35 = phi i64 [ %phitmp21.i, %28 ], [ 0, %12 ]
  %36 = xor i64 %tmp15.i, %tmp17.i
  %37 = and i64 %36, -9223372036854775808
  %38 = or i64 %35, %37
  %tmp4.i = bitcast i64 %38 to double
  %39 = fptrunc double %tmp4.i to float
  ret float %39
}

define void @vector_control_daemon() noreturn nounwind {
; <label>:0
  br label %1

; <label>:1                                       ; preds = %fdiv32.exit, %0
  %theta_prev.0 = phi float [ 0.000000e+00, %0 ], [ %53, %fdiv32.exit ]
  %flux_rotor_prev.0 = phi float [ 0.000000e+00, %0 ], [ %phitmp1, %fdiv32.exit ]
  %int_speed_err_temp_2.0 = phi float [ 0.000000e+00, %0 ], [ %17, %fdiv32.exit ]
  %int_flux_err_temp_2.0 = phi float [ 0.000000e+00, %0 ], [ %92, %fdiv32.exit ]
  %id_prev.0 = phi float [ 0.000000e+00, %0 ], [ %phitmp3, %fdiv32.exit ]
  %speed_ref.1 = phi float [ 1.400000e+03, %0 ], [ %speed_ref.0, %fdiv32.exit ]
  %2 = tail call float @read_float32(i8* getelementptr inbounds ([9 x i8]* @.str, i64 0, i64 0)) nounwind
  %3 = tail call float @read_float32(i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0)) nounwind
  %4 = tail call float @read_float32(i8* getelementptr inbounds ([9 x i8]* @.str2, i64 0, i64 0)) nounwind
  %5 = tail call float @read_float32(i8* getelementptr inbounds ([9 x i8]* @.str3, i64 0, i64 0)) nounwind
  %6 = tail call float @read_float32(i8* getelementptr inbounds ([9 x i8]* @.str4, i64 0, i64 0)) nounwind
  %7 = fcmp olt float %speed_ref.1, %5
  br i1 %7, label %8, label %10

; <label>:8                                       ; preds = %1
  %9 = fadd float %speed_ref.1, 5.000000e+00
  br label %14

; <label>:10                                      ; preds = %1
  %11 = fcmp ogt float %speed_ref.1, %5
  br i1 %11, label %12, label %14

; <label>:12                                      ; preds = %10
  %13 = fadd float %speed_ref.1, -5.000000e+00
  br label %14

; <label>:14                                      ; preds = %12, %10, %8
  %speed_ref.0 = phi float [ %9, %8 ], [ %13, %12 ], [ %speed_ref.1, %10 ]
  %15 = fsub float %speed_ref.0, %4
  %16 = fmul float %15, 0x3F0A36E2E0000000
  %17 = fadd float %16, %int_speed_err_temp_2.0
  %18 = fmul float %17, 1.000000e+01
  %19 = fpext float %18 to double
  %20 = fcmp olt double %19, -2.000000e+01
  br i1 %20, label %24, label %21

; <label>:21                                      ; preds = %14
  %22 = fcmp ogt double %19, 2.000000e+01
  br i1 %22, label %24, label %23

; <label>:23                                      ; preds = %21
  br label %24

; <label>:24                                      ; preds = %23, %21, %14
  %int_speed_err.0 = phi float [ %18, %23 ], [ -2.000000e+01, %14 ], [ 2.000000e+01, %21 ]
  %25 = fmul float %15, 5.000000e+00
  %26 = fadd float %int_speed_err.0, %25
  %27 = fcmp olt float %26, -4.000000e+01
  br i1 %27, label %31, label %28

; <label>:28                                      ; preds = %24
  %29 = fcmp ogt float %26, 4.000000e+01
  br i1 %29, label %31, label %30

; <label>:30                                      ; preds = %28
  %phitmp4 = fmul float %26, 0x400AEF9DC0000000
  %phitmp5 = fpext float %phitmp4 to double
  %phitmp6 = bitcast double %phitmp5 to i64
  br label %31

; <label>:31                                      ; preds = %30, %28, %24
  %torque_ref.0 = phi i64 [ %phitmp6, %30 ], [ -4584429388778438656, %24 ], [ 4638942648076337152, %28 ]
  %32 = fpext float %speed_ref.0 to double
  %33 = fcmp ugt double %32, 2.000000e+03
  br i1 %33, label %34, label %50

; <label>:34                                      ; preds = %31
  %35 = fcmp ugt double %32, 2.500000e+03
  br i1 %35, label %40, label %36

; <label>:36                                      ; preds = %34
  %37 = fmul float %speed_ref.0, 0xBF2A36E2E0000000
  %38 = fadd float %37, 0x3FF6666660000000
  %39 = fmul float %38, 0x3FD3333340000000
  br label %50

; <label>:40                                      ; preds = %34
  %41 = fcmp ugt double %32, 3.000000e+03
  br i1 %41, label %46, label %42

; <label>:42                                      ; preds = %40
  %43 = fmul float %speed_ref.0, 0xBF3797CC40000000
  %44 = fadd float %43, 0x3FFCCCCCC0000000
  %45 = fmul float %44, 0x3FD3333340000000
  br label %50

; <label>:46                                      ; preds = %40
  %47 = fmul float %speed_ref.0, 0xBF3B866E40000000
  %48 = fadd float %47, 0x3FFFAE1480000000
  %49 = fmul float %48, 0x3FD3333340000000
  br label %50

; <label>:50                                      ; preds = %46, %42, %36, %31
  %flux_ref.0 = phi float [ %39, %36 ], [ %45, %42 ], [ %49, %46 ], [ 0x3FD3333340000000, %31 ]
  %51 = fadd float %id_prev.0, %flux_rotor_prev.0
  %52 = fmul float %6, 0x3F0A36E2E0000000
  %53 = fadd float %52, %theta_prev.0
  %54 = fmul float %51, 0x40236E2EC0000000
  %55 = fpext float %54 to double
  %tmp15.i.i = bitcast double %55 to i64
  %56 = and i64 %torque_ref.0, 9223372036854775807
  %57 = and i64 %tmp15.i.i, 9223372036854775807
  %58 = icmp eq i64 %56, 0
  br i1 %58, label %62, label %59

; <label>:59                                      ; preds = %50
  %60 = and i64 %tmp15.i.i, 9218868437227405312
  %tmp17.mask.i.i = and i64 %torque_ref.0, 9218868437227405312
  %61 = sub i64 4602678819172646912, %60
  %phitmp.i.i = add i64 %61, %tmp17.mask.i.i
  %phitmp20.i.i = and i64 %phitmp.i.i, 9218868437227405312
  br label %62

; <label>:62                                      ; preds = %59, %50
  %63 = phi i64 [ %phitmp20.i.i, %59 ], [ 0, %50 ]
  %64 = or i64 %tmp15.i.i, 4602678819172646912
  %65 = and i64 %64, 4607182418800017407
  %tmp11.i.i = bitcast i64 %65 to double
  %66 = fmul double %tmp11.i.i, 0x3FFE1E1E20000000
  %67 = fsub double 0x40069696A0000000, %66
  %68 = fmul double %tmp11.i.i, %67
  %69 = fsub double 2.000000e+00, %68
  %70 = fmul double %67, %69
  %71 = fmul double %tmp11.i.i, %70
  %72 = fsub double 2.000000e+00, %71
  %73 = fmul double %70, %72
  %74 = fmul double %tmp11.i.i, %73
  %75 = fsub double 2.000000e+00, %74
  %76 = fmul double %73, %75
  %77 = icmp eq i64 %57, 0
  %or.cond.i.i = or i1 %58, %77
  br i1 %or.cond.i.i, label %iq_err_calc.exit, label %78

; <label>:78                                      ; preds = %62
  %79 = fmul double %tmp11.i.i, %76
  %80 = and i64 %torque_ref.0, 4503599627370495
  %81 = fsub double 2.000000e+00, %79
  %82 = or i64 %63, %80
  %83 = fmul double %76, %81
  %tmp13.i.i = bitcast i64 %82 to double
  %84 = fmul double %tmp13.i.i, %83
  %phitmp19.i.i = bitcast double %84 to i64
  %phitmp21.i.i = and i64 %phitmp19.i.i, 9223372036854775807
  br label %iq_err_calc.exit

iq_err_calc.exit:                                 ; preds = %78, %62
  %85 = phi i64 [ %phitmp21.i.i, %78 ], [ 0, %62 ]
  %86 = xor i64 %torque_ref.0, %tmp15.i.i
  %87 = and i64 %86, -9223372036854775808
  %88 = or i64 %85, %87
  %tmp4.i.i = bitcast i64 %88 to double
  %89 = fptrunc double %tmp4.i.i to float
  %90 = fsub float %flux_ref.0, %51
  %91 = fmul float %90, 0x3F0A36E2E0000000
  %92 = fadd float %91, %int_flux_err_temp_2.0
  %93 = fmul float %92, 2.500000e+01
  %94 = fcmp olt float %93, -1.000000e+00
  br i1 %94, label %98, label %95

; <label>:95                                      ; preds = %iq_err_calc.exit
  %96 = fcmp ogt float %93, 1.000000e+00
  br i1 %96, label %98, label %97

; <label>:97                                      ; preds = %95
  br label %98

; <label>:98                                      ; preds = %97, %95, %iq_err_calc.exit
  %int_flux_err.0 = phi float [ %93, %97 ], [ -1.000000e+00, %iq_err_calc.exit ], [ 1.000000e+00, %95 ]
  %99 = fmul float %90, 6.500000e+01
  %100 = fadd float %int_flux_err.0, %99
  %101 = fcmp olt float %100, -2.000000e+00
  br i1 %101, label %.thread12, label %102

; <label>:102                                     ; preds = %98
  %103 = fcmp ogt float %100, 2.000000e+00
  br i1 %103, label %.thread12, label %104

; <label>:104                                     ; preds = %102
  %phitmp = fpext float %100 to double
  %phitmp7 = bitcast double %phitmp to i64
  %105 = and i64 %phitmp7, 9223372036854775807
  %106 = icmp eq i64 %105, 0
  br i1 %106, label %fdiv32.exit, label %.thread12

.thread12:                                        ; preds = %104, %102, %98
  %phitmp20.i15.in = phi i64 [ %phitmp7, %104 ], [ -4611686018427387904, %98 ], [ 4611686018427387904, %102 ]
  %107 = and i64 %phitmp20.i15.in, 9223372036854775807
  %tmp13.i = bitcast i64 %107 to double
  %108 = fmul double %tmp13.i, 0x3FF3C349DF64B9D1
  %phitmp19.i = bitcast double %108 to i64
  %phitmp21.i = and i64 %phitmp19.i, 9223372036854775807
  br label %fdiv32.exit

fdiv32.exit:                                      ; preds = %.thread12, %104
  %flux_add.0911 = phi i64 [ %phitmp20.i15.in, %.thread12 ], [ %phitmp7, %104 ]
  %109 = phi i64 [ %phitmp21.i, %.thread12 ], [ 0, %104 ]
  %110 = and i64 %flux_add.0911, -9223372036854775808
  %111 = or i64 %109, %110
  %tmp4.i = bitcast i64 %111 to double
  %112 = fptrunc double %tmp4.i to float
  tail call void @write_float32(i8* getelementptr inbounds ([10 x i8]* @.str5, i64 0, i64 0), float %112) nounwind
  tail call void @write_float32(i8* getelementptr inbounds ([10 x i8]* @.str6, i64 0, i64 0), float %89) nounwind
  tail call void @write_float32(i8* getelementptr inbounds ([10 x i8]* @.str7, i64 0, i64 0), float %53) nounwind
  tail call void @write_float32(i8* getelementptr inbounds ([10 x i8]* @.str8, i64 0, i64 0), float %51) nounwind
  %phitmp1 = fmul float %51, 0x3FEFFBE760000000
  %phitmp2 = fmul float %2, 0x3FE9E83E40000000
  %phitmp3 = fmul float %phitmp2, 0x3F40624DE0000000
  br label %1
}

declare float @read_float32(i8*)

declare void @write_float32(i8*, float)
