//
//  MatZypListTableViewCell.swift
//  MatZyp
//
//  Created by archane on 2016. 11. 13..
//  Copyright © 2016년 CodersHigh. All rights reserved.
//

import UIKit

class MatZypListTableViewCell: UITableViewCell {

    //MARK: Properties
    @IBOutlet weak var reviewCount: UILabel!
    @IBOutlet weak var MainImageView: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var TimeLabel: UILabel!
    @IBOutlet weak var rating: CosmosView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
