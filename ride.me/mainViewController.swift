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

class mainViewController: UIViewController, ButtonsloadViewDelegate, BWWalkthroughViewControllerDelegate {
    
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
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        if !userDefaults.boolForKey("walkthroughPresented") {
        //if !shown {
            showWalkthrough()
       // }
        userDefaults.setBool(true, forKey: "walkthroughPresented")
        userDefaults.synchronize()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func showWalkthrough(){
        
        // Get view controllers and build the walkthrough
        let stb = UIStoryboard(name: "Walkthrough", bundle: nil)
        let walkthrough = stb.instantiateViewControllerWithIdentifier("walk") as! BWWalkthroughViewController
        let page_zero = stb.instantiateViewControllerWithIdentifier("walk0") as! UIViewController
        let page_one = stb.instantiateViewControllerWithIdentifier("walk1") as! UIViewController
        let page_two = stb.instantiateViewControllerWithIdentifier("walk2")as! UIViewController
        let page_three = stb.instantiateViewControllerWithIdentifier("walk3") as! UIViewController
        
        // Attach the pages to the master
        walkthrough.delegate = self
        walkthrough.addViewController(page_zero)
        walkthrough.addViewController(page_one)
        walkthrough.addViewController(page_two)
        walkthrough.addViewController(page_three)
        
        
        self.presentViewController(walkthrough, animated: true, completion: nil)
    }
    
    
    // MARK: - Walkthrough delegate -
    
    func walkthroughPageDidChange(pageNumber: Int) {
        println("Current Page \(pageNumber)")
    }
    
    func walkthroughCloseButtonPressed() {
        self.dismissViewControllerAnimated(true, completion: nil)
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