//
//  main.swift
//  SwiftOptionals
//
//  Created by Guilherme Wahlbrink on 2019-03-06.
//  Copyright © 2019 Guilherme Wahlbrink. All rights reserved.
//

import Foundation

print("Hello, World!")

enum Optional<T> {
    case none
    case some(val:T)
}

var hello: String?
var hello1: Optional<String> = .none

var hi: String? = "hi"

var hi1: Optional<String> = .some(val: "hi")


print(hello!)

switch hello1 {
    case .none:
        print("Throw Exception, Crash!")
    case .some(let value):
    print(value)
}



if let hello = hello{
    print (hello)
}


switch hello1 {
    case .none: print("It is nil!")
    case .some(let value): print(value)
}


// nil-coalesing (Optional Defaulting)

let x: String? = nil

var y = x ?? "hello"

var xx:Optional<String> = .none

switch xx {
case .none: y = "hello"
case .some(let val): y = val
}

