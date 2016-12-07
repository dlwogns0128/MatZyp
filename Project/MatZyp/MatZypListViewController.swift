//
//  MatZypListViewController.swift
//  MatZyp
//
//  Created by archane on 2016. 11. 6..
//  Copyright © 2016년 CodersHigh. All rights reserved.
//

import UIKit

class MatZypListViewController: UITableViewController, UIViewControllerPreviewingDelegate {
    
    
    var location:Location?
    var setting:Setting?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = location?.name[(setting?.getLanguage())!]
        //For 3d touch
        registerForPreviewing(with: self, sourceView: view)
    
    }
    //3d touch - peek
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location_: CGPoint) -> UIViewController? {
        
        guard let indexPath = tableView.indexPathForRow(at: location_),
            let cell = tableView.cellForRow(at: indexPath) else {
                return nil }
        
        guard let detailViewController =
            storyboard?.instantiateViewController(
                withIdentifier: "Menu") as?
            MenuListViewController else { return nil }
        
        detailViewController.matzyp = location?.matzyps?[indexPath.section]
        detailViewController.setting = setting
        
        previewingContext.sourceRect = cell.frame
        
        return detailViewController
    }
    //3d touch - pop
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        
        show(viewControllerToCommit, sender: self)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        self.title = location?.name[(setting?.getLanguage())!]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        guard let rowCount = location?.matzyps?.count else{
            return 0
        }
        //Use section like a cell
        return rowCount
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    // Set the spacing between sections
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 7
    }
    
    // Make the background color show through
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MatzypCell", for: indexPath) as! MatZypListTableViewCell
        
        guard let matzyp = location?.matzyps?[indexPath.section] else{
            return cell
        }
        cell.MainImageView.image = matzyp.main_img
        cell.NameLabel.text = matzyp.name[(setting?.getLanguage())!]
        cell.TimeLabel.text = matzyp.business_hour
        cell.reviewCount.text = String(matzyp.reviews.count)
        cell.layer.cornerRadius = 8
        cell.rating.rating = matzyp.rate
        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        guard let destination = segue.destination as? SegViewController , let selectedIndex = self.tableView.indexPathForSelectedRow?.section, let matzyp = location?.matzyps?[selectedIndex] else{
            return
        }
        destination.matzyp = matzyp
        destination.setting = setting
        
    }
    

}
