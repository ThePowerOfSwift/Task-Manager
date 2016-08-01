//
//  ViewController.swift
//  TaskManager
//
//  Created by Mihail Șalari on 8/1/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Properties

    @IBOutlet weak var textField: UITextField!
    
    let dataController = DataController.sharedInstance
    
    
    // MARK: - Lyfe Cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.textField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.textField.resignFirstResponder()
        return true
    }
    
    // MARK: - @IBAction's

    @IBAction func cancel(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func save(sender: UIBarButtonItem) {
        guard let text = textField.text else { return }
        
        if text != "" {
            
            let item = NSEntityDescription.insertNewObjectForEntityForName(Constants.ViewController.Item, inManagedObjectContext: dataController.managedObjectContext) as! Item
            
            item.text = text
            dataController.saveContacts()
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }

}

