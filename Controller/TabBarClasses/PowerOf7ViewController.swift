//
//  PowerOf7ViewController.swift
//  LIveNutriFit
//
//  Created by Sameera Sadaqat on 23/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class PowerOf7ViewController: BaseViewController,UICollectionViewDelegate, UICollectionViewDataSource{
    var power7Content: [powerOfSeven]!
    var object:powerOfSeven!
    var subObject:power7SubObject!
    var subObjectArray:[power7SubObject]!
    var currentStageId:Int!
    
    
    enum TabIndex : Int {
        case Power7SleepVC = 0
        case Power7WaterVC = 1
        case Power7ProtienVC = 2
        case Power7VeggisVC = 3
        case Power7FruitsVC = 4
        case Power7NutsVC = 5
        case Power7ExerciseVC = 6
    }
    // 2 nd tab button
    @IBOutlet weak var power7Sleep: UIButton!
    @IBOutlet weak var power7Water: UIButton!
    @IBOutlet weak var power7Nuts: UIButton!
    @IBOutlet weak var power7Exercise: UIButton!
    @IBOutlet weak var power7Fruits: UIButton!
    @IBOutlet weak var power7Veggis: UIButton!
    @IBOutlet weak var power7Protien: UIButton!
    // sleep
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var btnEditedReminder: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var baseInfoView: UIView!
    @IBOutlet weak var lblInfoView: UILabel!
    @IBOutlet weak var btnToShowInfo: UIButton!
    var reuseIdentifier:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.barStyle = UIBarStyle.Default
        navigationBar?.barTintColor = kColor_navigationBar
        navigationBar?.tintColor = UIColor.whiteColor()
        navigationBar?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
         webServiceCallingTogetPowerOfSevenData()
         self.addSlideMenuButton()
    }
    // update the view on the bases of selected  section
    func loadTheViewOntheBasesOfObject(){
        subObject = object.subobject[0]
        if object.isReminder == 0{
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
            if data == nil{
                 self.imageView.image = UIImage(named: "img1")
            }else{
            self.imageView.image = UIImage(data: data!)
            } });
        lblInfoView.sizeToFit()
        lblInfoView.frame.size.height = CGFloat(MAXFLOAT)
        lblInfoView.attributedText = convertText(object.info)
        SwiftLoader.hide()
        
    }
    func loadTheCollectionViewOntheBasesOfObject(){
         subObjectArray = object.subobject
        currentStageId = object.stageId as Int
        collectionView.delegate = self
        collectionView.dataSource = self
        if object.isReminder == 0{
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
        
        lblInfoView.sizeToFit()
        lblInfoView.frame.size.height = CGFloat(MAXFLOAT)
        lblInfoView.attributedText = convertText(object.info)
         dispatch_async(dispatch_get_main_queue(), {
        self.collectionView.reloadData()
         SwiftLoader.hide()
        })
    }


    
    @IBAction func onClickSleep(sender: AnyObject) {
       object = power7Content[0]
       subObjectArray = object.subobject
        collectionView.hidden = true
        imageView.hidden = false
         loadTheViewOntheBasesOfObject()
    }
    @IBAction func onClickWater(sender: AnyObject) {
        actionShowLoader()
        SwiftLoader.show("Loading...", animated: true)
        object = power7Content[1]
        subObjectArray = object.subobject
        collectionView.hidden = true
         imageView.hidden = false
         loadTheViewOntheBasesOfObject()
       
    }
    @IBAction func onClickProtien(sender: AnyObject) {
        actionShowLoader()
        SwiftLoader.show("Loading...", animated: true)
        object = power7Content[2]
        subObjectArray = object.subobject
        reuseIdentifier = "2InRow"
        collectionView.hidden = false
         imageView.hidden = true
         loadTheCollectionViewOntheBasesOfObject()
        
        }
    @IBAction func onClickVeggies(sender: AnyObject) {
        actionShowLoader()
        SwiftLoader.show("Loading...", animated: true)
        object = power7Content[3]
        subObjectArray = object.subobject
         reuseIdentifier = "2InRow"
        collectionView.hidden = false
        imageView.hidden = true
         loadTheCollectionViewOntheBasesOfObject()
       
        }
    @IBAction func onClickFruits(sender: AnyObject) {
        actionShowLoader()
        SwiftLoader.show("Loading...", animated: true)
        object = power7Content[4]
        subObjectArray = object.subobject
         reuseIdentifier = "2InRow"
        collectionView.hidden = false
        imageView.hidden = true
         loadTheCollectionViewOntheBasesOfObject()
        
        }
    @IBAction func onClickNuts(sender: AnyObject) {
        actionShowLoader()
        SwiftLoader.show("Loading...", animated: true)
       
        object = power7Content[5]
        subObjectArray = object.subobject
         reuseIdentifier = "SingleInRow"
        collectionView.hidden = false
        imageView.hidden = true
         loadTheCollectionViewOntheBasesOfObject()
    }
    @IBAction func onClickExercise(sender: AnyObject) {
        actionShowLoader()
        SwiftLoader.show("Loading...", animated: true)
        object = power7Content[6]
        subObjectArray = object.subobject
         reuseIdentifier = "SingleInRow"
        collectionView.hidden = false
        imageView.hidden = true
        loadTheCollectionViewOntheBasesOfObject()
    }
    
    //   MARK:- calling Of web Services of power of seven
    func webServiceCallingTogetPowerOfSevenData(){
        actionShowLoader()
        SwiftLoader.show("Loading...", animated: true)
        var param = [String:AnyObject]()
        param[kJsonKey_PatientId] = LiveNutriFitApi.sharedInstance.loginData.patientId
        
        PowerOfSevenWebServiceCalling(param, withjson: kGetPowerOfSeven)
        
    }
    func PowerOfSevenWebServiceCalling(param:[String:AnyObject], withjson type:String) {
        ConnectionClass.patientLoginServiceImplementation(param, withUrlString: type) { (data, error) -> Void in
            if error != nil{
                print(error?.description)
            }else{
                if data != nil{
                    do {
                        let result = try NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers)as! NSDictionary
                        self.responceParsingforPowerOfSeven(result)
                        print("Result -> \(result)")
                    } catch {
                        print("Error -> \(error)")
                    }
                }else{
                    // network not connected
                    
                }
            }
        }
        
    }
    // responce parser for update alarm data
    func responceParsingforPowerOfSeven(result:NSDictionary)
    {
        if let dict = result["d"] as? String {
            //    print(dict)
            let jsonData = convertStringToDictionary(dict)
            print(jsonData)
            if let requestStatus = jsonData!["Status"] as? [String:AnyObject] {
                if let status = requestStatus["Status"] as? Int{
                    if status == 1{
                        let powerOfSevenContent = jsonData!["PowerOfServenPointList"] as! [NSDictionary]
                        print(powerOfSevenContent)
                       
                        let data = ParserApi.parsingPowerOfSevenData(powerOfSevenContent)
                        print(data)
                        power7Content = data
                     //   LiveNutriFitApi.sharedInstance.power7Content = data
                          dispatch_async(dispatch_get_main_queue(), {
                        SwiftLoader.hide()
                           self.object  = self.power7Content[0]
                             self.loadTheViewOntheBasesOfObject()
                        })

                    }
                }
            }
        }
    }
   ////////////////////////////////////
    //MARK: IBOutlet method
    // iboutlet method
    @IBAction func reminderButtonEditedSelecterMethod(sender: AnyObject) {
      currentStageId = object.stageId as Int
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
            nextViewController.stageId = currentStageId
        }
    }
    //MARK: collection view delegate method
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return subObjectArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let subObjectData = subObjectArray[indexPath.row] as power7SubObject
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! PowerOf7CollectionViewCell
        let url = NSURL(string:"\(power7ImgBaseUrl)\(subObjectData.imgName)")
        let data = NSData(contentsOfURL: url!)
        dispatch_async(dispatch_get_main_queue(), {
            if data == nil{
                cell.imageView.image = UIImage(named: "img1")
            }else{
                cell.imageView.image = UIImage(data: data!)
            }
        });
        cell.lblInfoView.attributedText = convertText(subObjectData.itemDescription)
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
        return cell
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        switch currentStageId {
        case 6,7:
            let itemSizeWidth = self.collectionView.frame.size.width - 10
            let itemSizeheight = self.collectionView.frame.size.height - 5
            return CGSizeMake(itemSizeWidth/1, itemSizeheight/2)
        default:
            let itemSizeWidth = self.collectionView.frame.size.width - 5
            let itemSizeheight = self.collectionView.frame.size.height - 5
            return CGSizeMake(itemSizeWidth/2, itemSizeheight/2)
        }
    }

}
