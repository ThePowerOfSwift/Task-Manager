//
//  CoreDataStack.swift
//  TaskManager
//
//  Created by Mihail Șalari on 8/1/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import Foundation
import CoreData

public class DataController: NSObject {
    
    
    // MARK: - Properties
    
    static let sharedInstance = DataController()
    
    private override init() {}
    
    private lazy var applicationDocumentsDirectory: NSURL = {
       let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        
       return urls[urls.endIndex.predecessor()]
    }()
    
    private lazy var managedObjectModel: NSManagedObjectModel = {
        let modelURL = NSBundle.mainBundle().URLForResource(Constants.CoreDataStack.URLForResource, withExtension: Constants.CoreDataStack.WithExtension)!
        
        return NSManagedObjectModel(contentsOfURL: modelURL)!
    }()
    
    private lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent(Constants.CoreDataStack.URLByAppendingPathComponent)
        
        do {
            try coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil)
        } catch {
            let userInfo: [String: AnyObject] = [
                NSLocalizedDescriptionKey: Constants.CoreDataStack.NSLocalizedDescriptionKeyError,
                NSLocalizedFailureReasonErrorKey: Constants.CoreDataStack.NSLocalizedFailureReasonErrorKeyError,
                NSUnderlyingErrorKey: error as NSError]
            
            let wrapperError = NSError(domain: Constants.DomainError, code: Constants.Code, userInfo: userInfo)
            print("Unresolved error \(wrapperError). \(wrapperError.userInfo)")
            abort()
        }
        
        return coordinator
    }()
    
    public lazy var managedObjectContext: NSManagedObjectContext = {
        let coordinator = self.persistentStoreCoordinator
        let managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        
        managedObjectContext.persistentStoreCoordinator = coordinator
        
        return managedObjectContext
    }()
    
    
    // MARK: - Save Data
    
    public func saveContacts() {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch let error as NSError {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
}