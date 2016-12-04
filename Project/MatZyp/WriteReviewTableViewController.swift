//
//  WriteReviewTableViewController.swift
//  MatZyp
//
//  Created by archane on 2016. 11. 25..
//  Copyright © 2016년 CodersHigh. All rights reserved.
//

import UIKit

class WriteReviewTableViewController: UITableViewController, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var rating: RatingControl!
    @IBOutlet weak var userReview: UITextView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var imageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userReview.textContainer.maximumNumberOfLines = 3
        userReview.textContainer.lineBreakMode = .byWordWrapping
        userReview.delegate = self
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: #selector(WriteReviewTableViewController.tap))
        self.view.addGestureRecognizer(tapRecognizer)
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Hide keyboard
    func tap(gesture: UITapGestureRecognizer) {
        userReview.resignFirstResponder()
    }
    
    func makeReview() -> Review? {
        let review = Review()

        if userReview.text.isEmpty {
            print("empty")
            return nil
        } else {
            review.text.text = userReview.text
        }

        if let temp = userImage.image {
            review.image = temp
        }
        
        return review
    }
    @IBAction func pickImage(_ sender: Any) {
        // Hide the keyboard.
        userReview.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    private func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        // The info dictionary contains multiple representations of the image, and this uses the original.
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            // Set photoImageView to display the selected image.
            userImage.image = selectedImage
        }
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveClick(_ sender: Any) {
        guard let review = makeReview() else {
            self.dismiss(animated: true, completion: nil)
            return
        }
        
        switch self.presentingViewController {
            case let tabBarC as UITabBarController:
                if let navigationC = tabBarC.selectedViewController as? UINavigationController, let segviewC = navigationC.topViewController as? SegViewController, let reviewC = segviewC.currentViewController as? ReviewTableViewController {
                    reviewC.addNewReview(review: review)
                    }
            case let navigationC as UINavigationController:
                if let segviewC = navigationC.topViewController as? SegViewController, let reviewC = segviewC.currentViewController as? ReviewTableViewController {
                    reviewC.addNewReview(review: review)
                    }
            case let reviewC as ReviewTableViewController:
                reviewC.addNewReview(review: review)
            default:
                break
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func cancelClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }



    // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch(indexPath.row) {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath)
                return cell
            default: print("hello")
                    return UITableViewCell()
        }
        
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
