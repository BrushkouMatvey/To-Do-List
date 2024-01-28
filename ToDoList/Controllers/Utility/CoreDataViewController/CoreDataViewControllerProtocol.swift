//
//  TableViewCoreDataProtocol.swift
//  ToDoList
//
//  Created by Matvey Brushkou on 28.01.24.
//

import Foundation
import CoreData
import UIKit

protocol CoreDataViewControllerProtocol {
    associatedtype EntityType: NSManagedObject
    
    var itemsContainer: CoreDataContainer<EntityType> { get }
    
    func loadItems(_ predicate: NSCompoundPredicate?, _ sortDescriptors: [NSSortDescriptor])
    func saveItems()
}

// MARK: CoreDataViewController extensions
extension CoreDataViewControllerProtocol where Self: UITableViewController{
    
    func loadItems(_ predicate: NSCompoundPredicate? = nil, _ sortDescriptors: [NSSortDescriptor] = []){
        itemsContainer.load(predicate)
        tableView.reloadData()
    }
    
    func saveItems(){
        itemsContainer.save()
        tableView.reloadData()
    }
}
