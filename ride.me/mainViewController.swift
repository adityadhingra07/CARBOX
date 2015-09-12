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

class mainViewController: UIViewController {
    
    @IBOutlet weak var username: UILabel!
    
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
 
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //USER INFO FOR STATS
        var currentusername = PFUser.currentUser()?.username
        var email = PFUser.currentUser()?.email
        
        var currentUser: AnyObject? = PFUser.currentUser()?.username
        if currentUser != nil{
            var name = currentUser as? String
            self.username.text = "Hey, " + name!
        }
        else{
            dispatch_async(dispatch_get_main_queue()){
                var Storyboard = UIStoryboard(name: "Main", bundle: nil)
                var mainVC : UIViewController = Storyboard.instantiateViewControllerWithIdentifier("mainVC") as! UIViewController
                self.presentViewController(mainVC, animated: true, completion: nil)}
        }
        
        
    }
    
    
}