//
//  TimeLineViewController.swift
//  AutomatePortal
//
//  Created by Tarang Khanna on 2/28/15. Design inspiration from AppDesign Vault.
//  Copyright (c) 2015 Thacked. All rights reserved.
//

//MAKE SURE USER IS LOGGED IN

import Foundation
import UIKit
import MapKit
import Parse
import Social
import MessageUI
//import Spring

// fix lag

class TimelineViewController : UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, MFMailComposeViewControllerDelegate, floatMenuDelegate, PathMenuDelegate{
    
    @IBOutlet var postData: MKTextField!
    @IBOutlet var tableView : UITableView!
    var blackView: UIView?
    
    var newIndexPathRow: Int? = nil
    
    @IBOutlet var menuItem : UIBarButtonItem!
    @IBOutlet var statusLabel: UILabel!
    var selectedParseObjectId = String()
    var selectedParseObject:PFObject?
    var ParseObjectId : [String] = [""]
    //var selectedObject = PFObject()
    var containsImage = [Bool]() // for loading images and making sure index is not out of bounds
    var votedArray = [String]()
    var activityIndicator = UIActivityIndicatorView()
    var indexPathStore = NSIndexPath()
    var parseObject:PFObject?
    var currLocation: CLLocationCoordinate2D?
    let locationManager = CLLocationManager()
    //var transitionOperator = TransitionOperator()
    var messages = [String]()
    var createdAt = [Int]()
    var score = [Int]()
    var userArray: [String] = []
    var imageFiles = [PFFile]()
    var selectedName: String = "default"
    var selectedScore: String = "default"
    var selectedToReportMessage: String = "default"
    var selectedToReportObject:PFObject?
    var selectedAbout: String = "default"
    var startTime: CFAbsoluteTime!
    var timeAtPress: NSDate!
    var elapsedTime: NSDate!
    var duration : Int = 0
    var profileImageFile = PFFile()
    var profileImageFiles = [PFFile]()
    var previousUser = String()
    var circleColors = [UIColor.MKColor.LightBlue, UIColor.MKColor.Grey, UIColor.MKColor.LightGreen, UIColor.MKColor.Amber, UIColor.MKColor.DeepOrange]
    var voteObject = [PFObject]()
    //var potentialVoteCounter : Int? = object["count"]
    var selectedFirstPost = String()
    // gesture tableview configs
    //var groupToQuery : String? = "general"
    var placeToQueryFrom : String? = "general" // city from
    var placeToQueryTo : String? = "general" // city to
    var dateToQuery : String? = "general" // only one ofc
    var currentUser : String? = nil
    var currentUserId : String? = nil
    var search = false
    
