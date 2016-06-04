//
//  Power7SleepViewController.swift
//  LIveNutriFit
//
//  Created by pragya on 07/05/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class Power7SleepViewController: UIViewController{
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var btnEditedReminder: UIButton!
  //  @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var baseInfoView: UIView!
    @IBOutlet weak var lblInfoView: UILabel!
    @IBOutlet weak var btnToShowInfo: UIButton!
    private let reuseIdentifier = "collectionViewCell"
    var object:powerOfSeven!
    var subObject:power7SubObject!
    
    var stageId:Int!
    override func viewDidLoad() {
        super.viewDidLoad()
      //  imageView.image = UIImage(named: "img1")
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.barStyle = UIBarStyle.Default
        navigationBar?.barTintColor = kColor_navigationBar
        navigationBar?.tintColor = UIColor.whiteColor()
        navigationBar?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        object = LiveNutriFitApi.sharedInstance.power7Content[0]
        subObject = object.subobject[0]
        self.title = object.stageName
        loadTheViewOntheBasesOfObject()
    }
    func loadTheViewOntheBasesOfObject(){
        if object.isReminder as Bool{
            switchButton.setOn(false, animated: true)
            let reminder = NSMutableAttributedString(string: onlyReminder, attributes: [NSFontAttributeName:UIFont(name: "HelveticaNeue-Medium", size: 14.0)!])
            reminder.addAttribute(NSForegroundColorAttributeName, value: UIColor.lightGrayColor(), range: NSRange(location: 0,length:NSString(string: reminder.string).length ))
            btnEditedReminder.setAttributedTitle(reminder, forState: UIControlState.Normal)
        }else{
            switchButton.setOn(true, animated: true)
            btnEditedReminder.titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
            btnEditedReminder.titleLabel?.textAlignment = NSTextAlignment.Center
            let reminder =  NSMutableAttributedString(string: editReminder, attributes: [NSFontAttributeName:UIFont(name: "HelveticaNeue-Medium", size: 14.0)!,NSForegroundColorAttributeName:UIColor.blackColor()])
            reminder.addAttribute(NSForegroundColorAttributeName, value: UIColor.lightGrayColor(), range: NSRange(location:9,length:4))
            reminder.addAttribute(NSFontAttributeName, value: UIFont(name:"HelveticaNeue-Medium", size: 12)!, range:NSRange(location:9,length:4) )
            btnEditedReminder.setAttributedTitle(reminder, forState: UIControlState.Normal)
        }
        let url = NSURL(string:"\(power7ImgBaseUrl)\(subObject.imgName)" )
        
            let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
            dispatch_async(dispatch_get_main_queue(), {
                self.imageView.image = UIImage(data: data!)
            });
        lblInfoView.sizeToFit()
        lblInfoView.frame.size.height = CGFloat(MAXFLOAT)
        lblInfoView.attributedText = convertText(object.info)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // iboutlet method
     @IBAction func reminderButtonEditedSelecterMethod(sender: AnyObject) {
        stageId = 1
         self.performSegueWithIdentifier(kSegue_ReminderSetting, sender: self)
    }
    
    @IBAction func switchButtonChangeValueAction(sender: AnyObject) {
        if switchButton.on {
            print("Switch is off")
            switchButton.setOn(false, animated:true)
            let reminder = NSMutableAttributedString(string: onlyReminder, attributes: [NSFontAttributeName:UIFont(name: "HelveticaNeue-Medium", size: 14.0)!])
            reminder.addAttribute(NSForegroundColorAttributeName, value: UIColor.lightGrayColor(), range: NSRange(location: 0,length:NSString(string: reminder.string).length ))
            btnEditedReminder.setAttributedTitle(reminder, forState: UIControlState.Normal)
        } else {
             print( "The Switch is On")
            switchButton.setOn(true, animated:true)
            btnEditedReminder.titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
            btnEditedReminder.titleLabel?.textAlignment = NSTextAlignment.Center
            let reminder = NSMutableAttributedString(string: editReminder, attributes: [NSFontAttributeName:UIFont(name: "HelveticaNeue-Medium", size: 14.0)!,NSForegroundColorAttributeName:UIColor.blackColor()])
            reminder.addAttribute(NSForegroundColorAttributeName, value: UIColor.lightGrayColor(), range: NSRange(location:9,length:4))
            reminder.addAttribute(NSFontAttributeName, value: UIFont(name:"HelveticaNeue-Medium", size: 12)!, range:NSRange(location:9,length:4) )
            btnEditedReminder.setAttributedTitle(reminder, forState: UIControlState.Normal)
            
        }
    }
    @IBAction func imageViewSelectionAction(sender: AnyObject) {
        
        
    }
    @IBAction func ButtontoShowInfoData(sender: AnyObject) {
         dispatch_async(dispatch_get_main_queue(), {
      self.baseInfoView.hidden = false
     self.view.bringSubviewToFront(self.baseInfoView)
        self.lblInfoView.hidden = false
        self.view.bringSubviewToFront(self.lblInfoView)
        })
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)->() {
        resignFirstResponder()
        self.view.endEditing(true)
        baseInfoView.hidden = true
        lblInfoView.hidden = true
        
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.navigationController?.navigationBarHidden = false
        if segue.identifier == kSegue_ReminderSetting{
            let nextViewController  = segue.destinationViewController as! ReminderViewController
            nextViewController.title = "Sleep"
            nextViewController.stageId = stageId
        }
    }
    

}
