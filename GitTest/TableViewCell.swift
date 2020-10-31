//
//  TableViewCell.swift
//  SomeData
//
//  Created by Владимир Бабич on 29.09.2020.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!
    var isTapped = false
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
}
