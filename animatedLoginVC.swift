//
//  animatedloginvc.swift
//  ride.me
//
//  Created by Aditya Dhingra on 8/2/15.
//  Copyright (c) 2015 Aditya Dhingra. All rights reserved.
//

import Foundation
import Parse
import UIKit

class ANMTDloginViewController: UIViewController, RoadwayLoginViewDelegate {
    
    @IBOutlet var roadsign: RoadwayLoginView!
    @IBAction func resignKeyboard(sender: AnyObject) {
        sender.resignFirstResponder()
    }
    //For hiding keyboard
    
    @IBAction func unwindToViewController(sender: UIStoryboardSegue) {
        self.dismissViewControllerAnimated(true, completion: nil)
        //This is for using the cancel button
    }
    @IBOutlet var usernameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBAction func loginBTN(sender: AnyObject) {
        
        LogIn()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        roadsign.roadwayloginViewDelegate = self
        roadsign.addShowuploginAnimation()
    }
    
    func loginbuttonPressed(loginbutton: UIButton){
        LogIn()
    }
    
    func LogIn(){
        var usrname = self.usernameTF.text
        var pass = self.passwordTF.text
        var user = PFUser()
        user.username = usernameTF.text!
        user.password = passwordTF.text!
        
        if (count(usrname.utf16) < 5 || count(pass.utf16) < 6) {
            
            //var alert = UIAlertView(title: "Invalid", message: "Username must be greater than 5 and Password must be greater then 6", delegate: self, cancelButtonTitle: "OK")
            //alert.show()
            SCLAlertView().showWarning("Invalid", subTitle: "Username must be greater than 5 and Password must be greater then 6")
            
        }
        else{
            PFUser.logInWithUsernameInBackground(usernameTF.text, password: passwordTF.text, block: {
                (User: PFUser?, Error: NSError?) -> Void in
                
                if Error == nil{
                    var alert = UIAlertView(title: "Woohoo!", message:"Logged in Successfully", delegate: self, cancelButtonTitle: "OK")
                    alert.show()
                    //Need to connect the main view controller here after login
                    dispatch_async(dispatch_get_main_queue()){
                        var Storyboard = UIStoryboard(name: "Main", bundle: nil)
                        var mainViewController : UIViewController = Storyboard.instantiateViewControllerWithIdentifier("mainViewController") as! UIViewController
                        self.presentViewController(mainViewController, animated: true, completion: nil)
                    }//FIXED
                }
                else{
                   // var alert = UIAlertView(title: "Something went wrong...", message:"Invalid username or password.", delegate: self, cancelButtonTitle: "OK")
                    // alert.show()
                    SCLAlertView().showWarning("Something went wrong...", subTitle: "Something went wrong...giInvalid username or password.")
                }
            })}
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}