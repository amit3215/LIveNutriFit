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
    @IBOutlet weak var lblImgInfoView: UILabel!
    var reuseIdentifier:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:Selector("imageTapped:"))
        imageView.userInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
    }
    override func viewWillAppear(animated: Bool) {
        lblImgInfoView.hidden = true
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
          currentStageId = self.currentStageId != nil ?object.stageId as Int - 1 :0
            //object.stageId as Int
        self.title = object.stageName
        if object.isReminder as Bool{
            dispatch_async(dispatch_get_main_queue(), {
                self.switchButton.setOn(true, animated: true)
                self.btnEditedReminder.titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                self.btnEditedReminder.titleLabel?.textAlignment = NSTextAlignment.Center
                let reminder =  NSMutableAttributedString(string: editReminder, attributes: [NSFontAttributeName:UIFont(name: "HelveticaNeue-Medium", size: 14.0)!,NSForegroundColorAttributeName:UIColor.blackColor()])
                reminder.addAttribute(NSForegroundColorAttributeName, value: UIColor.lightGrayColor(), range: NSRange(location:9,length:4))
                reminder.addAttribute(NSFontAttributeName, value: UIFont(name:"HelveticaNeue-Medium", size: 12)!, range:NSRange(location:9,length:4) )
                self.btnEditedReminder.setAttributedTitle(reminder, forState: UIControlState.Normal)
            })
            
        }else{
            dispatch_async(dispatch_get_main_queue(), {
                self.switchButton.setOn(false, animated: true)
                let reminder = NSMutableAttributedString(string: onlyReminder, attributes: [NSFontAttributeName:UIFont(name: "HelveticaNeue-Medium", size: 14.0)!])
                reminder.addAttribute(NSForegroundColorAttributeName, value: UIColor.lightGrayColor(), range: NSRange(location: 0,length:NSString(string: reminder.string).length ))
                self.btnEditedReminder.setAttributedTitle(reminder, forState: UIControlState.Normal)
            })
            
        }
        let url = NSURL(string:"\(power7ImgBaseUrl)\(subObject.imgName)" )
        
        let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
         dispatch_async(dispatch_get_main_queue(), {
            if data == nil{
                 self.imageView.image = UIImage(named: "img1")
                 SwiftLoader.hide()
            }else{
            self.imageView.image = UIImage(data: data!)
                 SwiftLoader.hide()
            } });
        lblInfoView.sizeToFit()
        lblImgInfoView.hidden = true
        if currentStageId == 1{
            lblImgInfoView.hidden = false
             lblImgInfoView.frame.size.height = CGFloat(MAXFLOAT)
            lblImgInfoView.attributedText = convertText(subObject.itemDescription)
            
        }
        
        lblInfoView.frame.size.height = CGFloat(MAXFLOAT)
        lblInfoView.attributedText = convertText(object.info)
       
        
    }
    func loadTheCollectionViewOntheBasesOfObject(){
         subObjectArray = object.subobject
        lblImgInfoView.hidden = true
          self.title = object.stageName
       currentStageId = self.currentStageId != nil ?object.stageId as Int - 1:0
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
        
        lblInfoView.sizeToFit()
        lblInfoView.frame.size.height = CGFloat(MAXFLOAT)
        lblInfoView.attributedText = convertText(object.info)
         dispatch_async(dispatch_get_main_queue(), {
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
        self.collectionView.reloadData()
         SwiftLoader.hide()
        })
    }


    
    @IBAction func onClickSleep(sender: AnyObject) {
         dispatch_async(dispatch_get_main_queue(), {
       self.actionShowLoader()
        SwiftLoader.show("Loading...", animated: true)
            })
      power7Sleep.setTitleColor(kColor_navigationBar, forState: UIControlState.Selected)
       object = power7Content[0]
       subObjectArray = object.subobject
        collectionView.hidden = true
        imageView.hidden = false
         loadTheViewOntheBasesOfObject()
    }
    @IBAction func onClickWater(sender: AnyObject) {
         dispatch_async(dispatch_get_main_queue(), {
        self.actionShowLoader()
        SwiftLoader.show("Loading...", animated: true)
            })
          power7Water.setTitleColor(kColor_navigationBar, forState: UIControlState.Selected)
        object = power7Content[1]
        subObjectArray = object.subobject
        collectionView.hidden = true
         imageView.hidden = false
         loadTheViewOntheBasesOfObject()
       
    }
    @IBAction func onClickProtien(sender: AnyObject) {
         dispatch_async(dispatch_get_main_queue(), {
        self.actionShowLoader()
        SwiftLoader.show("Loading...", animated: true)
            })
        power7Protien.setTitleColor(kColor_navigationBar, forState: UIControlState.Selected)
        object = power7Content[2]
        subObjectArray = object.subobject
        reuseIdentifier = "2InRow"
        collectionView.hidden = false
        imageView.hidden = true
        loadTheCollectionViewOntheBasesOfObject()
        
        }
    @IBAction func onClickVeggies(sender: AnyObject) {
         dispatch_async(dispatch_get_main_queue(), {
        self.actionShowLoader()
        SwiftLoader.show("Loading...", animated: true)
            })
          power7Veggis.setTitleColor(kColor_navigationBar, forState: UIControlState.Selected)
        object = power7Content[3]
        subObjectArray = object.subobject
         reuseIdentifier = "2InRow"
        collectionView.hidden = false
        imageView.hidden = true
         loadTheCollectionViewOntheBasesOfObject()
       
        }
    @IBAction func onClickFruits(sender: AnyObject) {
         dispatch_async(dispatch_get_main_queue(), {
       self.actionShowLoader()
        SwiftLoader.show("Loading...", animated: true)
            })
          power7Fruits.setTitleColor(kColor_navigationBar, forState: UIControlState.Selected)
        object = power7Content[4]
        subObjectArray = object.subobject
         reuseIdentifier = "2InRow"
        collectionView.hidden = false
        imageView.hidden = true
         loadTheCollectionViewOntheBasesOfObject()
        
        }
    @IBAction func onClickNuts(sender: AnyObject) {
         dispatch_async(dispatch_get_main_queue(), {
        self.actionShowLoader()
        SwiftLoader.show("Loading...", animated: true)
            })
         power7Nuts.setTitleColor(kColor_navigationBar, forState: UIControlState.Selected)
        object = power7Content[5]
        subObjectArray = object.subobject
         reuseIdentifier = "SingleInRow"
        collectionView.hidden = false
        imageView.hidden = true
         loadTheCollectionViewOntheBasesOfObject()
    }
    @IBAction func onClickExercise(sender: AnyObject) {
         dispatch_async(dispatch_get_main_queue(), {
        self.actionShowLoader()
        SwiftLoader.show("Loading...", animated: true)
            })
        power7Exercise.setTitleColor(kColor_navigationBar, forState: UIControlState.Selected)
        object = power7Content[6]
        subObjectArray = object.subobject
         reuseIdentifier = "SingleInRow"
        collectionView.hidden = false
        imageView.hidden = true
        loadTheCollectionViewOntheBasesOfObject()
    }
    
    //   MARK:- calling Of web Services of power of seven
    func webServiceCallingTogetPowerOfSevenData(){
         dispatch_async(dispatch_get_main_queue(), {
        self.actionShowLoader()
        SwiftLoader.show("Loading...", animated: true)
        })
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
            let jsonData = convertStringToDictionary(dict)
          //  print(jsonData)
            if let requestStatus = jsonData!["Status"] as? [String:AnyObject] {
                if let status = requestStatus["Status"] as? Int{
                    if status == 1{
                        let powerOfSevenContent = jsonData!["PowerOfServenPointList"] as! [NSDictionary]
                        print(powerOfSevenContent)
                       
                        let data = ParserApi.parsingPowerOfSevenData(powerOfSevenContent)
                       // print(data)
                        power7Content = data
                     //   LiveNutriFitApi.sharedInstance.power7Content = data
                        
                        
                          SwiftLoader.hide()
                            self.object  = self.power7Content[self.currentStageId != nil ?self.currentStageId :0]
                            if self.currentStageId != nil{
                            if self.currentStageId < 2{
                             self.loadTheViewOntheBasesOfObject()
                            //    self.collectionView.reloadData()
                            }else{
                              self.loadTheCollectionViewOntheBasesOfObject()
                                
                                }
                            }else{
                                   self.loadTheViewOntheBasesOfObject()
                        }

                    }
                }
            }
        }
    }
   ////////////////////////////////////
    //MARK: IBOutlet method
    // iboutlet method
    @IBAction func reminderButtonEditedSelecterMethod(sender: AnyObject) {
     // currentStageId = object.stageId as Int
        self.performSegueWithIdentifier(kSegue_ReminderSetting, sender: self)
    }
    
    @IBAction func switchButtonChangeValueAction(sender: AnyObject) {
        var param = [String:AnyObject]()
        param["PatientId"] = LiveNutriFitApi.sharedInstance.loginData.patientId
        param["StageId"] = currentStageId + 1
        param["Module"] = "PowerOf7"
       
        if !switchButton.on{
            print( "The Switch is On")
            switchButton.setOn(true, animated:true)
            btnEditedReminder.titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
            btnEditedReminder.titleLabel?.textAlignment = NSTextAlignment.Center
            let reminder = NSMutableAttributedString(string: editReminder, attributes: [NSFontAttributeName:UIFont(name: "HelveticaNeue-Medium", size: 14.0)!,NSForegroundColorAttributeName:UIColor.blackColor()])
            reminder.addAttribute(NSForegroundColorAttributeName, value: UIColor.lightGrayColor(), range: NSRange(location:9,length:4))
            reminder.addAttribute(NSFontAttributeName, value: UIFont(name:"HelveticaNeue-Medium", size: 12)!, range:NSRange(location:9,length:4) )
            btnEditedReminder.setAttributedTitle(reminder, forState: UIControlState.Normal)
            param["IsActive"] = 0
            SetReminderOffV2WebServiceCalling(param)
           
        } else {
            print("Switch is off")
            switchButton.setOn(false, animated:true)
            let reminder = NSMutableAttributedString(string: onlyReminder, attributes: [NSFontAttributeName:UIFont(name: "HelveticaNeue-Medium", size: 14.0)!])
            reminder.addAttribute(NSForegroundColorAttributeName, value: UIColor.lightGrayColor(), range: NSRange(location: 0,length:NSString(string: reminder.string).length ))
            btnEditedReminder.setAttributedTitle(reminder, forState: UIControlState.Normal)
            param["IsActive"] = 1
            SetReminderOffV2WebServiceCalling(param)
        }
        
      
    }
    func SetReminderOffV2WebServiceCalling(param:[String:AnyObject]){
        ConnectionClass.patientLoginServiceImplementation(param, withUrlString: kSetReminderOffV2) { (data, error) -> Void in
            if error != nil{
                print(error?.description)
            }else{
                if data != nil{
                    do {
                        let result = try NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers)as! NSDictionary
                        if let dict = result["d"] as? String {
                            let jsonData = self.convertStringToDictionary(dict)
                            print(jsonData)
                            if let requestStatus = jsonData!["Status"] as? [String:AnyObject] {
                                if let Status = requestStatus["Status"] as? Int{
                                    if Status == 1{
                                        dispatch_async(dispatch_get_main_queue(), {
                                            self.webServiceCallingTogetPowerOfSevenData()
                                        })
                                        
                                    }
                                }
                            }
                        }
                       // print("Result -> \(result)")
                    } catch {
                        print("Error -> \(error)")
                    }
                }else{
                    // network not connected
                    
                }
            }
        }

    }
    

    @IBAction func imageViewSelectionAction(sender: AnyObject) {
        
        if Int(object.totalClick) < Int(object.threshold){
         var param = [String:AnyObject]()
        param["patientId"] = LiveNutriFitApi.sharedInstance.loginData.patientId
        param["stageId"] = Int(object.stageId)
        param["itemId"] = Int(subObject.powerItemId)
        PowerOfSevenUpdateWebServiceCalling(param, withjson: kManagePowerOfSevenPoint)
        }
    }
    
    func PowerOfSevenUpdateWebServiceCalling(param:[String:AnyObject], withjson type:String) {
        ConnectionClass.patientLoginServiceImplementation(param, withUrlString: type) { (data, error) -> Void in
            if error != nil{
                print(error?.description)
            }else{
                if data != nil{
                    do {
                        let result = try NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers)as! NSDictionary
                        if let dict = result["d"] as? String {
                            let jsonData = self.convertStringToDictionary(dict)
                           print(jsonData)
                              if let requestStatus = jsonData!["Status"] as? [String:AnyObject] {
                            if let Status = requestStatus["Status"] as? Int{
                                if Status == 1{
                                     dispatch_async(dispatch_get_main_queue(), {
                                 self.webServiceCallingTogetPowerOfSevenData()
                                    })
                                    
                                }
                            }
                          }
                        }
                     //   print("Result -> \(result)")
                    } catch {
                        print("Error -> \(error)")
                    }
                }else{
                    // network not connected
                    
                }
            }
        }
        
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
            nextViewController.title = object.stageName
            nextViewController.stageId = currentStageId + 1
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
          cell.lblClickView.hidden = true
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
        if subObjectData.click != 0{
            cell.lblClickView.hidden = false
            cell.lblClickView.text = "\(subObjectData.click)X"
            
        }
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
        return cell
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        switch currentStageId {
        case 5,6:
            let itemSizeWidth = self.collectionView.frame.size.width - 10
            let itemSizeheight = self.collectionView.frame.size.height - 5
            return CGSizeMake(itemSizeWidth/1, itemSizeheight/3)
        default:
            let itemSizeWidth = self.collectionView.frame.size.width - 5
            let itemSizeheight = self.collectionView.frame.size.height - 5
            return CGSizeMake(itemSizeWidth/2, itemSizeheight/3)
        }
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){
        
        subObject = subObjectArray[indexPath.row]
        if Int(object.totalClick) < Int(object.threshold){
            var param = [String:AnyObject]()
            param["patientId"] = LiveNutriFitApi.sharedInstance.loginData.patientId
            param["stageId"] = Int(object.stageId)
            param["itemId"] = Int(subObject.powerItemId)
            PowerOfSevenUpdateWebServiceCalling(param, withjson: kManagePowerOfSevenPoint)
        }
    }

}
