//
//  SignIn_ViewController.swift
//  Jamiyah_app
//
//  Created by Faisal Alkhotaifi on 5/26/17.
//  Copyright © 2017 F3Deve. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import Firebase

class SignIn_ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var email_textField: SkyFloatingLabelTextField!
    @IBOutlet weak var password_textField: SkyFloatingLabelTextField!
    var textFields : [SkyFloatingLabelTextField]!

    override func viewDidLoad() {
        super.viewDidLoad()
        email_textField.delegate = self
        email_textField.tag = 1
        email_textField.returnKeyType = UIReturnKeyType.next
        
        password_textField.delegate = self
        password_textField.tag = 2
        password_textField.returnKeyType = UIReturnKeyType.go
        
        // Array of the textFields
        textFields = [email_textField, password_textField]
        
        for textfield in textFields{
            textfield.delegate = self
            textfield.titleLabel.font = UIFont(name: "Muslimah", size: 12)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextfield = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField{
            nextfield.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            return true
        }
        return false
    }

    @IBAction func forgotPassword(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResetPassword")
        self.present(vc!, animated: true, completion: nil)
    }
    
    @IBAction func signIn_button(_ sender: Any) {
        let email = email_textField.text!.lowercased()
        let final_email = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = password_textField.text!
        
        if (final_email.isEmpty || password.isEmpty){
            print("يجب اكمال جميع الحقول 😒")
        } else {
            AuthServices.signIn(email: final_email, password: password, OnSeccuss: {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "MainView")
                self.present(vc!, animated: true, completion: nil)
                print ("Seccussfully signed in")
            }, OnError: { (errorStr) in
                print(errorStr!)
            })
        }
        
    }
    
}
















