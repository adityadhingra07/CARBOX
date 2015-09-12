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

class ANMTDloginViewController: UIViewController, UITextFieldDelegate, RoadwayLoginViewDelegate {
    
    
    @IBOutlet var roadsign: RoadwayLoginView!
    @IBAction func resignKeyboard(sender: AnyObject) {
        sender.resignFirstResponder()
    }
    //For hiding keyboard
    
    @IBAction func unwindToViewController(sender: UIStoryboardSegue) {
        self.dismissViewControllerAnimated(true, completion: nil)
        //This is for using the cancel button
    }
    @IBOutlet var usernameTF: MKTextField!
    @IBOutlet var passwordTF: MKTextField!
    @IBAction func loginBTN(sender: AnyObject) {
        
        LogIn()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        roadsign.roadwayloginViewDelegate = self
        roadsign.addShowuploginAnimation()
        
        // No border, no shadow, floatingPlaceholderEnabled
        usernameTF.layer.borderColor = UIColor.clearColor().CGColor
        usernameTF.floatingPlaceholderEnabled = true
        usernameTF.placeholder = "Username.."
        usernameTF.tintColor = UIColor.MKColor.Blue
        usernameTF.rippleLocation = .Right
        usernameTF.cornerRadius = 0
        usernameTF.bottomBorderEnabled = true
        usernameTF.attributedPlaceholder = NSAttributedString(string:"Username..",
            attributes:[NSForegroundColorAttributeName: UIColor.orangeColor()])
        usernameTF.delegate = self
        
        passwordTF.layer.borderColor = UIColor.clearColor().CGColor
        passwordTF.floatingPlaceholderEnabled = true
        passwordTF.placeholder = "Password.."
        passwordTF.tintColor = UIColor.MKColor.Blue
        passwordTF.rippleLocation = .Right
        //passwordTF.rippleLayerColor = UIColor.MKColor.Yellow
        passwordTF.cornerRadius = 0
        passwordTF.bottomBorderEnabled = true
        //self.view.backgroundColor = UIColor.orangeColor()
        passwordTF.attributedPlaceholder = NSAttributedString(string:"Password..",
            attributes:[NSForegroundColorAttributeName: UIColor.orangeColor()])
        passwordTF.delegate = self
        
    }
    
    func loginbuttonPressed(loginbutton: UIButton){
        LogIn()
    }
    
    func LogIn(){
        var usrname = self.usernameTF.text
        var pass = self.passwordTF.text
        var user = PFUser()
        user.username = self.usernameTF.text!
        user.password = self.passwordTF.text!
        
        if (count(usrname.utf16) < 5 || count(pass.utf16) < 6) {
            
            //var alert = UIAlertView(title: "Invalid", message: "usernameTF must be greater than 5 and passwordTF must be greater then 6", delegate: self, cancelButtonTitle: "OK")
            //alert.show()
            SCLAlertView().showWarning("Invalid", subTitle: "usernameTF must be greater than 5 and passwordTF must be greater then 6")
            
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
                   // var alert = UIAlertView(title: "Something went wrong...", message:"Invalid usernameTF or passwordTF.", delegate: self, cancelButtonTitle: "OK")
                    // alert.show()
                    SCLAlertView().showWarning("Something went wrong...", subTitle: "Something went wrong...giInvalid usernameTF or passwordTF.")
                }
            })}
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}