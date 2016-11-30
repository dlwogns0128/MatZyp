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
    var firstChildTabVC: InfoListViewController?
    var secondChildTabVC: MenuListViewController?
    var thirdChildTabVC: ReviewTableViewController?
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var segmentedControl: customSegmentedControl!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = matzyp?.name[(setting?.getLanguage())!]
        segmentedControl.initUI()
        segmentedControl.selectedSegmentIndex = TabIndex.FirstChildTab.rawValue
        displayCurrentTab(tabIndex: TabIndex.FirstChildTab.rawValue)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
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
    
    func viewControllerForSelectedSegmentIndex(index: Int) -> UITableViewController? {
        var vc: UITableViewController?
        switch index {
        case 0 :
            if firstChildTabVC == nil {
                firstChildTabVC = self.storyboard?.instantiateViewController(withIdentifier: "Info") as! InfoListViewController?
            }
            firstChildTabVC?.matzyp = matzyp
            firstChildTabVC?.setting = setting
            vc = firstChildTabVC
        case 1 :
            if secondChildTabVC == nil {
                secondChildTabVC = self.storyboard?.instantiateViewController(withIdentifier: "Menu") as! MenuListViewController?
            }
            secondChildTabVC?.matzyp = matzyp
            secondChildTabVC?.setting = setting
            vc = secondChildTabVC

        case 2 :
            if thirdChildTabVC == nil {
                thirdChildTabVC = self.storyboard?.instantiateViewController(withIdentifier: "Review") as! ReviewTableViewController?
            }
            thirdChildTabVC?.matzyp = matzyp
            thirdChildTabVC?.setting = setting
            vc = thirdChildTabVC
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
