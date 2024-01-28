//
//  CoreDataSaveLoadService.swift
//  ToDoList
//
//  Created by Matvey Brushkou on 23.01.24.
//

import Foundation
import CoreData

class CoreDataContainer<T: NSManagedObject>{

    var items = [T]()
    var count: Int { items.count }
    
    init() {
        load()
    }
    
    subscript(index: Int) -> T { items[index] }
    
    func createAndAddEntity() -> T? {
        guard let context = AppHelper.coreDataContext else { return nil }
        
        let item = T(context: context)
        items.append(item)
        return item
    }
    
    func load(_ predicate: NSCompoundPredicate? = nil, _ sortDescriptors: [NSSortDescriptor] = []) {
                        
        guard let entityName else {
            print("Return entityName")
            return
        }
        
        let request = NSFetchRequest<T>(entityName: entityName)
        
        if let predicate { request.predicate = predicate }
        request.sortDescriptors = sortDescriptors
        
        guard let context else {
            print("Return context")
            return
        }

        do{
            items = try context.fetch(request)
        }catch{
            print("Can't fetch context")
        }
    }
        
    func save() {
        do{
            try context?.save()
        }catch{
            print("Can't save context : \(error)")
        }
    }
    
    private let context = AppHelper.coreDataContext
    
    private var entityName: String? {
        guard let name = T.entity().name else {
            print("Can not get entityName for entity \(T.Type.self)")
            return nil
        }
        return name
    }
}
