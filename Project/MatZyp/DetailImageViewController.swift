//
//  DetailImageViewController.swift
//  MatZyp
//
//  Created by archane on 2016. 12. 6..
//  Copyright © 2016년 CodersHigh. All rights reserved.
//

import UIKit

class DetailImageViewController: UIViewController {

    var image: UIImage?
    @IBOutlet weak var detailImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        detailImage.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func doneClick(_ sender: Any) {
         self.dismiss(animated: true, completion: nil)
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
