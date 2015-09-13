//
//  driveVC.swift
//  ride.me
//
//  Created by Aditya Dhingra on 8/10/15.
//  Copyright (c) 2015 Aditya Dhingra. All rights reserved.
//

import Foundation
import UIKit
import Parse

class driveVC: UIViewController, UITextFieldDelegate {
    
    var Day = NSDate()
    
    // TO INPUTS
    
    @IBOutlet var cityto: MKTextField!
    @IBOutlet var stateto: MKTextField!
    @IBOutlet var zipto: MKTextField!
    
    // FROM INPUTS
    @IBOutlet var cityfrom: MKTextField!
    @IBOutlet var statefrom: MKTextField!
    @IBOutlet var zipfrom: MKTextField!
    var strDate = "9/12/15"
    // DATE INPUT
    
    @IBOutlet var datepick: UIDatePicker!
    @IBAction func datepicker(sender: AnyObject) {
        var date:NSDate = datepick.date
        
        Day = NSCalendar.currentCalendar().startOfDayForDate(date)
        var dateFormatter = NSDateFormatter()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        strDate = dateFormatter.stringFromDate(datepick.date)
        println(strDate)
    }
 
    @IBAction func done(sender: AnyObject) {
        
        post_drive()
      
    }
    
    @IBAction func back(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            println("back")
        })
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func post_drive(){
        var message = "Going from " + cityfrom.text! + " to " +  cityto.text! + ". Anyone needs a ride?"
        var currentUserName = PFUser.currentUser()?.username
        var driveuser = PFObject(className:"drive")
        driveuser["username"] = PFUser.currentUser()?.username
        driveuser["text"] = message
        driveuser["startTime"] = CFAbsoluteTimeGetCurrent()
        driveuser["date"] = strDate // use date for search also
        driveuser["cityto"] = cityto.text!
        //driveuser["stateto"] = stateto.text!
        driveuser["zipto"] = zipto.text! // use zip to provide search
        driveuser["cityfrom"] = cityfrom.text!
        //driveuser["statefrom"] = statefrom.text!
        driveuser["zipfrom"] = zipfrom.text!
        // provide contact info 
        driveuser.saveInBackgroundWithBlock {
                (success: Bool, error: NSError?) -> Void in
                if (success) {
                    //self.retrieve()
                    //                    let query = PFInstallation.query()
                    //                    if let query = query { // non intrusive
                    //                        //query.whereKey("channels", equalTo: "suitcaseOwners")
                    //                        query.whereKey("deviceType", equalTo: "ios")
                    //                        query.whereKey("")
                    //                        let iOSPush = PFPush()
                    //                        iOSPush.setMessage("General: " + self.commentTxtView.text)
                    //                        //iOSPush.setChannel("suitcaseOwners")
                    //                        iOSPush.setQuery(query)
                    //                        iOSPush.sendPushInBackground()
                    //
                    //                    }
                    self.performSegueWithIdentifier("posted1", sender: self)
                    println("Posted!")
                    
                } else {
                    println("Couldn't post!")
                    SCLAlertView().showWarning("Error Posting", subTitle: "Check Your Internet Connection.")
                }
        }

        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // No border, no shadow, floatingPlaceholderEnabled
        cityto.layer.borderColor = UIColor.clearColor().CGColor
        cityto.floatingPlaceholderEnabled = true
        cityto.placeholder = "City.."
        cityto.tintColor = UIColor.MKColor.Blue
        cityto.rippleLocation = .Right
        cityto.cornerRadius = 0
        cityto.bottomBorderEnabled = true
        cityto.attributedPlaceholder = NSAttributedString(string:"City..",
            attributes:[NSForegroundColorAttributeName: UIColor.orangeColor()])
        cityto.delegate = self
        
        stateto.layer.borderColor = UIColor.clearColor().CGColor
        stateto.floatingPlaceholderEnabled = true
        stateto.placeholder = "State.."
        stateto.tintColor = UIColor.MKColor.Blue
        stateto.rippleLocation = .Right
        stateto.cornerRadius = 0
        stateto.bottomBorderEnabled = true
        stateto.attributedPlaceholder = NSAttributedString(string:"State..",
            attributes:[NSForegroundColorAttributeName: UIColor.orangeColor()])
        stateto.delegate = self
        
        zipto.layer.borderColor = UIColor.clearColor().CGColor
        zipto.floatingPlaceholderEnabled = true
        zipto.placeholder = "Zip.."
        zipto.tintColor = UIColor.MKColor.Blue
        zipto.rippleLocation = .Right
        zipto.cornerRadius = 0
        zipto.bottomBorderEnabled = true
        zipto.attributedPlaceholder = NSAttributedString(string:"Zip..",
            attributes:[NSForegroundColorAttributeName: UIColor.orangeColor()])
        zipto.delegate = self
        
        cityfrom.layer.borderColor = UIColor.clearColor().CGColor
        cityfrom.floatingPlaceholderEnabled = true
        cityfrom.placeholder = "City.."
        cityfrom.tintColor = UIColor.MKColor.Blue
        cityfrom.rippleLocation = .Right
        cityfrom.cornerRadius = 0
        cityfrom.bottomBorderEnabled = true
        cityfrom.attributedPlaceholder = NSAttributedString(string:"City..",
            attributes:[NSForegroundColorAttributeName: UIColor.orangeColor()])
        cityfrom.delegate = self
        
        statefrom.layer.borderColor = UIColor.clearColor().CGColor
        statefrom.floatingPlaceholderEnabled = true
        statefrom.placeholder = "State.."
        statefrom.tintColor = UIColor.MKColor.Blue
        statefrom.rippleLocation = .Right
        statefrom.cornerRadius = 0
        statefrom.bottomBorderEnabled = true
        statefrom.attributedPlaceholder = NSAttributedString(string:"State..",
            attributes:[NSForegroundColorAttributeName: UIColor.orangeColor()])
        statefrom.delegate = self
        
        zipfrom.layer.borderColor = UIColor.clearColor().CGColor
        zipfrom.floatingPlaceholderEnabled = true
        zipfrom.placeholder = "Zip.."
        zipfrom.tintColor = UIColor.MKColor.Blue
        zipfrom.rippleLocation = .Right
        zipfrom.cornerRadius = 0
        zipfrom.bottomBorderEnabled = true
        zipfrom.attributedPlaceholder = NSAttributedString(string:"Zip..",
            attributes:[NSForegroundColorAttributeName: UIColor.orangeColor()])
        zipfrom.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}