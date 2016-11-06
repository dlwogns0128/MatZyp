//
//  DataCenter.swift
//  MatZyp
//
//  Created by hyu on 2016. 11. 1..
//  Copyright © 2016년 CodersHigh. All rights reserved.
//

import Foundation
import UIKit

class Matzyp {
    var name_ : [Int : String]
    var number_ : String
    var location_ : String
    var homepage_ : String? = nil
    var business_hour_ : String
    //var img_ : UIImage
    //var menu_ : Menu //Menu class
    var rate_ : Float = 0.0
    
    init(name : [Int : String], number : String, location : String, homepage : String,
        business_hour : String /*img : UIImage, menu : Menu*/) {
        name_ = name
        number_ = number
        location_ = location
        homepage_ = homepage
        business_hour_ = business_hour
        //img_ = img
        //menu_ = menu
        
    }
    
    /* Calculate current rate
        @param[in] grade input grade */
    func GetRate(grade : Float) {
        rate_ = (rate_ + grade) / 2
    }
    
    func setLang (lang:Int)
    {
        
    }
}

class Menu{}
class Location{}

