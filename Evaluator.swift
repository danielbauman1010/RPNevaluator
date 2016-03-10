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
                    case .unaryOP(let symbol,let operation):
                        if let a = stack.pop() {
                            if (symbol == "sqrt" && a < 0) {
                                print("cannot preform square root of a negative number")
                                print("\(stack) H")
                            } else {
                                stack.push(operation(Double(a)))
                                print("\(stack) H")
                            }
                        } else {
                            print("There weren't enough numbers for this operation")
                        }
                    case .binaryOP(let symbol, let operation):
                        if let a = stack.pop() {
                            if let b = stack.pop() {
                                if(symbol == "/") {
                                    if(a != 0) {
                                        stack.push(operation(b,a))
                                        print("\(stack) H")
                                    } else {
                                        print("Cannot devide by zero.")
                                    }
                                } else {
                                    stack.push(operation(b,a))
                                    print("\(stack) H")
                                }
                                
                            } else {
                                print("There weren't enough numbers for this operation")
                            }
                        } else {
                            print("There weren't enough numbers for this operation")
                        }
                    }
                } else {
                    print("invalid input \" \(item) \"")
                }
            }
        }
        return stack
    }
}