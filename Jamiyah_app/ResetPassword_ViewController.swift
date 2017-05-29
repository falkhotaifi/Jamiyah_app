//
//  ResetPassword_ViewController.swift
//  Jamiyah_app
//
//  Created by Faisal Alkhotaifi on 5/26/17.
//  Copyright © 2017 F3Deve. All rights reserved.
//

import UIKit

class ResetPassword_ViewController: UIViewController {
    @IBOutlet weak var email_textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func resetPassword(_ sender: Any) {
        let email = email_textField.text!
        let final_email = email.trimmingCharacters(in: .whitespacesAndNewlines)
        if (final_email.isEmpty){
            print("يجب ادخال الايميل")
        } else {
            AuthServices.reset_password(email: final_email, OnSeccuss: { (confir) in
                print(confir)
                
            }, OnError: { (err) in
                print(err!)
            })
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
