//
//  Friends_ViewController.swift
//  Jamiyah_app
//
//  Created by Faisal Alkhotaifi on 5/26/17.
//  Copyright © 2017 F3Deve. All rights reserved.
//

import UIKit

class Friends_ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchField: UISearchBar!
    
    var name = ["Faisal", "Omar"]
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.layer.cornerRadius = 5.0
        
//        searchController.searchResultsUpdater = self
//        searchController.dimsBackgroundDuringPresentation = false
//        definesPresentationContext = true
//        tableView.tableHeaderView = searchController.searchBar
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friends_cell", for: indexPath) as! FriendsCell_TableViewCell
        cell.name_label.text = name[indexPath.row]
        return cell
    }
    
}
