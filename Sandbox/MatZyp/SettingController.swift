//
//  SettingController.swift
//  MatZyp
//
//  Created by hyu on 2016. 11. 12..
//  Copyright © 2016년 CodersHigh. All rights reserved.
//
/*
 setting calss를 따로 두고 tab bar controller 로 설정에 들어가 언어 변경하는 기능을 만들고 싶었지만
 언어 변경을 한 후에 동기화가 되지 않는 문제가 발생(tab 끼리 data를 refresh하는 방법을 찾지못함)
 따라서 일단 보관용으로 넣어둠. 추후에 방법을 찾으면 활용할 예정
*/


import UIKit

class SettingController: UITableViewController {
    
    
    @IBOutlet weak var check1: UISwitch!
    @IBOutlet weak var check2: UISwitch!
    @IBOutlet weak var check3: UISwitch!
    var lang : Language = dataCenter.setting.getLanguage()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("hi")
        
        check1.isOn = false
        check2.isOn = false
        check3.isOn = false
        if(lang == .korean){
            check1.isOn = true
        }
        else if (lang == .english){
            check2.isOn = true
        }
        else {
            check3.isOn = true
        }
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
    
    @IBAction func changeCheck1(_ sender: Any) {
   // }
   // @IBAction func changeCheck1(_ sender: Any) {
        if(check1.isOn) {
            check2.isOn = false
            check3.isOn = false
            lang = .korean
        }
    }
    @IBAction func changeCheck2(_ sender: Any) {
    //}
    //@IBAction func changeCheck2(_ sender: Any) {
        if(check2.isOn){
            check1.isOn = false
            check3.isOn = false
            lang = .english
        }
    }
    @IBAction func changeCheck3(_ sender: Any) {
        if(check3.isOn){
            check1.isOn = false
            check2.isOn = false
            lang = .chinese
        }
    }
    @IBAction func changeLanguage(_ sender: Any) {
        dataCenter.setting.setLanguage(set_lang: lang)
        //self.tableView.reloadData()
        //super.tableView.reloadData()
        super.viewWillAppear(true)
        tableView.reloadData()
        print("hi")
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
