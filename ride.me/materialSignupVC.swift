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

class MaterialSignupVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
   
    @IBAction func resignKeyboard(sender: AnyObject) {
        sender.resignFirstResponder()
    }
    //For hiding keyboard
    
    @IBAction func cancelbtn(sender: UIStoryboardSegue) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
        //This is for using the cancel button
    }
    
    @IBAction func signupbtn(sender: AnyObject) {
        //self.view.showLoading()
        SignUp()
    }
    
    @IBOutlet weak var imageToPost: AvatarImageView!
    
    
    @IBAction func chooseImage(sender: AnyObject) {
        
        var image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        image.allowsEditing = false
        
        self.presentViewController(image, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        dismissViewControllerAnimated(true, completion:nil)
        println(image)
        imageToPost.image = image
        
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
            
            SCLAlertView().showWarning("Sign Up Info", subTitle: "Username must be greater than 5 vaharacters and password must be greater than 6 characters!")
            
        }
        else if(count(phone.utf16) != 10){
            var alert = UIAlertView(title: "Invalid", message: "Invalid Phone Number!", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }
        else{
            
            let imageData = imageToPost.image?.mediumQualityJPEGNSData
            let imageFile = PFFile(name: "image.png", data: imageData!)
            user["ProfilePicture"] = imageFile
            user.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
                if error == nil {
                    // Hooray! Let them use the app now.
                    //self.dismissViewControllerAnimated(true, completion: nil)
                    self.performSegueWithIdentifier("signedUp", sender: self)
                } else {
                    var alert = UIAlertView(title: "Oops!", message: error?.localizedDescription, delegate: self, cancelButtonTitle: "OK")
                    alert.show()
                }
            }}
    } 
    
//    func SignUp(){
//        var user = PFUser()
//        if usernameTF.text == "" || passwordTF.text == "" {
//            SCLAlertView().showWarning("Sign Up Info", subTitle: "Please include your username and password")
//            self.view.hideLoading()
//        } else {
//            
//            user.username = self.usernameTF.text.lowercaseString
//            user.password = self.passwordTF.text
//            
//            let imageData = imageToPost.image?.mediumQualityJPEGNSData
//            
//            let imageFile = PFFile(name: "image.png", data: imageData!)
//            
//            user["ProfilePicture"] = imageFile
//            //                user.email = "email@example.com"
//            //                // other fields can be set just like with PFObject
//            //                user["phone"] = "415-392-0202"
//            //
//            //var collection = self.childViewControllers[0] as! Comments
//            user.signUpInBackgroundWithBlock {
//                (succeeded: Bool, error: NSError?) -> Void in
//                if let error = error {
//                    let errorString = error.userInfo?["error"] as? NSString
//                    // Show the errorString somewhere and let the user try again.
//                    SCLAlertView().showWarning("SignUp Error", subTitle: errorString! as String)
//                    self.view.hideLoading()
//                } else {
//                    self.view.hideLoading()
//                    //self.performSegueWithIdentifier("signedUp2", sender: self)
//                    self.dismissViewControllerAnimated(true, completion: nil)
//                    SCLAlertView().showInfo("Signed Up", subTitle: "Let's Get Going!", closeButtonTitle: "Ok", duration: 2)
//                }
//            }
//        }
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    
    
    
    
}

extension UIImage {
    
    var highestQualityJPEGNSData:NSData { return UIImageJPEGRepresentation(self, 1.0) }
    var highQualityJPEGNSData:NSData    { return UIImageJPEGRepresentation(self, 0.75)}
    var mediumQualityJPEGNSData:NSData  { return UIImageJPEGRepresentation(self, 0.5) }
    
    var lowQualityJPEGNSData:NSData     { return UIImageJPEGRepresentation(self, 0.25)}
    
    var lowestQualityJPEGNSData:NSData  { return UIImageJPEGRepresentation(self, 0.0) }
    
}