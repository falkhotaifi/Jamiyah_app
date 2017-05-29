//
//  MainView_ViewController.swift
//  Jamiyah_app
//
//  Created by Faisal Alkhotaifi on 5/26/17.
//  Copyright © 2017 F3Deve. All rights reserved.
//

import UIKit
import Firebase
import SWSegmentedControl

class MainView_ViewController: UIViewController {
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    @IBOutlet weak var seg_control: SWSegmentedControl!
    @IBOutlet weak var jamiyahList: UIView!
    @IBOutlet weak var friendsList: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenus()
        checkIfuserLoggedIn()
    }
    
    func checkIfuserLoggedIn(){
        let uid = FIRAuth.auth()?.currentUser?.uid
        FIRDatabase.database().reference().child("Users").child("User UID\(uid!)").observeSingleEvent(of: .value, with: { (snapchat) in
            let value = snapchat.value as? NSDictionary
            let username = value?["Username"] as? String ?? ""
            self.navigationItem.title = username
            
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func sideMenus(){
        if revealViewController() != nil {
            menuBtn.target = revealViewController()
            menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 200
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    @IBAction func segSwitchValue(_ sender: Any) {
        switch seg_control.selectedSegmentIndex {
        case 0:
            jamiyahList.isHidden = true
            friendsList.isHidden = false
        case 1:
            jamiyahList.isHidden = false
            friendsList.isHidden = true
        default:
            break
        }
    }

    @IBAction func addNewJamiyah(_ sender: Any) {
        self.performSegue(withIdentifier: "moveToAddJamiyah", sender: nil)
    }
    
}
