//
//  Sign_inUp_view.swift
//  Jamiyah_app
//
//  Created by Faisal Alkhotaifi on 5/26/17.
//  Copyright © 2017 F3Deve. All rights reserved.
//

import UIKit

class Sign_inUp_view: UIViewController {
    @IBOutlet weak var seg_control: UISegmentedControl!
    @IBOutlet weak var signIn_container: UIView!
    @IBOutlet weak var signUp_container: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seg_control.setTitleTextAttributes([NSFontAttributeName:UIFont(name: "Muslimah", size: 14)!], for: .normal)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func segment_switch(_ sender: Any) {
        switch seg_control.selectedSegmentIndex {
        case 0:
            signUp_container.isHidden = true
            signIn_container.isHidden = false
        case 1:
            signUp_container.isHidden = false
            signIn_container.isHidden = true
        default:
            break
        }
    }
}
