//
//  TabbarViewController.swift
//  MatZyp
//
//  Created by archane on 2016. 11. 30..
//  Copyright © 2016년 CodersHigh. All rights reserved.
//

import UIKit

class TabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //Set tab bar's appearence
        self.tabBar.tintColor = UIColor.black
        self.tabBar.barTintColor = UIColor.white
        self.tabBar.unselectedItemTintColor = UIColor.gray
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