    override func viewWillAppear(animated: Bool) {
       // self.navigationController!.navigationBar.hidden = false
        //self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        //USER INFO FOR STATS
        var currentusername = PFUser.currentUser()?.username
        
        
        //var currentUser: AnyObject? = PFUser.currentUser()?.username
        if PFUser.currentUser()?.username == nil {
                var Storyboard = UIStoryboard(name: "Main", bundle: nil)
                var mainVC : UIViewController = Storyboard.instantiateViewControllerWithIdentifier("mainVC") as! UIViewController
                self.presentViewController(mainVC, animated: true, completion: nil)
            
        }
        
        

        SwiftSpinner.show("Loading feed...")x
        
        if let currentUser = PFUser.currentUser()?.username {
            currentUserId = PFUser.currentUser()?.objectId
            var email = PFUser.currentUser()?.email
        } else {
            //performSegueWithIdentifier("signIn", sender: self)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "loginBG.png")!)
        
        //self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "loginBG.png"), forBarMetrics: UIBarMetrics.Compact)
        self.navigationController?.navigationBar.tintColor = UIColor.redColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.redColor()]
        //self.view.backgroundColor = UIColor(red: 90/255.0, green: 187/255.0, blue: 181/255.0, alpha: 1.0) //teal
        //self.navigationController?.hidesBarsOnSwipe = true
        //self.navigationController?.navigationBar.backgroundColor = UIColor(red: 90/255.0, green: 187/255.0, blue: 181/255.0, alpha: 1.0) //teal
        tableView.backgroundColor = UIColor.clearColor()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 90.0;
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        var currentUser = PFUser.currentUser()?.username
        // set this image at time of signup / signin
        var userPhoto = UIImage()
        //        var queryUser = PFUser.query() as PFQuery?
        //        queryUser!.findObjectsInBackgroundWithBlock {
        //            (users: [AnyObject]?, error: NSError?) -> Void in
        //            if error == nil {
        //                if let users = users as? [PFObject] {
        //                    for user in users {
        //                        var user2:PFUser = user as! PFUser
        //                        if user2.username == self.currentUser
        //                        {
        //                            var userPhotoFile = user2["ProfilePicture"] as! PFFile
        //                            userPhotoFile.getDataInBackgroundWithBlock { (data, error) -> Void in
        //
        //                                if let downloadedImage = UIImage(data: data!) {
        //                                    userPhoto  = downloadedImage
        //                                    actionButton.imageArray = ["fb-icon.png","twitter-icon.png","google-icon.png","downloadedImage"]
        //                                }
        //
        //                            }
        //                        }
        //                    }
        //                }
        //            }
        //        }
        
//        let floatFrame:CGRect = (CGRectMake(UIScreen.mainScreen().bounds.size.width - 44 - 20, UIScreen.mainScreen().bounds.size.height - 104 - 20, 44, 44))
//        // self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0.6, alpha: 0.5)
//        let actionButton : VCFloatingActionButton = VCFloatingActionButton(frame: floatFrame, normalImage: UIImage(named: "plus.png"), andPressedImage: UIImage(named: "cross.png"), withScrollview: tableView)
//        //actionButton.normalImage = UIImage(named: "plus.png")!
//        self.view.addSubview(actionButton)
//        actionButton.imageArray = ["fb-icon.png"]
//        actionButton.labelArray = ["Facebook"]
//        actionButton.delegate = self
//        actionButton.hideWhileScrolling = true
        
        //Path Menu Code
//
//        let storyMenuItemImage: UIImage = UIImage(named: "bg-menuitem")!
//        let storyMenuItemImagePressed: UIImage = UIImage(named: "bg-menuitem-highlighted")!
//        
//        let starImage: UIImage = UIImage(named: "icon-star")!
//        
//        let starMenuItem1: PathMenuItem = PathMenuItem(image: storyMenuItemImage, highlightedImage: storyMenuItemImagePressed, ContentImage: starImage, highlightedContentImage:nil)
//        
//        let starMenuItem2: PathMenuItem = PathMenuItem(image: storyMenuItemImage, highlightedImage: storyMenuItemImagePressed, ContentImage: UIImage(named: "fb-icon")!, highlightedContentImage:nil)
//        
//        let starMenuItem3: PathMenuItem = PathMenuItem(image: storyMenuItemImage, highlightedImage: storyMenuItemImagePressed, ContentImage: starImage, highlightedContentImage:nil)
//        
//        let starMenuItem4: PathMenuItem = PathMenuItem(image: storyMenuItemImage, highlightedImage: storyMenuItemImagePressed, ContentImage: starImage, highlightedContentImage:nil)
//        
//        var menus: [PathMenuItem] = [starMenuItem1, starMenuItem2, starMenuItem3, starMenuItem4]
//        
//        let startItem: PathMenuItem = PathMenuItem(image: UIImage(named: "bg-addbutton"), highlightedImage: UIImage(named: "bg-addbutton-highlighted"), ContentImage: UIImage(named: "icon-plus"), highlightedContentImage: UIImage(named: "icon-plus-highlighted"))
//        
//        var menu: PathMenu = PathMenu(frame: self.view.bounds, startItem: startItem, optionMenus: menus)
//        menu.delegate = self
//        menu.startPoint = CGPointMake(UIScreen.mainScreen().bounds.width/2, self.view.frame.size.height - 100.0)
//        menu.menuWholeAngle = CGFloat(M_PI) - CGFloat(M_PI/5)
//        menu.rotateAngle = -CGFloat(M_PI_2) + CGFloat(M_PI/5) * 1/2
//        menu.timeOffset = 0.0
//        menu.farRadius = 110.0
//        menu.nearRadius = 90.0
//        menu.endRadius = 100.0
//        menu.animationDuration = 0.5
//        
//        self.blackView = UIView(frame: UIScreen.mainScreen().bounds)
//        self.blackView?.addSubview(menu)
//        self.blackView?.backgroundColor = UIColor.clearColor()
//        self.view.addSubview(self.blackView!)
//        //self.view.backgroundColor = UIColor(red:0.96, green:0.94, blue:0.92, alpha:1)
//        
        retrieve()
        
    }
    
