//
//  ItemsViewController.swift
//  ToDoList
//
//  Created by Matvey Brushkou on 28.01.24.
//

import Foundation

extension CategoriesViewController{
    
    func loadItems(_ predicate: NSCompoundPredicate? = nil, _ sortDescriptors: [NSSortDescriptor] = []){
        itemsContainer.load(predicate, sortDescriptors)
        tableView.reloadData()
    }
    
    func saveItems(){
        itemsContainer.save()
        tableView.reloadData()
    }
}
