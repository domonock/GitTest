//
//  ViewController + extensions.swift
//  GitTest
//
//  Created by Владимир Бабич on 30.10.2020.
//

import Foundation
import UIKit


extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        guard let textSearched = searchBar.text else { return }
        if textSearched.isEmpty {
            self.items = []
            return
        }
        
        showHUD()
        
        DataManager.shared.search(textSearched) { [weak self] (result) in
            guard let self = self else { return }
            guard searchBar.text == textSearched else { return }
            
            switch result {
            case .success(let items):
                self.items = items
            case .failure(let error):
                self.showError(error)
            }
            self.hideHud()
            self.tableView.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
}

extension ViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        cell.title.text = items[indexPath.row].name
        cell.desc.text = items[indexPath.row].owner?.login
        return cell
    }
}
