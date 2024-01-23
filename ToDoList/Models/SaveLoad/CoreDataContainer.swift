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
    
    func load() {
                
        guard let entityName else { return }
        let request = NSFetchRequest<T>(entityName: entityName)
    
        guard let context else { return }

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
