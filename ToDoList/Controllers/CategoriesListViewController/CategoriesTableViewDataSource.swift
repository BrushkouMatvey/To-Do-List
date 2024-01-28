//
//  CategoriesTableViewDataSource.swift
//  ToDoList
//
//  Created by Matvey Brushkou on 28.01.24.
//

import Foundation
import UIKit

// MARK: TableView DataSource methods
extension CategoriesViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemsContainer.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.categoryCellIdentifier, for: indexPath)
        
        let item = itemsContainer[indexPath.row]
        
        cell.textLabel?.text = item.name
        
        return cell
    }
}
