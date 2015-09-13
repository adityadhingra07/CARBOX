//
//  settingsVC.swift
//  ride.me
//
//  Created by Aditya Dhingra on 8/12/15.
//  Copyright (c) 2015 Aditya Dhingra. All rights reserved.
//

import Foundation
import UIKit
import Parse

class SettingsVC: UIViewController {
    
    @IBOutlet var emailLBL: UILabel!
    @IBOutlet var phoneLBL: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userPhoto: AvatarImageView!
    
    @IBAction func resetpassword(sender: AnyObject) {
        resetpassword()
    }
    
    @IBAction func changenumber(sender: AnyObject) {
        changephone()
    }
    
    func resetpassword(){
        let email = PFUser.currentUser()?.email
        println(email)
        var alert = UIAlertView(title: "Reset Password", message: "Password reset link sent to " + email!, delegate: self, cancelButtonTitle: "Done")
        alert.show()
        PFUser.requestPasswordResetForEmail(email!)
        
    }
    
    //THIS FUNCTION NEEDS TO BE FIXED (CHANGEPHONE)
    func changephone(){
        var phone: AnyObject? = PFUser.currentUser()?["phone"]
        println(phone)
        //taking input from alert now
        var alert = UIAlertController(title: "Change Phone Number", message: "Enter new number", preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler { (newphone) -> Void in
            newphone.placeholder = "Enter new number"
        }
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action) -> Void in
            let newphone = alert.textFields![0] as! UITextField
            PFUser.currentUser()?["phone"] = newphone.text
        }))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        var currentUser = PFUser.currentUser()
        var tempName = (currentUser?.username)!
        nameLabel.text = currentUser?["fullname"] as? String
        tempName.replaceRange(tempName.startIndex...tempName.startIndex, with: String(tempName[tempName.startIndex]).capitalizedString)
        // usernameLabel.text = tempName
        // set this image at time of signup / signin
        var queryUser = PFUser.query() as PFQuery?
        queryUser!.findObjectsInBackgroundWithBlock {
            (users: [AnyObject]?, error: NSError?) -> Void in
            if error == nil {
                if let users = users as? [PFObject] {
                    for user in users {
                        var user2:PFUser = user as! PFUser
                        if user2.username == currentUser?.username
                        {
                            var userPhotoFile = user2["ProfilePicture"] as! PFFile
                            userPhotoFile.getDataInBackgroundWithBlock { (data, error) -> Void in
                                
                                if let downloadedImage = UIImage(data: data!) {
                                    self.userPhoto.image  = downloadedImage
                                }
                                
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let username = PFUser.currentUser()?.username
        let email = PFUser.currentUser()?.email
        let phone: AnyObject? = PFUser.currentUser()?["phone"]
        if (username != nil){
            self.emailLBL.text = email!
            self.phoneLBL.text = phone as? String
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
