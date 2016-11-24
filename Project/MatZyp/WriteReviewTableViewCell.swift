//
//  WriteReviewTableViewCell.swift
//  MatZyp
//
//  Created by archane on 2016. 11. 25..
//  Copyright © 2016년 CodersHigh. All rights reserved.
//

import UIKit

class WriteReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var ratingControl: RatingControl!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
