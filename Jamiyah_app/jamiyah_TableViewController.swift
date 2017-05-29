//
//  jamiyah_TableViewController.swift
//  Jamiyah_app
//
//  Created by Faisal Alkhotaifi on 5/26/17.
//  Copyright © 2017 F3Deve. All rights reserved.
//

import UIKit

class jamiyah_TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var groupName = ["جمعية فيصل الخطيفي", "جمعية عمر باقدامه"]
    var shareAmount = ["1234", "520"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jamiyah_cell", for: indexPath) as! jamiyahCell_TableViewCell
        cell.jamiyahName.text = groupName[indexPath.row]
        cell.shareAmount.text = shareAmount[indexPath.row]
        cell.jamiyahIcom.isHidden = false
        return cell
    }
    
}
