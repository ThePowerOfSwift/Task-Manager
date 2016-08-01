//
//  Item+CoreDataProperties.swift
//  TaskManager
//
//  Created by Mihail Șalari on 8/1/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Item {

    @NSManaged var completed: Bool
    @NSManaged var text: String?

}
