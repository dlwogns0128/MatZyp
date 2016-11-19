//
//  InfoListViewController.swift
//  MatZyp
//
//  Created by archane on 2016. 11. 13..
//  Copyright © 2016년 CodersHigh. All rights reserved.
//

import UIKit

class InfoListViewController: UITableViewController {

    var matzyp:Matzyp?
    var setting:Setting?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.tabBarController?.navigationItem.title = matzyp?.name[(setting?.getLanguage())!]
    }
    override func viewDidLayoutSubviews() {
        if let rect = self.navigationController?.navigationBar.frame {
            let y = rect.size.height + rect.origin.y
            self.tableView.contentInset = UIEdgeInsets(top: y,left: 0,bottom: 0,right: 0)
        }
    }
    /* Hide navigation tab only when screen is top*/
    /*
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if scrollView.panGestureRecognizer.translation(in: scrollView).y < 0 {
         //   self.navigationController?.isNavigationBarHidden = false
        } else {
        //    self.navigationController?.isNavigationBarHidden = true
        }
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
        return 6
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch(indexPath.row) {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCell", for: indexPath) as! FirstCell
        
                guard let image = matzyp?.img else{
                    return cell
                }
                self.tableView.rowHeight = 220
                cell.subImageView.image = image
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SecondCell", for: indexPath) as! SecondCell
                self.tableView.rowHeight = 55
                cell.NameLabel.text = matzyp?.name[(setting?.getLanguage())!]
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ThirdCell", for: indexPath) as! ThirdCell
                self.tableView.rowHeight = 40
                cell.LocationLabel.text = matzyp?.location
                return cell
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: "FourthCell", for: indexPath) as! FourthCell
                cell.TimeLabel.text = matzyp?.business_hour
                return cell
            case 4:
                let cell = tableView.dequeueReusableCell(withIdentifier: "FifthCell", for: indexPath) as! FifthCell
                cell.PhoneLabel.text = matzyp?.number
                return cell
            case 5:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SixthCell", for: indexPath) as! SixthCell
                cell.HomeLabel.text = matzyp?.homepage
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SixthCell", for: indexPath) as! SixthCell
                cell.HomeLabel.text = matzyp?.homepage
                return cell
        }
        // Configure the cell...

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
