//
//  TextFileTableViewCell.swift
//  Documents
//
//  Created by Clayton Cornett on 8/27/19.
//  Copyright © 2019 Clayton Cornett. All rights reserved.
//

import UIKit

class TextFileTableViewCell: UITableViewCell {

    @IBOutlet weak var fileNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
