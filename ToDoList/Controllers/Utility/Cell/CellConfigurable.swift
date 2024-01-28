//
//  File.swift
//  ToDoList
//
//  Created by Matvey Brushkou on 28.01.24.
//

import CoreData

protocol CellConfigurable{
    func configure(with entity: NSManagedObject)
}
