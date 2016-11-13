//
//  MenuCell.swift
//  MatZyp
//
//  Created by archane on 2016. 11. 13..
//  Copyright © 2016년 CodersHigh. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {
    
    //Properties
    @IBOutlet weak var menuImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
