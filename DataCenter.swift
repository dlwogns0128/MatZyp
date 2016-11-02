//
//  DataCenter.swift
//  MatZyp
//
//  Created by hyu on 2016. 11. 1..
//  Copyright © 2016년 CodersHigh. All rights reserved.
//

import Foundation
import UIKit

class Matzyp
{
    var name:[Int:String]
    var region:[Int:String]
    var img:UIImage
    var info:Info
    
    init(name:[Int:String],region:[Int:String],img:UIImage, info:Info) {
        self.name = name
        self.region = region
        self.img = img
        
        let nInfo = Info(typeOfFood: info.typeOfFood,homepage: info.homepage,businessHour: info.businessHour,imgs: info.imgs,menu: info.menu)
        self.info = nInfo
    }
    
    func setLang (lang:Int)
    {
        
    }
}

class Info
{
    var typeOfFood:[Int:String]
    var homepage:URL
    var businessHour:String
    var imgs:[UIImage]
    var menu:[Int:[String:Int]]
    
    init(typeOfFood:[Int:String],homepage:URL,businessHour:String,imgs:[UIImage],menu:[Int:[String:Int]]) {
        self.typeOfFood = typeOfFood
        self.homepage = homepage
        self.businessHour = businessHour
        self.imgs = imgs
        self.menu = menu
    }
}

class seting
{
    var lang:Int
}
