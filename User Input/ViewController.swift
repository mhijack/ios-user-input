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
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        submitButton.layer.cornerRadius = 5
        
        nameField.delegate = self
        phoneField.delegate = self
        
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: #selector(self.viewTapped))
        self.view.addGestureRecognizer(tapRecognizer)
    }
    
    @IBAction func submitButtonTouched(_ sender: Any) {
        print("submitted")
        
        let name: String = nameField.text ?? ""
        let phone: String = phoneField.text ?? ""
        
        outputLabel.text = """
        name:: \(name)
        phone:: \(phone)
        """
        
        viewTapped()
        
        nameField.text = ""
        phoneField.text = ""
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
    
    @objc func viewTapped() {
        self.view.endEditing(true)
    }
    
    
}

