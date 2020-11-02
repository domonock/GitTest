//
//  ViewController.swift
//  GitTest
//
//  Created by Владимир Бабич on 30.10.2020.
//

import UIKit

class ViewController: ParentControllerViewController {
    let tableView = UITableView()
    let searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchBar.searchBarStyle = .prominent
        self.searchBar.placeholder = " Search..."
        self.searchBar.sizeToFit()
        self.searchBar.isTranslucent = false
        self.searchBar.backgroundImage = UIImage()
        self.searchBar.showsCancelButton = true
        self.searchBar.delegate = self
        self.tableView.tableHeaderView = searchBar
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        let margins = self.view.layoutMarginsGuide
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 0).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: 0).isActive = true
        self.tableView.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 0).isActive = true
        self.tableView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0).isActive = true
        
        self.view.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: margins.centerYAnchor)
        ])
    }
}
