//
//  main.swift
//  RPNEval
//
//  Created by Daniel on 2/25/16.
//  Copyright © 2016 Daniel. All rights reserved.
//

import Foundation

var test = "35 15 + 7 * 3.5 / sqrt"
let eval = Evaluator()
print("First test:")
print(eval.rpEval(test))
var secondTest = "35 15 blablabla + 7 * 3.5 / sqrt"
print("")
print("Second test:")
print(eval.rpEval(secondTest))
var thirdTest = "312 + 12 55 * sqrt"
print("")
print("Third test:")
print(eval.rpEval(thirdTest))