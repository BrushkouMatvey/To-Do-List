//
//  Item.swift
//  ToDoList
//
//  Created by Matvey Brushkou on 21.01.24.
//

import Foundation

class Item: Codable{
    
    var message: String
    var isDone: Bool
    
    init(_ message: String, _ isDone: Bool) {
        self.message = message
        self.isDone = isDone
    }
    
    func switchIsDone() {
        isDone = !isDone
    }
    
}
