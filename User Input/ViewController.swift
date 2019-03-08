//
//  ViewController.swift
//  User Input
//
//  Created by Jack Chen on 2019-03-07.
//  Copyright © 2019 Jack Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        submitButton.layer.cornerRadius = 5
        
        nameField.delegate = self
        phoneField.delegate = self
        
    }
    
    @IBAction func submitButtonTouched(_ sender: Any) {
        print("submitted")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == nameField {
            textField.resignFirstResponder()
            phoneField.becomeFirstResponder()
        } else {
            phoneField.resignFirstResponder()
            submitButtonTouched(self)
        }
        
        print("You hit enter key")
        return true;
    }
    
    
}

