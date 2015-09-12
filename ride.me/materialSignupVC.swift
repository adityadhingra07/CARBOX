//
//  materialSignupVC.swift
//  ride.me
//
//  Created by Aditya Dhingra on 8/14/15.
//  Copyright (c) 2015 Aditya Dhingra. All rights reserved.
//

import Foundation
import Parse
import UIKit

class MaterialSignupVC: UIViewController{
    
   
    @IBAction func resignKeyboard(sender: AnyObject) {
        sender.resignFirstResponder()
    }
    //For hiding keyboard
    
    @IBAction func cancelbtn(sender: UIStoryboardSegue) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
        //This is for using the cancel button
    }
    
    @IBAction func signupbtn(sender: AnyObject) {
        SignUp()
    }
    
    @IBOutlet var nameTF: UITextField!
    @IBOutlet var emailTF: UITextField!
    @IBOutlet var usernameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var phoneTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
            
            }
    
    
    func SignUp(){
        var usrname = self.usernameTF.text
        var pass = self.passwordTF.text
        var phone = self.phoneTF.text
        var user = PFUser()
        user["fullname"] = nameTF.text!
        user.username = usernameTF.text!
        user.password = passwordTF.text!
        user.email = emailTF.text!
        user["phone"] = phoneTF.text!
        
        if (count(usrname.utf16) < 5 || count(pass.utf16) < 6){
            
            var alert = UIAlertView(title: "Invalid", message: "Username must be greater than 5 and Password must be greater then 6", delegate: self, cancelButtonTitle: "OK")
            alert.show()
            
        }
        else if(count(phone.utf16) != 10){
            var alert = UIAlertView(title: "Invalid", message: "Invalid Phone Number!", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }
        else{
            user.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
                if error == nil {
                    // Hooray! Let them use the app now.
                    var alert = UIAlertView(title: "Success!", message: "New User created. Welcome to RIDE.ME", delegate: self, cancelButtonTitle: "OK")
                    alert.show()
                    self.dismissViewControllerAnimated(true, completion: nil)
                } else {
                    var alert = UIAlertView(title: "Oops!", message: error?.localizedDescription, delegate: self, cancelButtonTitle: "OK")
                    alert.show()
                }
            }}
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}