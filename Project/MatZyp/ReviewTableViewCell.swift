//
//  ReviewTableViewCell.swift
//  MatZyp
//
//  Created by archane on 2016. 12. 3..
//  Copyright © 2016년 CodersHigh. All rights reserved.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var rating: UIImageView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var userReview: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
