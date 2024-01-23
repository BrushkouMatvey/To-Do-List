//
//  SaveLoadable.swift
//  ToDoList
//
//  Created by Matvey Brushkou on 23.01.24.
//

protocol SaveLoadable{
    associatedtype ItemType
    func save()
    func save(_ items: [ItemType])
    func load() -> [ItemType] 
}
