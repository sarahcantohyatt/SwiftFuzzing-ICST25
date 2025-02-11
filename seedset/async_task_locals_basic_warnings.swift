// RUN: %empty-directory(%t)
// RUN: %target-swift-frontend -emit-module -emit-module-path %t/OtherActors.swiftmodule -module-name OtherActors %S/Inputs/OtherActors.swift -disable-availability-checking
// RUN: %target-typecheck-verify-swift -I %t  -disable-availability-checking -warn-concurrency -parse-as-library
// REQUIRES: concurrency

// REQUIRES: concurrency

@available(SwiftStdlib 5.1, *)
actor Test {

  @TaskLocal static var local: Int?

  func run() async {
    // This should NOT produce any warnings, the closure withValue uses is @Sendable:
    await Test.$local.withValue(42) {
      await work()
    }
  }

  func work() async {
    print("Hello \(Test.local ?? 0)")
  }
}