    func retrieve() {
        var currentProfileUser = ""
        if var query = PFQuery(className: "drive") as PFQuery? { //querying parse for user data
            query.orderByDescending("createdAt")
            query.limit = 25
            query.findObjectsInBackgroundWithBlock({ (objects, error) -> Void in
                if error != nil {
                    //self.statusLabel.text = "No Internet. Try refreshing."
                }
                self.containsImage.removeAll(keepCapacity: false)
                self.imageFiles.removeAll(keepCapacity: false)
                self.messages.removeAll(keepCapacity: false)
                self.profileImageFiles.removeAll(keepCapacity: false)
                self.userArray.removeAll(keepCapacity: false)
                self.score.removeAll(keepCapacity: false)
                self.createdAt.removeAll(keepCapacity: false)
                self.voteObject.removeAll(keepCapacity: false)
                self.votedArray.removeAll(keepCapacity: false)
                self.ParseObjectId.removeAll(keepCapacity: false)
                if let objects = objects as? [PFObject]  {
                    for object in objects {
                        if (self.placeToQueryFrom! == object["cityfrom"] as? String && self.placeToQueryTo! == object["cityto"] as? String && self.dateToQuery! == object["date"] as? String) || (self.search == false) { // main search logic for rides 
                            if let imageFile42 = object["imageFile"] as? PFFile {
                                self.imageFiles.append(imageFile42)
                                self.containsImage.append(true)
                            } else {
                                self.imageFiles.append(PFFile())
                                self.containsImage.append(false)
                            }
                            currentProfileUser = object["username"] as! String
                            // append profile pics here and optimise
                            self.voteObject.append(object)
                            self.ParseObjectId.append((object.objectId! as String?)!)
                            self.messages.append(object["text"] as! String)
                            
                            self.userArray.append(currentProfileUser)
                            //self.score.append(object["score"] as! Int)
                            let elapsedTime = CFAbsoluteTimeGetCurrent() - (object["startTime"] as! CFAbsoluteTime)
                            self.duration = Int(elapsedTime/60)
                            self.createdAt.append(self.duration)
                            
                        }
                    }
                }
                
                //dispatch_async(dispatch_get_main_queue()) {
                self.delay(0.3) {
                    var queryUser2 = PFUser.query() as PFQuery?
                    queryUser2!.findObjectsInBackgroundWithBlock {
                        (users: [AnyObject]?, error: NSError?) -> Void in
                        if error == nil {
                            for user42 in self.userArray {
                                // Do something with the found users
                                if let users = users as? [PFObject] {
                                    for user in users {
                                        var user2:PFUser = user as! PFUser
                                        //println(user42)
                                        if user2.username == user42 {
                                            self.profileImageFiles.append(user2["ProfilePicture"] as! PFFile)
                                        }
                                        
                                    }
                                }
                            }
                        } else {
                            println("Error: \(error!) \(error!.userInfo!)")
                        }
                    }
                    //}
                }
                self.delay(6) {
                    println(self.profileImageFiles.count)
                    println("3io4h3jnk4jkn")
                    println(self.userArray.count)
                    // dispatch_async(dispatch_get_main_queue()) {
                    if self.profileImageFiles.count == self.userArray.count{
                        SwiftSpinner.hide()
                        self.tableView.reloadData()
                    } else {
                        self.retrieve()
                    }
                    
                }
                
            })
            //if profileImageFiles.count == userArray.count {
            
            
            // }
            //}
        }
        //dispatch_async(dispatch_get_main_queue()) {
        //self.loadProfileImages()
        //}
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    //
    //    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
    //        locationManager.stopUpdatingLocation()
    //        if(locations.count > 0){
    //            let location = locations[0] as! CLLocation
    //            currLocation = location.coordinate
    //        } else {
    //            println("error")
    //        }
    //    }
    
    //    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
    //        println(error)
    //    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        indexPathStore = indexPath
        var cell = tableView.dequeueReusableCellWithIdentifier("TimelineCell") as? TimelineCell
        if cell == nil {
            cell = TimelineCell(style: UITableViewCellStyle.Default, reuseIdentifier: "TimelineCell")
        }
        let size = CGSizeMake(30, 30)
        println(profileImageFiles.count)
        let profileImage42 = self.profileImageFiles[indexPath.row]
        profileImage42.getDataInBackgroundWithBlock { (data, error) -> Void in
            if (error == nil) {
                if let downloadedImage = UIImage(data: data!) {
                    cell!.profileImageView?.image = downloadedImage
                }
            }
        }
        var longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: Selector("longPressOptions:"))
        cell?.userInteractionEnabled = true
        cell?.addGestureRecognizer(longPressGestureRecognizer)
        cell!.profileImageView.tag = indexPath.row
        //var tapGestureRecognizer = UITapGestureRecognizer(target:self, action:Selector("profileImageTapped:"))
        cell!.profileImageView.userInteractionEnabled = true
        //cell!.profileImageView.addGestureRecognizer(tapGestureRecognizer)
        //cell!.backgroundColor = UIColor.clearColor()
        //self.tableView.insertRowsAtIndexPaths(0, withRowAnimation: UITableViewRowAnimation.Bottom)
        //cell!.typeImageView.image = UIImage(named: "timeline-chat")
        //cell.profileImageView.image = UIImage(named: "profile-pic-1")
        var name = self.userArray[indexPath.row]
        name.replaceRange(name.startIndex...name.startIndex, with: String(name[name.startIndex]).capitalizedString)
        cell!.nameLabel.text = name
        cell!.nameLabel.textColor = UIColor.blackColor()
        cell!.postLabel?.text = self.messages[indexPath.row]
        cell!.postLabel?.textColor = UIColor.blackColor()
        let index = indexPath.row % circleColors.count
        cell!.rippleLayerColor = circleColors[index]
        var seconds = Double(self.createdAt[indexPath.row]*60)
        var temp = seconds
        var timeAgo = (seconds/60) // + " m ago"
        var ending = " min"
        var setAlready = false
        if timeAgo >= 60 { // min now
            timeAgo = (temp / 3600)
            ending = " hrs"
            if timeAgo >= 24.0 {
                timeAgo = timeAgo / 24
                ending = " days"
                if timeAgo > 1.3 {
                    setAlready = true
                    cell!.dateLabel.text = "yesterday"
                } else {
                    
                }
            }
        }
        if !setAlready {
            cell!.dateLabel.text = String(stringInterpolationSegment: Int(timeAgo)) + ending
        }
        cell!.dateLabel.textColor = UIColor.blackColor()
        return cell!
    }
    
        func longPressOptions(recognizer: UILongPressGestureRecognizer) {
    
            if (recognizer.state == UIGestureRecognizerState.Ended) {
                var cellIndex = recognizer.view!.tag
                selectedToReportObject = voteObject[cellIndex]
                selectedToReportMessage = messages[cellIndex]
    
                let alert = SCLAlertView()
                alert.addButton("Report") {
    
                    let mailComposeViewController = self.configuredMailComposeViewController()
                    if MFMailComposeViewController.canSendMail() {
    
                        self.presentViewController(mailComposeViewController, animated: true, completion: nil)
                    } else {
                        self.showSendMailErrorAlert()
                    }
                }
                alert.addButton("Delete") {
    
                }
    
                alert.showEdit("Yes?", subTitle:"Choose:", closeButtonTitle: "Cancel")
            }
    
            else if (recognizer.state == UIGestureRecognizerState.Began) {
                //Do Whatever You want on Began of Gesture
    
            }
        }
    
        // MAIL
    
        func configuredMailComposeViewController() -> MFMailComposeViewController {
            let mailComposerVC = MFMailComposeViewController()
            mailComposerVC.mailComposeDelegate = self
    
            mailComposerVC.setToRecipients(["tarangalbert@gmail.com"])
            mailComposerVC.setSubject("Reporting for Inspirator")
            var body = String(stringInterpolationSegment: selectedToReportObject) + "\r\n" + "Problem:"
            mailComposerVC.setMessageBody(body, isHTML: false)
            return mailComposerVC
        }
    
    func showSendMailErrorAlert() {
        //    let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        //  sendMailErrorAlert.show()
    }
    
    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //    // FINISH MAIL
    //
    //    func profileImageTapped(recognizer: UITapGestureRecognizer) {
    //        var imageIndex = recognizer.view!.tag
    //        selectedName = userArray[imageIndex]
    //        selectedScore = String(score[imageIndex])
    //        selectedParseObject = voteObject[imageIndex]
    //        performSegueWithIdentifier("profileView", sender: self)
    //    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        // notify that a person wants to ride 
        
