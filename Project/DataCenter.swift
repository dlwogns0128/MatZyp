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
    //var location_ : String
    var homepage : String? = nil
    var business_hour : String
    //var img_ : UIImage
    var menus : [Menu]? //Menu class
    var rate : Float = 0.0
    
    init(name:[Language:String]) {
        self.name = name
        self.number = ""
        self.business_hour = ""
    }
    
    init(name : [Language : String], number : String, /*location : String,*/ homepage : String,
         business_hour : String /*img : UIImage, menu : Menu*/) {
        self.name = name
        self.number = number
        //location_ = location
        self.homepage = homepage
        self.business_hour = business_hour
        //img_ = img
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

class Menu{
    var name :[Language:String]
    var price:Int
    init(name:[Language:String], price:Int) {
        self.name = name
        self.price = price
    }
}


let dataCenter:DataCenter = DataCenter()
class DataCenter {
    var setting:Setting
    var locations:[Location] = []
    init() {
        let hanyangChone_menu1 = Menu(name: [.korean:"고추장불고기",.english:"영어_고추장불고기",.chinese:"중국어_고추장불고기"], price: 5500)
        let hanyangChone_menu2 = Menu(name: [.korean:"순두부찌개",.english:"영어",.chinese:"중국어"], price: 5000)
        let hanyangChone_menu3 = Menu(name: [.korean:"된장찌개",.english:"영어",.chinese:"중국어"], price: 5000)
        let alchone_menu1 = Menu(name: [.korean:"알밥",.english:"영어",.chinese:"중국어"], price: 3800)
        let alchone_menu2 = Menu(name: [.korean:"치즈알밥",.english:"영어",.chinese:"중국어"], price: 4500)
        
        let hanyangChone = Matzyp(name: [.korean:"한양촌",.english:"영어",.chinese:"중국어"])
        let alchone = Matzyp(name: [.korean:"알촌",.english:"영어",.chinese:"중국어"])
        
        hanyangChone.menus = [hanyangChone_menu1,hanyangChone_menu2,hanyangChone_menu3]
        alchone.menus = [alchone_menu1,alchone_menu2]
        
        let location1 = Location(name: [.korean:"왕십리",.english:"영어",.chinese:"중국어"])
        let location2 = Location(name: [.korean:"홍대",.english:"영어",.chinese:"중국어"])
        let location3 = Location(name: [.korean:"노원구",.english:"영어",.chinese:"중국어"])
        let location4 = Location(name: [.korean:"건대",.english:"영어",.chinese:"중국어"])
        
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
