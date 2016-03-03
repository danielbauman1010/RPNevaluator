//
//  GenericStack.swift
//  RPNEval
//
//  Created by Daniel on 2/25/16.
//  Copyright © 2016 Daniel. All rights reserved.
//

import Foundation
class Node<T> {
    let data: T
    var next: Node?
    
    init(data: T){
        self.data = data
    }
}
struct Stack<T> : CustomStringConvertible{
    var size: Int
    var head: Node<T>?
    init(size: Int, fill: T) {
        self.size = size
        self.head = Node(data: fill)
    }
    init(size: Int) {
        self.size = size
        self.head = nil
    }
    func isEmpty()->Bool {
        return self.head == nil
    }
    func isFull()->Bool {
        if(isFullH(head) == self.size) {
            return true
        }
        return false
    }
    func isFullH(c: Node<T>?)->Int{
        if(c == nil){
            return 0
        } else {
            return 1 + isFullH(c!.next)
        }
    }
    mutating func push(element: T) {
        if(self.isEmpty()) {
            self.head = Node(data: element)
        } else {
            let temp = self.head
            self.head = Node(data: element)
            self.head!.next = temp
            if(isFullH(self.head) > self.size) {
                self.size = self.size + 1
            }
        }
    }
    
    mutating func pop()-> T? {
        if(isEmpty()) {
            return nil
        } else {
            let temp = self.head!
            self.head = self.head!.next
            return temp.data
        }
    }
    
    var description: String {
        if(isEmpty()) {
            return "empty"
        }
        return descriptionH(head!)
    }
    
    func descriptionH(c: Node<T>) -> String {
        if(c.next == nil) {
            return "\(c.data)"
        } else {
            return "\(descriptionH(c.next!)) \(c.data)"
        }
    }
}




