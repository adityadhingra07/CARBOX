//
//  mainViewController.swift
//  ride.me
//
//  Created by Aditya Dhingra on 8/11/15.
//  Copyright (c) 2015 Aditya Dhingra. All rights reserved.
//

import Foundation
import UIKit
import Parse

class mainViewController: UIViewController, ButtonsloadViewDelegate {
    
    @IBOutlet weak var usernameSTS: UILabel!
    @IBOutlet weak var emailSTS: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var buttons: ButtonsloadView!
    
    var shown = false
    
    func logoutPressed(logout: UIButton){
        PFUser.logOut()
        var currentUser = PFUser.currentUser()
        if currentUser == nil{
            dispatch_async(dispatch_get_main_queue()){
                var Storyboard = UIStoryboard(name: "Main", bundle: nil)
                var mainVC : UIViewController = Storyboard.instantiateViewControllerWithIdentifier("mainVC") as! UIViewController
                self.presentViewController(mainVC, animated: true, completion: nil)
            }
        }
    }
    
    func helpPressed(help: UIButton){
        var alert = UIAlertView(title: "Oops!", message: "We are currently working on this feature.", delegate: self, cancelButtonTitle: "Done")
        alert.show()
    }
    
    func feedbackPressed(feedback: UIButton){
        var alert = UIAlertView(title: "Oops!", message: "We are currently working on this feature.", delegate: self, cancelButtonTitle: "Done")
        alert.show()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        buttons.buttonsloadViewDelegate = self
        buttons.addButtonsloadAnimation()
        
        //USER INFO FOR STATS
        var currentusername = PFUser.currentUser()?.username
        var email = PFUser.currentUser()?.email
        
        var currentUser: AnyObject? = PFUser.currentUser()?["fullname"]
        if currentUser != nil{
            var name = currentUser as? String
            self.username.text = "Hey, " + name!
            self.usernameSTS.text = "Username: " + currentusername!
            self.emailSTS.text = "Email ID: " + email!
        }
        else{
            dispatch_async(dispatch_get_main_queue()){
                var Storyboard = UIStoryboard(name: "Main", bundle: nil)
                var mainVC : UIViewController = Storyboard.instantiateViewControllerWithIdentifier("mainVC") as! UIViewController
                self.presentViewController(mainVC, animated: true, completion: nil)}
        }
        
        
    }
    
    
}