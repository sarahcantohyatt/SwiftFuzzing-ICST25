// RUN: %empty-directory(%t)
// RUN: %target-swift-frontend %s -typecheck -module-name Functions -clang-header-expose-decls=all-public -emit-clang-header-path %t/functions.h
// RUN: %FileCheck %s < %t/functions.h

// RUN: %check-interop-cxx-header-in-clang(%t/functions.h)

// CHECK-LABEL: namespace Functions SWIFT_PRIVATE_ATTR SWIFT_SYMBOL_MODULE("Functions") {

// CHECK-LABEL: namespace _impl {

// CHECK: SWIFT_EXTERN void $s9Functions17passIntReturnVoid1xys5Int32V_tF(int x) SWIFT_NOEXCEPT SWIFT_CALL; // passIntReturnVoid(x:)
// CHECK: SWIFT_EXTERN int $s9Functions016passTwoIntReturnD01x1ys5Int32VAF_AFtF(int x, int y) SWIFT_NOEXCEPT SWIFT_CALL; // passTwoIntReturnInt(x:y:)
// CHECK: SWIFT_EXTERN int $s9Functions016passTwoIntReturnD10NoArgLabelys5Int32VAD_ADtF(int, int) SWIFT_NOEXCEPT SWIFT_CALL; // passTwoIntReturnIntNoArgLabel(_:_:)
// CHECK: SWIFT_EXTERN int $s9Functions016passTwoIntReturnD19NoArgLabelParamNameys5Int32VAD_ADtF(int x2, int y2) SWIFT_NOEXCEPT SWIFT_CALL; // passTwoIntReturnIntNoArgLabelParamName(_:_:)
// CHECK: SWIFT_EXTERN void $s9Functions014passVoidReturnC0yyF(void) SWIFT_NOEXCEPT SWIFT_CALL; // passVoidReturnVoid()

// CHECK: }

public func passIntReturnVoid(x: CInt) { print("passIntReturnVoid \(x)") }

// CHECK: SWIFT_INLINE_THUNK void passIntReturnVoid(int x) noexcept SWIFT_SYMBOL("s:9Functions17passIntReturnVoid1xys5Int32V_tF") {
// CHECK: return _impl::$s9Functions17passIntReturnVoid1xys5Int32V_tF(x);
// CHECK: }

public func passTwoIntReturnInt(x: CInt, y: CInt) -> CInt { return x + y }

// CHECK: SWIFT_INLINE_THUNK int passTwoIntReturnInt(int x, int y) noexcept SWIFT_SYMBOL("s:9Functions016passTwoIntReturnD01x1ys5Int32VAF_AFtF") SWIFT_WARN_UNUSED_RESULT {
// CHECK: return _impl::$s9Functions016passTwoIntReturnD01x1ys5Int32VAF_AFtF(x, y);
// CHECK: }

public func passTwoIntReturnIntNoArgLabel(_: CInt, _: CInt) -> CInt {
  print("passTwoIntReturnIntNoArgLabel")
  return 42
}

// CHECK: SWIFT_INLINE_THUNK int passTwoIntReturnIntNoArgLabel(int _1, int _2) noexcept SWIFT_SYMBOL("s:9Functions016passTwoIntReturnD10NoArgLabelys5Int32VAD_ADtF") SWIFT_WARN_UNUSED_RESULT {
// CHECK: return _impl::$s9Functions016passTwoIntReturnD10NoArgLabelys5Int32VAD_ADtF(_1, _2);
// CHECK: }

public func passTwoIntReturnIntNoArgLabelParamName(_ x2: CInt, _ y2: CInt) -> CInt { return x2 + y2 }

// CHECK: SWIFT_INLINE_THUNK int passTwoIntReturnIntNoArgLabelParamName(int x2, int y2) noexcept SWIFT_SYMBOL("s:9Functions016passTwoIntReturnD19NoArgLabelParamNameys5Int32VAD_ADtF") SWIFT_WARN_UNUSED_RESULT {
// CHECK:   return _impl::$s9Functions016passTwoIntReturnD19NoArgLabelParamNameys5Int32VAD_ADtF(x2, y2);
// CHECK: }

public func passVoidReturnVoid() { print("passVoidReturnVoid") }

// CHECK: SWIFT_INLINE_THUNK void passVoidReturnVoid() noexcept SWIFT_SYMBOL("s:9Functions014passVoidReturnC0yyF") {
// CHECK: return _impl::$s9Functions014passVoidReturnC0yyF();
// CHECK: }

// CHECK: SWIFT_INLINE_THUNK void varFunctionSameName
public func varFunctionSameName(_ x: CInt) {}

public var varFunctionSameName: CInt = 0
