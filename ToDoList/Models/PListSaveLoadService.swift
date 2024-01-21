//
//  SaveLoadService.swift
//  ToDoList
//
//  Created by Matvey Brushkou on 22.01.24.
//

import Foundation

class PListSaveLoadService<T: Codable>{
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(Constants.dataFileName)
    
    func loadArray() -> [T]{
        
        var items = [T]()
        if let data = try? Data(contentsOf: dataFilePath!){
            
            let decoder = PropertyListDecoder()
            do{
                items = try decoder.decode([T].self, from: data)
            }catch{
                print("Can't load data : \(error)")
            }
        }
        
        return items
    }
    
    func saveArray(_ items: [T]){
        let encoder = PropertyListEncoder()
        do{
            let data = try encoder.encode(items)
            try data.write(to: dataFilePath!)
        }catch{
            print("Can't save data : \(error)")
        }
    }
}
