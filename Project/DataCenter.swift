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
    var region : String
    var location : String
    var latitude : Double
    var longitude : Double
    var homepage : String?
    var business_hour : String
    var main_img: UIImage?
    var img : UIImage?
    var menus : [Menu]? //Menu class
    var rate : Float = 0.0
    var reviews: [Review] = []
    
    init(name:[Language:String]) {
        self.name = name
        self.number = ""
        self.location = ""
        self.business_hour = ""
        self.region = ""
        self.latitude = 0.0
        self.longitude = 0.0
    }
    
    init(name : [Language : String], number : String, location : String, homepage : String,
         business_hour : String, main_img: UIImage?,img : UIImage?) {
        self.name = name
        self.number = number
        self.location = location
        self.homepage = homepage
        self.business_hour = business_hour
        
        if let main_image = main_img, let image = img {
            self.main_img = main_image
            self.img = image
        } else {
            self.main_img = nil
            self.img = nil
        }
        //menu_ = menu
        self.region = ""
        self.latitude = 0.0
        self.longitude = 0.0
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

class Review {
    var Id: String
    var text: UITextView
    var date: String
    var rate: Float
    var image: UIImage?
    
    init() {
        self.Id = "NoName"
        self.text = UITextView()
        let format = DateFormatter()
        format.locale = NSLocale(localeIdentifier: "ko_kr") as Locale!
        format.timeZone = NSTimeZone(name: "KST") as TimeZone!
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        self.date = format.string(from: NSDate() as Date)
        self.rate = 0.0
    }
}

class User {
    var id: String
    var profileImage: UIImage?
    
    init() {
        self.id = ""
    }
}
let dataCenter:DataCenter = DataCenter()
class DataCenter {
    var setting:Setting
    var locations:[Location] = []
    let hanyangChone:Matzyp
    let alchone:Matzyp
    let daedosikttang:Matzyp
    let gwangMoon:Matzyp
    init() {
        let hanyangChone_menu1 = Menu(name: [.korean:"고추장불고기",.english:"Spicy bulgogi",.chinese:"辣椒酱烤肉"], price: 5500, img: UIImage(named: "gochu"))
        let hanyangChone_menu2 = Menu(name: [.korean:"순두부찌개",.english:"Soft tofu stew",.chinese:"豆腐脑"], price: 5000, img: UIImage(named: "soon"))
        let hanyangChone_menu3 = Menu(name: [.korean:"된장찌개",.english:"Bean paste stew",.chinese:"大酱汤"], price: 5000, img: UIImage(named: "miso"))
        let alchone_menu1 = Menu(name: [.korean:"알밥",.english:"Rice with fish roe",.chinese:"鱼籽饭"], price: 3800, img: UIImage(named: "eggrice"))
        let alchone_menu2 = Menu(name: [.korean:"치즈알밥",.english:"Rice with fish roe and cheese",.chinese:"奶酪鱼籽饭"], price: 4500, img: UIImage(named: "cheggrice"))
        
        let daedo_menu1 = Menu(name: [.korean:"한우생등심(250g)",.english:"Beef Sirloin",.chinese:"韩式牛里脊肉"], price: 38500, img: UIImage(named: "daedo_koreaCow"))
        let daedo_menu2 = Menu(name: [.korean:"깍두기볶음밥",.english:"Radish kimchi fried rice", .chinese:"萝卜泡菜炒饭"], price: 3000, img: UIImage(named: "daedo_ggakdugi"))
        let daedo_menu3 = Menu(name: [.korean:"된장죽", .english:"Bean paste rice porridge", .chinese:"大酱稀饭"], price: 3000, img: UIImage(named: "daedo_m3"))
        
        let gwangMoon_menu1 = Menu(name: [.korean:"돼지김치찌개",.english:"",.chinese:""], price: 7000, img: UIImage(named:"gwangMoon_kimchi"))
        let gwangMoon_menu2 = Menu(name: [.korean:"제육볶음",.english:"",.chinese:""], price: 10000, img: UIImage(named:"gwangMoon_jeyouk"))
        let gwangMoon_menu3 = Menu(name: [.korean:"계란말이",.english:"",.chinese:""], price: 5000, img: UIImage(named:"gwangMoon_gyeran"))
        let gwangMoon_menu4 = Menu(name: [.korean:"공기밥",.english:"",.chinese:""], price: 1000, img: UIImage(named:"rice"))
        
        
        
        hanyangChone = Matzyp(name: [.korean:"한양촌",.english:"Hanyangchon",.chinese:"汉阳村"])
        hanyangChone.main_img = UIImage(named: "hanyangchone_main")
        hanyangChone.img = UIImage(named: "hanyangchone_sub")
        hanyangChone.region = "성동구/왕십리"
        hanyangChone.location = "서울특별시 성동구 사근동 177-2"
        hanyangChone.business_hour = "09:00 ~ 19:00"
        hanyangChone.number = "02 - 123 - 4567"
        hanyangChone.latitude = 37.5602679
        hanyangChone.longitude = 127.04684799999995
        hanyangChone.homepage = "www.abc.com"
        
        alchone = Matzyp(name: [.korean:"알촌",.english:"Alchon",.chinese:"알촌"])
        alchone.main_img = UIImage(named: "alchone_main")
        alchone.img = UIImage(named: "alchone_sub")
        alchone.region = "성동구/왕십리"
        alchone.location = "서울시 성동구 행당동 19-112"
        alchone.business_hour = "09:00 ~ 21:00"
        alchone.number = "02 - 2292 - 8885"
        alchone.latitude = 37.5585529
        alchone.longitude = 127.04014669999992
        alchone.homepage = "www.alchone.co.kr"
        
        daedosikttang = Matzyp(name: [.korean:"대도식당", .english:"Daedosikttang", .chinese:"大都食堂"])
        daedosikttang.main_img = UIImage(named: "daedo_main" )
        daedosikttang.img = UIImage(named: "daedo_sub")
        daedosikttang.region = "성동구/왕십리"
        daedosikttang.location = "서울 성동구 홍익동 431"
        daedosikttang.business_hour = "11:00 - 22:30"
        daedosikttang.number = "02-2292-9772"
        daedosikttang.latitude = 37.5674710
        daedosikttang.longitude = 127.0306740
        daedosikttang.homepage = "www"
        
        gwangMoon = Matzyp(name: [.korean:"광화문집",.english:"Gwanghwamunjip", .chinese:"矿化文集"])
        gwangMoon.main_img = UIImage(named: "gwangMoon_main")
        gwangMoon.img = UIImage(named: "gwangMoon_sub")
        gwangMoon.region = "광화문/시청"
        gwangMoon.location = "서울 종로구 새문안로5길 12"
        gwangMoon.business_hour = "09:00 - 22:00"
        gwangMoon.number = "02-739-7737"
        gwangMoon.latitude = 37.5713350
        gwangMoon.longitude = 126.9749740
        gwangMoon.homepage = "www"
        
        hanyangChone.menus = [hanyangChone_menu1,hanyangChone_menu2,hanyangChone_menu3]
        alchone.menus = [alchone_menu1,alchone_menu2]
        daedosikttang.menus = [daedo_menu1, daedo_menu2, daedo_menu3]
        gwangMoon.menus = [gwangMoon_menu1,gwangMoon_menu2,gwangMoon_menu3,gwangMoon_menu4]
        
        //let location1 = Location(name: [.korean:"왕십리",.english:"영_왕십리",.chinese:"중_왕십리"])
        //let location2 = Location(name: [.korean:"홍대",.english:"영_홍대",.chinese:"중_홍대"])
        //let location3 = Location(name: [.korean:"노원구",.english:"영_노원구",.chinese:"중_노원구"])
        //let location4 = Location(name: [.korean:"건대",.english:"영_건대",.chinese:"중_건대"])
        let location1 = Location(name: [.korean:"광진/건대입구",.english:"Gwangjin-gu/Konkuk Univ.",.chinese:"广津区/建国大学"])
        let location2 = Location(name: [.korean:"광화문/시청",.english:"Gwanghwamun/City Hall", .chinese:"光化门"])
        let location3 = Location(name: [.korean:"노원/도봉/미아",.english:"Nowon/Dobong-gu/Mia",.chinese:"芦原站/道峰站/弥阿站"])
        let location4 = Location(name: [.korean:"대학로", .english:"Daehangno", .chinese:"大学路"])
        let location5 = Location(name: [.korean:"동대문",.english:"Dongdaemun",.chinese:"东大门"])
        let location6 = Location(name: [.korean:"명동", .english:"Myeongdong", .chinese:"明洞"])
        let location8 = Location(name: [.korean:"성동구/왕십리",.english:"Seongdong-gu/Wangsimni", .chinese:"城东区/往十里"])
        let location7 = Location(name: [.korean:"신촌/이대",.english:"Sinchon/Ewha Womans Univ.",.chinese:"新村站/梨花女子大学"])
        let location9 = Location(name: [.korean:"종로", .english:"Jongno", .chinese:"钟路"])
        
        location1.matzyps = []
        location2.matzyps = [gwangMoon]
        location3.matzyps = []
        location4.matzyps = []
        location5.matzyps = [hanyangChone, alchone, daedosikttang]
        location6.matzyps = [hanyangChone, alchone, daedosikttang]
        location7.matzyps = [hanyangChone, alchone, daedosikttang]
        location8.matzyps = [hanyangChone, alchone, daedosikttang]
        location9.matzyps = []
        
        locations = [location1,location2,location3,location4,location5, location6, location7, location8,location9]
        
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
