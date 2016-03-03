//
//  GenericStack.swift
//  RPNEval
//
//  Created by Daniel on 2/25/16.
//  Copyright © 2016 Daniel. All rights reserved.
//

import Foundation
struct Stack<T> : CustomStringConvertible{
    var items: [T]
    var size: Int?
    init(size: Int, fill: T) {
        self.items = [T](count: size, repeatedValue: fill)
        self.size = size
    }
    
    init(size: Int) {
        self.items = [T]()
        self.size = size
    }
    
    init() {
        self.items = [T]()
        self.size = nil
    }
    
    func isEmpty()->Bool {
        return self.items.count == 0
    }

    func isFull()->Bool {
        if (self.size != nil) {
            return self.items.count == self.size!
        }
        return false
    }
    
    mutating func push(element: T) {
        self.items.append(element)
    }
    
    mutating func pop() -> T? {
        if !isEmpty(){
            return self.items.removeLast()
        }
        return nil
    }
    
    var description: String {
        var str = ""
        for item in self.items {
            str += "\(item) "
        }
        return str
    }
}




