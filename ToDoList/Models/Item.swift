//
//  Item.swift
//  ToDoList
//
//  Created by Matvey Brushkou on 21.01.24.
//

import Foundation

class Item: Codable{
    
    var message: String
    var isComplete: Bool
    
    init(_ message: String, _ isDone: Bool) {
        self.message = message
        self.isComplete = isDone
    }
    
    func switchIsDone() {
        isComplete = !isComplete
    }
}
