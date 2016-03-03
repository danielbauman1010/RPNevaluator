//
//  main.swift
//  RPNEval
//
//  Created by Daniel on 2/25/16.
//  Copyright © 2016 Daniel. All rights reserved.
//

import Foundation

var test = "35 15 + 7 * 3.5 / blabla sqrt"
let eval = Evaluator()
print(eval.rpEval(test))
