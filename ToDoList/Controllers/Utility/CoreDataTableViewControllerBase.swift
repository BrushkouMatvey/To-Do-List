//
//  TableViewBase.swift
//  ToDoList
//
//  Created by Matvey Brushkou on 28.01.24.
//

import Foundation
import UIKit
import CoreData

class CoreDataTableViewControllerBase<TEntity: NSManagedObject> : UITableViewController, CoreDataViewControllerProtocol, CellIdentifiable{
    
    let itemsContainer = CoreDataContainer<TEntity>()
    
    var cellIdentifier: String { fatalError("cellIdentifier must be overridden in subclass") }
    
    // MARK: DataSource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsContainer.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let item = itemsContainer[indexPath.row]
        
        if let configurableCell = cell as? CellConfigurable{
            configurableCell.configure(with: item)
        }
        
        return cell
    }

}
