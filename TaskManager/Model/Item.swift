//
//  Item.swift
//  TaskManager
//
//  Created by Mihail Șalari on 8/1/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import Foundation
import CoreData


class Item: NSManagedObject {

// Insert code here to add functionality to your managed object subclass

    static let Identifier = "Item"
    
    static let fetchRequest: NSFetchRequest = {
        let request = NSFetchRequest(entityName: Item.Identifier)
        let sortDescriptor = NSSortDescriptor(key: "text", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }()
}
