//
//  CoachModelViewViewController.swift
//  LIveNutriFit
//
//  Created by pragya on 30/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class CoachModelViewViewController: UIViewController {
    
    @IBOutlet weak var imgViewBase: UIImageView!
    @IBOutlet weak var imageViewPersonalImg: UIImageView!
    
    @IBOutlet weak var baseContentView: UIView!
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAbout: UILabel!
    
    @IBOutlet weak var lblHobby: UILabel!
    @IBOutlet weak var lblCoachName: UILabel!
    
    

     func viewDidLoad(object:CoachDetail) {
        super.viewDidLoad()
        print(object)
       lblName.text = object.dieticianName
         let image : UIImage = UIImage(named:"unselectedCheck")!
        imageViewPersonalImg.image = image
        var aboutHeader:NSMutableAttributedString!
        var aboutBody:NSMutableAttributedString!
        aboutHeader = NSMutableAttributedString(string: "ABOUT\n")
        aboutHeader.addAttribute(NSFontAttributeName, value: UIFont(name: "HelveticaNeue",size: 16.0)!, range: NSRange(location: 0,length:NSString(string: "ABOUT\n").length ))
        
        aboutBody = NSMutableAttributedString(string: object.profileSummary)
        aboutBody.addAttribute(NSFontAttributeName, value:  UIFont(name: "HelveticaNeue",size: 13.0)!, range: NSRange(location: 0,length:NSString(string:  object.profileSummary).length ))
         let finalString:NSMutableAttributedString = aboutHeader
        finalString.appendAttributedString(aboutBody)
        lblAbout.attributedText = finalString
        lblAbout.sizeToFit()
        
        var hobbyHeader:NSMutableAttributedString!
        var hobbyBody:NSMutableAttributedString!
        hobbyHeader = NSMutableAttributedString(string: "HOBBIES\n")
        hobbyHeader.addAttribute(NSFontAttributeName, value: UIFont(name: "HelveticaNeue",size: 16.0)!, range: NSRange(location: 0,length:NSString(string: "HOBBIES\n").length ))
        
        hobbyBody = NSMutableAttributedString(string: object.hobbies)
        hobbyBody.addAttribute(NSFontAttributeName, value:  UIFont(name: "HelveticaNeue",size: 13.0)!, range: NSRange(location: 0,length:NSString(string:  object.hobbies).length ))
        let hobbytext:NSMutableAttributedString = hobbyHeader
        hobbytext.appendAttributedString(hobbyBody)
        lblHobby.attributedText = hobbytext
        lblHobby.sizeToFit()
        
        
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }

}
