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
    
    @IBOutlet var cityto: UITextField!
    @IBOutlet var stateto: UITextField!
    @IBOutlet var zipto: UITextField!
    
    // FROM INPUTS
    @IBOutlet var cityfrom: UITextField!
    @IBOutlet var statefrom: UITextField!
    @IBOutlet var zipfrom: UITextField!
    
    // DATE INPUT
    
    @IBOutlet var datepick: UIDatePicker!
    @IBAction func datepicker(sender: AnyObject) {
        var date:NSDate = datepick.date
        Day = NSCalendar.currentCalendar().startOfDayForDate(date)
        println(date)
        println(Day)
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
        
        var currentUser = PFUser.currentUser()?.username
        var driveuser = PFObject(className:"Person")
        driveuser["username"] = currentUser
        driveuser["date"] = Day as NSDate
        driveuser["cityto"] = cityto.text!
        driveuser["stateto"] = stateto.text!
        driveuser["zipto"] = zipto.text!
        driveuser["cityfrom"] = cityfrom.text!
        driveuser["statefrom"] = statefrom.text!
        driveuser["zipfrom"] = zipfrom.text!
        
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
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}