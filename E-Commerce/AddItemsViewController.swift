//
//  AddItemsViewController.swift
//  E-Commerce
//
//  Created by Yuka Katsuki on 10/24/18.
//  Copyright © 2018 Yuka Katsuki. All rights reserved.
//

import UIKit
import SQLite

class AddItemsViewController: UIViewController {
    
    var database: Connection!
    
    let itemTable = Table("ITEM")
    let itemId = Expression<Int>("itemId")
    let itemName = Expression<String>("itemName")
    let Description = Expression<String>("Description")
    let price = Expression<Double>("Price")
    
    let createTable = self.itemTable.create { (table) in
        table.column(self.itemId, primaryKey: true)
        table.column(self.itemName)
        table.column(self.Description)
        table.column(self.price)
    }
    
    do{
    try self.database.run(createTable)
    print("Created Table")
    } catch {
    print(error)
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl = documentDirectory.appendingPathComponent("ITEM").appendingPathExtension("sqlite3")
            let database = try Connection(fileUrl.path)
            self.database = database
        } catch{
            print(error)
        }

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
