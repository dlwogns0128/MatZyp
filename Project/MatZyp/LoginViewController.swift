//
//  LoginViewController.swift
//  MatZyp
//
//  Created by archane on 2016. 11. 29..
//  Copyright © 2016년 CodersHigh. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var email: UILabel!
    
    var dict : [String:AnyObject]!
    
    let loginButton: FBSDKLoginButton = {
        let button = FBSDKLoginButton()
        button.readPermissions = ["email"]
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(loginButton)
        loginButton.center.x = view.center.x
        loginButton.center.y = view.bounds.height - 2 * (self.tabBarController?.tabBar.frame.height)!
        
        loginButton.delegate = self
        
        if let token = FBSDKAccessToken.current() {
            fetchProfile()
        }
        
    }
    
    func fetchProfile() {
        print("fetch profile")
        
        let parameters = ["fileds": "id, name, email, first_name, last_name, picture.type(large)"]
        FBSDKGraphRequest(graphPath: "me", parameters: parameters).start(completionHandler: { (connection, result, error) -> Void in
            
            if (error != nil) {
                print("Error: \(error)")
                return
            }
            guard let dict = result as? [String:AnyObject] else { return }
            self.dict = dict
            let name = self.dict["name"] as! String
            let id = self.dict["id"] as! String
            self.userName.text = name
            let profileURL = URL(string: "https://graph.facebook.com/\(id)/picture?type=large")!
            
            do {
                let data = try Data(contentsOf: profileURL)
                self.profileImage.image = UIImage(data:data)
            } catch{}
            
            let user = User()
            user.id = id
            user.name = name
            user.profileImage = self.profileImage.image
            dataCenter.user = user
        })
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        fetchProfile()
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("log out")
        dataCenter.user = nil
    }
    
    func loginButtonWillLogin(_ loginButton: FBSDKLoginButton!) -> Bool {
        print("log in")
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
