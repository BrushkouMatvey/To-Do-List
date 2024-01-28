//
//  CoreDataTableViewExtension.swift
//  ToDoList
//
//  Created by Matvey Brushkou on 27.01.24.
//

import Foundation

extension ItemsViewController{
    
    func loadItems(
        _ predicate: NSCompoundPredicate? = nil,
        _ sortDescriptors: [NSSortDescriptor] = []){
            
        toDoItemsContainer.load(predicate, sortDescriptors)
        tableView.reloadData()
    }
    
    func saveItems(){
        toDoItemsContainer.save()
        tableView.reloadData()
    }
}
