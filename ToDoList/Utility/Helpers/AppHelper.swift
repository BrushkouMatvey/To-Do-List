//
//  AppHelper.swift
//  ToDoList
//
//  Created by Matvey Brushkou on 23.01.24.
//

import UIKit
import CoreData

public class AppHelper{
    
    static var appDelegate: AppDelegate? {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            print("Can't get current App Delegate")
            return nil
        }
        return delegate
    }
    
    static var coreDataContext: NSManagedObjectContext? {
        guard let appDelegate else {
            print("Can't get Core Data Context")
            return nil
        }
        return appDelegate.persistentContainer.viewContext
    }
}
