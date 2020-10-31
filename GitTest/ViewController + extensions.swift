//
//  ViewController + extensions.swift
//  GitTest
//
//  Created by Владимир Бабич on 30.10.2020.
//

import Foundation
import UIKit


extension ViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange textSearched: String){
        self.repoCount = 15
        self.group.enter()
        let queue = DispatchQueue(label: "searchBar", attributes: .concurrent)
        queue.async {
            self.fetchData(from: textSearched, stars: .asc)
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
}

extension ViewController: UITableViewDelegate{
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let text = self.searchBar.text, text != "", self.repoCount < 30{
            self.repoCount += 15
            self.group.enter()
            let queue = DispatchQueue(label: "scrollView", attributes: .concurrent)
            queue.async {
                self.fetchData(from: text, stars: .asc)
            }
        }
    }
}

extension ViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let repo = self.repo, let items = repo.items else { return 0 }
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        guard let repo = self.repo, let items = repo.items else {
            return cell
        }
        
        cell.title.text = items[indexPath.row].name
        cell.desc.text = items[indexPath.row].url
        return cell
    }
    
    
}
