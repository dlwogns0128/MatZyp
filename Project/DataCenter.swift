//
//  DataCenter.swift
//  MatZyp
//
//  Created by hyu on 2016. 11. 1..
//  Copyright © 2016년 CodersHigh. All rights reserved.
//

import Foundation
import UIKit

enum Language{
    case korean
    case chinese
    case english
}

class Setting{
    var lang:Language
    
    init(lang:Language) {
        self.lang = lang
    }
    
    func setLanguage(set_lang:Language){
        lang = set_lang
    }
    
    func getLanguage() -> Language {
        return lang
    }
}

class Location{
    var name: [Language:String]
    var matzyps :[Matzyp]?
    
    init (name:[Language:String]) {
        self.name = name
    }
}
class Matzyp {
    var name : [Language : String]
    var number : String
    var location : String
    var homepage : String? = nil
    var business_hour : String
    var img : UIImage? = nil
    var menus : [Menu]?  = nil//Menu class
    var rate : Float = 0.0
    
    init(name:[Language:String]) {
        self.name = name
        self.number = ""
        self.location = ""
        self.homepage = nil
        self.business_hour = ""
    }
    
    init(name : [Language : String], number : String, location : String, homepage : String,
        business_hour : String, img : UIImage?) {
        self.name = name
        self.number = number
        self.location = location
        self.homepage = homepage
        self.business_hour = business_hour
        
        if let image = img {
            self.img = image
        } else {
            self.img = nil
        }
        //menu_ = menu
        
    }
    
    /* Calculate current rate
        @param[in] grade input grade */
    func GetRate(grade : Float) {
        rate = (rate + grade) / 2
    }
    
    func setLang (lang:Int)
    {
        
    }
}

class Menu {
    var name :[Language:String]
    var price:Int
    let img: UIImage?
    init(name:[Language:String], price:Int, img: UIImage?) {
        self.name = name
        self.price = price
        if let image = img {
            self.img = image
        } else {
            self.img = nil
        }
        
    }
}


let dataCenter:DataCenter = DataCenter()
class DataCenter {
    var setting:Setting
    var locations:[Location] = []
    init() {
        let hanyangChone_menu1 = Menu(name: [.korean:"고추장불고기",.english:"영_고추장불고기",.chinese:"중_고추장불고기"], price: 5500, img: UIImage(named: "gochu"))
        let hanyangChone_menu2 = Menu(name: [.korean:"순두부찌개",.english:"영_순두부찌개",.chinese:"중_순두부찌개"], price: 5000, img: UIImage(named: "soon"))
        let hanyangChone_menu3 = Menu(name: [.korean:"된장찌개",.english:"영_된장찌개",.chinese:"중_된장찌개"], price: 5000, img: UIImage(named: "miso"))
        let alchone_menu1 = Menu(name: [.korean:"알밥",.english:"영_알밥",.chinese:"중_알밥"], price: 3800, img: UIImage(named: "eggrice"))
        let alchone_menu2 = Menu(name: [.korean:"치즈알밥",.english:"영_치즈알밥",.chinese:"중_치즈알밥"], price: 4500, img: UIImage(named: "cheggrice"))
        
        let hanyangChone = Matzyp(name: [.korean:"한양촌",.english:"영_한양촌",.chinese:"중_한양촌"])
        hanyangChone.img = UIImage(named: "Hanyangchone")
        hanyangChone.location = "서울시 성동구 사근동"
        hanyangChone.business_hour = "09:00 ~ 19:00"
        hanyangChone.number = "02 - 123 - 4567"
        hanyangChone.homepage = "www.abc.com"
        
        let alchone = Matzyp(name: [.korean:"알촌",.english:"영_알촌",.chinese:"중_알촌"])
        
        hanyangChone.menus = [hanyangChone_menu1,hanyangChone_menu2,hanyangChone_menu3]
        alchone.menus = [alchone_menu1,alchone_menu2]
        
        let location1 = Location(name: [.korean:"왕십리",.english:"영_왕십리",.chinese:"중_왕십리"])
        let location2 = Location(name: [.korean:"홍대",.english:"영_홍대",.chinese:"중_홍대"])
        let location3 = Location(name: [.korean:"노원구",.english:"영_노원구",.chinese:"중_노원구"])
        let location4 = Location(name: [.korean:"건대",.english:"영_건대",.chinese:"중_건대"])
        
        location1.matzyps = [hanyangChone, alchone]
        location2.matzyps = [hanyangChone, alchone]
        location3.matzyps = [hanyangChone, alchone]
        location4.matzyps = [hanyangChone, alchone]
        
        locations += [location1, location2, location3, location4]
        
        let set = Setting(lang: .korean)
        setting = set
        
    }
}
/*
var matzypList:[Matzyp] = []

let hanyangchone = Matzyp(name: [0 : "한양촌", 1 : "Hanyangchone", 2 : "중국어"],
                          number: "010-3268-3267", /*location: "성동구 사근동",*/
                          homepage: "www.hanyangchone.co.kr",
                          business_hour: "09:00 ~ 18:00")
let alchone = Matzyp(name:[0:"알촌", 1:"Alchone", 2:"중국어"], number: "02-1234-5678", /*location:"서울시 성동구 행당동",*/ homepage:"www.alchone.com", business_hour:"09:00 ~ 20:00")
*/
