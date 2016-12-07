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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = self.tabBarController?.tabBar.items?[0].title
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rowCount = dataCenter.locations.count
        return rowCount
    }

    
    @IBAction func locationTurnOn(_ sender: UIBarButtonItem) {
            
            let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let vc : UIViewController = storyboard.instantiateViewController(withIdentifier: "GMapView")
            
            self.navigationController!.pushViewController(vc, animated: true)
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath)

        let location = dataCenter.locations[indexPath.row]
        //get language
        let lang = dataCenter.setting.getLanguage()
        cell.textLabel?.text = location.name[lang]

        return cell
    }
    

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
