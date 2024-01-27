//
//  CoreDataTableViewExtension.swift
//  ToDoList
//
//  Created by Matvey Brushkou on 27.01.24.
//

import Foundation

extension ToDoListViewController{
    
    func loadItems(_ predicate: NSPredicate? = nil, _ sortDescriptors: [NSSortDescriptor] = []){
        toDoItemsContainer.load(predicate, sortDescriptors)
        tableView.reloadData()
    }
    
    func saveItems(){
        toDoItemsContainer.save()
        tableView.reloadData()
    }
}
