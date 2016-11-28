//
//  ThirdCell.swift
//  MatZyp
//
//  Created by archane on 2016. 11. 25..
//  Copyright © 2016년 CodersHigh. All rights reserved.
//

import UIKit
import GoogleMaps

class ThirdCell: UITableViewCell {

    @IBOutlet weak var LocalMap: UIView!
    var googleMapsView: GMSMapView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
