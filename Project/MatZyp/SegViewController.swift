//
//  SegViewController.swift
//  MatZyp
//
//  Created by archane on 2016. 11. 22..
//  Copyright © 2016년 CodersHigh. All rights reserved.
//

import UIKit

class SegViewController: UIViewController {

    var matzyp:Matzyp?
    var setting:Setting?
    
    enum TabIndex : Int {
        case FirstChildTab = 0
        case SecondChildTab = 1
    }

    var currentViewController: UIViewController?
    var firstChildTabVC: UITableViewController?
    var secondChildTabVC: UITableViewController?
    
    @IBOutlet weak var contentView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.selectedSegmentIndex = TabIndex.FirstChildTab.rawValue
        displayCurrentTab(tabIndex: TabIndex.FirstChildTab.rawValue)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func switchTabs(_ sender: UISegmentedControl) {
        self.currentViewController!.view.removeFromSuperview()
        self.currentViewController!.removeFromParentViewController()
        displayCurrentTab(tabIndex: sender.selectedSegmentIndex)
    }
    
    func displayCurrentTab(tabIndex: Int){
        if let vc = viewControllerForSelectedSegmentIndex(index: tabIndex) {
            
            self.addChildViewController(vc)
            vc.didMove(toParentViewController: self)
            vc.view.frame = self.contentView.bounds
            self.contentView.addSubview(vc.view)
            self.currentViewController = vc
            vc.viewWillAppear(true)
        }
    }
    
    func viewControllerForSelectedSegmentIndex(index: Int) -> UIViewController? {
        var vc: UITableViewController?
        switch index {
        case TabIndex.FirstChildTab.rawValue :
            if firstChildTabVC == nil {
                firstChildTabVC = self.storyboard?.instantiateViewController(withIdentifier: "Info") as! InfoListViewController?
            }
            vc = firstChildTabVC
        case TabIndex.SecondChildTab.rawValue :
            if secondChildTabVC == nil {
                secondChildTabVC = self.storyboard?.instantiateViewController(withIdentifier: "Menu") as! MenuListViewController?
            }
            vc = secondChildTabVC
        default:
            return nil
        }
        return vc
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
