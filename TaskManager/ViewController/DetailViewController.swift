//
//  DetailViewController.swift
//  TaskManager
//
//  Created by Mihail Șalari on 8/1/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Properties

    @IBOutlet weak var textField: UITextField!
    
    var item: Item?
    
    
    // MARK: - Lyfe Cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let item = item else { fatalError(Constants.DetailViewController.FatalError) }
        textField.text = item.text
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
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
    
    
    // MARK: - IBAction's

    @IBAction func save(sender: UIButton) {
        if let item = item {
            item.text = textField.text
            DataController.sharedInstance.saveContacts()
            self.navigationController?.popViewControllerAnimated(true)
        }
    }

}