//        selectedName = userArray[indexPath.row]
//        selectedScore = String(score[indexPath.row])
//        selectedParseObject = voteObject[indexPath.row]
//        selectedFirstPost = messages[indexPath.row]
//        if let myObject = ParseObjectId[indexPath.row] as String? {
//            selectedParseObjectId = myObject
//        }
//        //let destinationVC = profileVC()
//        //destinationVC.name = selectedName
//        performSegueWithIdentifier("showComments", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        //var recipients2 = [String]()
//        if (segue.identifier == "profileView") { //pass data to VC
//            var svc = segue.destinationViewController.topViewController as! profileVC
//            println(selectedName)
//            svc.name = selectedName
//            svc.canChange = false
//            svc.score = selectedScore
//            svc.show = true
//            //svc.profileObject =
//        } else if (segue.identifier == "posting") {
//            var svc = segue.destinationViewController.topViewController as! postingViewController
//            svc.passedGroup = groupToQuery!
//        } else if (segue.identifier == "showComments") { // get notified if you see comment section
//            var currentUserId = PFUser.currentUser()?.objectId
//            
//            
//            if var recipients = selectedParseObject!["recipients"] as? [String] {  //added to receiver array, real notification on comment adding in commentsVC
//                if !contains(recipients, currentUserId!) {
//                    println(PFUser.currentUser()?.objectId)
//                    recipients.append(currentUserId!)
//                    selectedParseObject!["recipients"] = recipients
//                    recipients2 = recipients
//                    // This will save both myPost and myComment
//                    selectedParseObject!.saveInBackgroundWithBlock {
//                        (success: Bool, error: NSError?) -> Void in
//                        if (success) {
//                            
//                            // update cell locally atleast and maybe not call self.retrieve
//                        } else {
//                            println("Couldn't subscribe!")
//                            SCLAlertView().showWarning("Error Commenting", subTitle: "Check Your Internet Connection.")
//                        }
//                    }
//                }
//            } else {
//                selectedParseObject!["recipients"] = [String]()
//                var recipients3 = selectedParseObject!["recipients"] as? [String]
//                recipients3?.append(currentUserId!)
//                recipients2 = recipients3!
//                selectedParseObject!["recipients"] = recipients2
//                selectedParseObject!.saveInUIBarButtonItemgroundWithBlock {
//                    (success: Bool, error: NSError?) -> Void in
//                    if (success) {
//                        
//                    } else {
//                        println("Couldn't Vote!")
//                        SCLAlertView().showWarning("Error Commenting", subTitle: "Check Your Internet Connection.")
//                    }
//                }
//            }
//            
//            var svc = segue.destinationViewController.topViewController as! CommentsVC // nav controller in between
//            
//            if let parseID = selectedParseObjectId as String?{
//                svc.name = selectedName
//                svc.firstPost = selectedFirstPost
//                svc.objectIDPost = parseID
//                svc.recipients = recipients2
//                println(recipients2)
//            }
//        }
    }
    
    func textView(textView: UITextView!, shouldInteractWithURL URL: NSURL!, inRange characterRange: NSRange) -> Bool {
        
        println("Link Selected!")
        return true
        
    }
    
    
    func didSelectMenuOptionAtIndex(row : NSInteger) {
        println(row)
        if(row == 0) {
            //fb
            if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook){
                var facebookSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
                //facebookSheet.setInitialText("#GetMotivated")
                self.presentViewController(facebookSheet, animated: true, completion: nil)
            } else {
                //var alert = UIAlertController(title: "Accounts", message: "Please login to a Facebook account from the iOS app to share.", preferredStyle: UIAlertControllerStyle.Alert)
                SCLAlertView().showWarning("Accounts", subTitle: "Please login to a Facebook account from the iOS app to share.")
                //alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                //self.presentViewController(alert, animated: true, completion: nil)
            }
        } else if(row == 1) {
            //twitter
            if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter){
                var twitterSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
                twitterSheet.setInitialText("#GetMotivated")
                self.presentViewController(twitterSheet, animated: true, completion: nil)
            } else {
                SCLAlertView().showWarning("Accounts", subTitle: "Please login to a Twitter account from the iOS app to share.")
                //self.presentViewController(alert, animated: true, completion: nil)
            }
        } else if(row == 2) {
            //performSegueWithIdentifier("About", sender: self)
            //google+
            
        } else if(row == 3) {
            //LinkedIn
        } else if(row == 4){
            //performSegueWithIdentifier("About", sender: self)
            //new
            SCLAlertView().showInfo("About-Terms", subTitle: "http://tarangkhanna.github.io/InspiratorAppPage/terms.html")
        }
    }
    
    //MARK: PathMenuDelegate
    
    func pathMenu(menu: PathMenu, didSelectIndex idx: Int) {
        println("Select the index : \(idx)")
        var row = idx
        self.blackView?.backgroundColor = UIColor.clearColor()
        if(row == 0) {
            //fb
            if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook){
                var facebookSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
                //facebookSheet.setInitialText("#GetMotivated")
                self.presentViewController(facebookSheet, animated: true, completion: nil)
            } else {
                //var alert = UIAlertController(title: "Accounts", message: "Please login to a Facebook account from the iOS app to share.", preferredStyle: UIAlertControllerStyle.Alert)
                SCLAlertView().showWarning("Accounts", subTitle: "Please login to a Facebook account from the iOS app to share.")
                //alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                //self.presentViewController(alert, animated: true, completion: nil)
            }
        } else if(row == 1) {
            //twitter
            if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter){
                var twitterSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
                twitterSheet.setInitialText("#GetMotivated")
                self.presentViewController(twitterSheet, animated: true, completion: nil)
            } else {
                SCLAlertView().showWarning("Accounts", subTitle: "Please login to a Twitter account from the iOS app to share.")
                //self.presentViewController(alert, animated: true, completion: nil)
            }
        } else if(row == 2) {
            //performSegueWithIdentifier("About", sender: self)
            //google+
            
        } else if(row == 3) {
            //log out
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

    }
    
    func pathMenuWillAnimateOpen(menu: PathMenu) {
        println("Menu will open!")
        self.blackView?.backgroundColor = UIColor(red:0.0, green:0.0, blue:0.0, alpha:0.7)
    }
    
    func pathMenuWillAnimateClose(menu: PathMenu) {
        println("Menu will close!")
    }
    
    func pathMenuDidFinishAnimationOpen(menu: PathMenu) {
        println("Menu was open!")
    }
    
    func pathMenuDidFinishAnimationClose(menu: PathMenu) {
        println("Menu was closed!")
        self.blackView?.backgroundColor = UIColor.clearColor()
    }
    
    
}

