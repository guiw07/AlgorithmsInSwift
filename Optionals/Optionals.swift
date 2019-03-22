//
//  main.swift
//  SwiftOptionals
//
//  Created by Derrick Park on 2019-03-06.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import Foundation

// How optional is represented
enum Optional<T> {
	case none
	case some(_:T)
}

var hello: String?

var hello1: Optional<String> = .none


// 1. Force Unwrap

var hi: String? = "hi"

var hi1: Optional<String> = .some("hi")

print(hello!)

switch hello1 {
case .none:
	// raise some exception (crash!)
	print("Throw Exception, Crash!")
case .some(let value):
	print(value)
}

// 2. if-let statement (Safely unwrap)

if let hello = hello {
	print(hello)
} else {
	print("It is nil!")
}
switch hello1 {
case .none: print("It is nil!")
case .some(let value): print(value)
}

// 3. Implicitly unwrapped Optional
var hello2: String!
var hello3: Optional<String> = .none

print(hello2)

switch hello3 {
case .none: print("Crash")
case .some(let val): print(val)
}

// 4. nil-coalesing (Optional Defaulting)
var x: String? = nil
// x = .....

var y = x ?? "hello"

var xx:Optional<String> = .none

switch xx {
case .none: y = "hello"
case .some(let val): y = val
}

// 5. Optional Chaining

//let x: String?
//let y = x?.foo()?.bar?.z

//switch x {
//case .none: y = nil
//case .some(let val):
//  switch val.foo() {
//    .none: y = nil
//    .some(let val2):
//      switch val2.bar {
//        .none: y = nil
//        .some(let val3): y = val3.z
//      }
//  }
//}
