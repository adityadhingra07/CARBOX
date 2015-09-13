//
//  TimelineCell.swift
//  AutomatePortal
//
//  Created by Tarang Khanna on 2/28/15.
//  Copyright (c) 2015 Thacked. All rights reserved.
//


import Foundation
import UIKit

class TimelineCell : MKTableViewCell {
    
    @IBOutlet var typeImageView : UIImageView!
    @IBOutlet var profileImageView : UIImageView!
    @IBOutlet var dateImageView : UIImageView!
    @IBOutlet var photoImageView : UIImageView?
    
    @IBOutlet var favouriteBtn: SpringButton!
    @IBOutlet var nameLabel : UILabel!
    @IBOutlet var postLabel : UILabel?
    @IBOutlet var dateLabel : UILabel!
    
    var highlightedBool = false
    
    @IBAction func favourited(sender: AnyObject) {
        var image = UIImage(named: "Fav.png") as UIImage?
        //let button   = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        if !highlightedBool {
            highlightedBool = true
        } else {
            image = UIImage(named: "NoFav.png") as UIImage?
            highlightedBool = false
        }
        favouriteBtn.setImage(image, forState: .Normal)
        favouriteBtn.animation = "pop"
        favouriteBtn.force = 3
        favouriteBtn.animate()
        delegate?.storyTableViewCellDidTouchFavourited(self, sender: sender)
    }
    
    weak var delegate: TimelineCellDelegate?
    
    override func awakeFromNib() {
        
        profileImageView.layer.cornerRadius = 30
        
        nameLabel.font = UIFont(name: "Avenir-Book", size: 16)
        nameLabel.textColor = UIColor.blackColor()
        
        postLabel?.font = UIFont(name: "Avenir-Book", size: 14)
        postLabel?.textColor = UIColor.blackColor()
        dateLabel.font = UIFont(name: "Avenir-Book", size: 14)
        dateLabel.textColor = UIColor(white: 0.6, alpha: 1.0)
        photoImageView?.layer.borderWidth = 0.4
        photoImageView?.layer.borderColor = UIColor(white: 0.92, alpha: 1.0).CGColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if postLabel != nil {
            //let label = postLabel!
            //label.preferredMaxLayoutWidth = CGRectGetWidth(label.frame)
        }
    }
    
    
    
}

protocol TimelineCellDelegate: class {
    func storyTableViewCellDidTouchFavourited(cell: TimelineCell, sender: AnyObject)
}