//
//  LocationListViewController.swift
//  MatZyp
//
//  Created by hyu on 2016. 11. 8..
//  Copyright © 2016년 CodersHigh. All rights reserved.
//

import UIKit

class LocationListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
       
        
    }
/*
     bottom tool bar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationController?.setToolbarHidden(false, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        self.navigationController?.setToolbarHidden(true, animated: animated)
    }
  */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let rowCount = dataCenter.locations.count
        return rowCount
    }

    
    @IBAction func locationTurnOn(_ sender: UIBarButtonItem) {
        let locationAlert = UIAlertController(title: "위치 정보 요청", message: "지도앱에서 위치정보를 제공합니다.", preferredStyle: .actionSheet)
        let locationAction = UIAlertAction(title: "위치 정보 켜기", style: .default, handler: {(action:UIAlertAction) -> Void in
            
            let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let vc : UINavigationController = storyboard.instantiateViewController(withIdentifier: "GMapViewController") as! UINavigationController
            
            self.present(vc, animated: true, completion: nil)
            
        })
        let cancleAction = UIAlertAction(title: "위치 정보 끄기", style: .default, handler: {(action:UIAlertAction) -> Void in print("위치 정보 끄기")})
        
        locationAlert.addAction(locationAction)
        locationAlert.addAction(cancleAction)
        
        self.present(locationAlert, animated: true, completion: nil)
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath)

        let location = dataCenter.locations[indexPath.row]
        //get language
        let lang = dataCenter.setting.getLanguage()
        cell.textLabel?.text = location.name[lang]

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated);
//        self.navigationController?.setToolbarHidden(false, animated: animated)
//   }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated);
//        self.navigationController?.setToolbarHidden(true, animated: animated)
//    }
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    @IBAction func unwindToLocationListView(segue: UIStoryboardSegue){
        print("unwind")
    }
    func setLanguage (lang:Language){
        //print("hihihihi")
        dataCenter.setting.setLanguage(set_lang: lang)
        self.tableView.reloadData()
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MatzypSegue" {
            if let destination = segue.destination as? MatZypListViewController{
                if let selectedIndex = self.tableView.indexPathForSelectedRow?.row {
                    destination.location = dataCenter.locations[selectedIndex] as Location
                    destination.setting = dataCenter.setting as Setting
                }
            }
        }
        if segue.identifier == "LanguageSegue" {
            if let destination = segue.destination as? LanguageModalViewController{
                    destination.language = dataCenter.setting.lang as Language
                    //destination.setting = dataCenter.setting as Setting
            }
            
        }
    }
    

}
