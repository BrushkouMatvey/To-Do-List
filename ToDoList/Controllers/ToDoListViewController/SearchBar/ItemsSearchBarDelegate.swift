//
//  Delegate.swift
//  ToDoList
//
//  Created by Matvey Brushkou on 24.01.24.
//

import Foundation
import UIKit
import CoreData

extension ItemsViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        if searchBar.text?.count == 0{
            loadItems(categoryPredicate)
            
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
            return
        }
        
        searchItems(with: searchText)
    }
    
    func searchItems(with str: String){
        
        let compoundPredicate = NSCompoundPredicate(
            andPredicateWithSubpredicates: [NSPredicate(format: "message CONTAINS[cd] %@", str)]
        )
        
        loadItems(
            compoundPredicate,
            [NSSortDescriptor(key: "message", ascending: true)]
        )
    }
}
