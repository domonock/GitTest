//
//  ParentControllerViewController.swift
//  GitTest
//
//  Created by Владимир Бабич on 30.10.2020.
//

import UIKit

class ParentControllerViewController: UIViewController {
    let activityIndicator = UIActivityIndicatorView()
    var items: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.center = self.view.center
        activityIndicator.style = .large
    }
    
    func showHUD() {
        activityIndicator.startAnimating()
    }
    
    func hideHud() {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }
}

extension UIViewController {
    func showError(_ error: NSError) {
        let alert = UIAlertController(title: "Error: \(error.domain)", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(alert, animated: true)
    }
}
