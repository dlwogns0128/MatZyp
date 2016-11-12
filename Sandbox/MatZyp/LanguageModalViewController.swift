//
//  LanguageModalViewController.swift
//  MatZyp
//
//  Created by hyu on 2016. 11. 11..
//  Copyright © 2016년 CodersHigh. All rights reserved.
//

import UIKit

class LanguageModalViewController: UITableViewController {

    //var setting : Setting?
    var language : Language?
    
    @IBOutlet weak var check1: UISwitch!
    @IBOutlet weak var check2: UISwitch!
    @IBOutlet weak var check3: UISwitch!
    var checkGroup:[Language : UISwitch] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        check1.isOn = false
        check2.isOn = false
        check3.isOn = false

        checkGroup = [.korean:check1, .english:check2, .chinese:check3]
        //checkGroup[.korean] = check1
        //checkGroup[.english] = check2
        //checkGroup[.chinese] = check3
        checkGroup[language!]?.isOn = true
        
        
        
        //checkGroup[.korean]?.isOn = true
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    */
    @IBAction func changeCheck1(_ sender: UISwitch) {
        if (sender.isOn == true){
            //sender.isOn = true
            check2.isOn = false
            check3.isOn = false
            language = .korean
        }
    }
    @IBAction func changeCheck2(_ sender: UISwitch) {
        if (sender.isOn == true){
            check1.isOn = false
            check3.isOn = false
            language = .english
        }
    }

    @IBAction func changeCheck3(_ sender: UISwitch) {
        if (sender.isOn == true){
            check1.isOn = false
            check2.isOn = false
            language = .chinese
        }
    }
    
    @IBAction func languageDone(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func noChange(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LanguageUnwindSegue" {
            guard let locationListViewC = segue.destination as? LocationListViewController else{
                return
            }
            locationListViewC.setLanguage(lang: language!)
        }
    }
 

}
