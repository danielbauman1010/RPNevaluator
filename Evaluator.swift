//
//  Evaluator.swift
//  RPNEval
//
//  Created by Daniel on 2/25/16.
//  Copyright © 2016 Daniel. All rights reserved.
//

import Foundation
class Evaluator {
    func rpEval(input: String) -> Stack<Double>{
        enum Token {
            case unaryOP(symbol: String, operation: ((Double) -> (Double)))
            case binaryOP(symbol: String, operation: (Double,Double) -> (Double))
        }
        let inputArr = input.componentsSeparatedByString(" ")
  
        var ops = [
            "+": Token.binaryOP(symbol: "+", operation: +),
            "-": Token.binaryOP(symbol: "-", operation: -),
            "*": Token.binaryOP(symbol: "*", operation: *),
            "/": Token.binaryOP(symbol: "/", operation: /),
            "sqrt": Token.unaryOP(symbol: "sqrt", operation: sqrt)
        ]
        let size = inputArr.count
        var stack = Stack<Double>(size: size)
        for item in inputArr {
            if let number = Double(item) {
                stack.push(number)
                print("\(stack) H")
            } else {
                if (ops[item] != nil) {
                    switch ops[item]!{
                    case .unaryOP(_,let operation):
                        stack.push(operation(Double(stack.pop()!)))
                        print("\(stack) H")
                    case .binaryOP(_, let operation):
                        let a = stack.pop()!
                        let b = stack.pop()!
                        stack.push(operation(b,a))
                        print("\(stack) H")
                    }
                } else {
                    print("invalid input \" \(item) \"")
                }
            }
        }
        return stack
    }
}