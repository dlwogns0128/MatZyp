//
//  MatZypListViewController.swift
//  MatZyp
//
//  Created by archane on 2016. 11. 6..
//  Copyright © 2016년 CodersHigh. All rights reserved.
//

import UIKit

class MatZypListViewController: UITableViewController {
    
    
    var location:Location?
    var setting:Setting?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // matzypList.append(hanyangchone)
       // matzypList.append(alchone)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.title = location?.name[(setting?.getLanguage())!]
        //self.navigationItem.title = "\(location!.name[0]) 정보"
        //타이틀은 네비게이션 아이템의 타이틀이 없을 경우 뷰 컨트롤러의 타이틀을 자동으로 사용
        
    }

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
        guard let rowCount = location?.matzyps?.count else{
            return 0
        }
        return rowCount
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MatzypCell", for: indexPath)
        
        guard let matzyp = location?.matzyps?[indexPath.row] else{
            return cell
        }
        cell.textLabel?.text = matzyp.name[(setting?.getLanguage())!]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return location?.name[(setting?.getLanguage())!]
    }
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        guard let rowCount = location?.matzyps?.count else{
            return "0개의 맛집"
        }
        return "\(rowCount)개의 맛집"
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        guard let destination = segue.destination as? UITabBarController , let selectedIndex = self.tableView.indexPathForSelectedRow?.row, let matzyp = location?.matzyps?[selectedIndex] else{
            return
        }
        
        guard let info_tab = destination.viewControllers?[0] as? InfoListViewController,
            let menu_tab = destination.viewControllers?[1] as? MenuListViewController else {
                return
            }
    
        info_tab.matzyp = matzyp
        info_tab.setting = setting
        
        menu_tab.matzyp = matzyp
        menu_tab.setting = setting
        
        /*
        if segue.identifier == "MenuSegue" {
            if let destination = segue.destination as? MenuListViewController {
                if let selectedIndex = self.tableView.indexPathForSelectedRow?.row {
                    destination.matzyp = (location?.matzyps?[selectedIndex])! as Matzyp
                }
            }
        }*/
    }
    

}
