//
//  RegisterViewController.swift
//  LIveNutriFit
//
//  Created by Chetu-macmini-26 on 16/02/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    //IBoutlet button
    @IBOutlet weak var button_TermCondition: UIButton!
    @IBOutlet weak var button_CreateYourAccount: UIButton!
    // textfield
    @IBOutlet weak var txtfld_EmailID: MKTextField!
    @IBOutlet weak var txtfld_FullName: MKTextField!
    @IBOutlet weak var txtfld_MobileNo: MKTextField!
    @IBOutlet weak var label_termAndCondition: UILabel!
    var value:String!
    var agree:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        
        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.barStyle = UIBarStyle.Default
        navigationBar?.barTintColor = kColor_navigationBar
        navigationBar?.tintColor = UIColor.whiteColor()
        navigationBar?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    }
    func updateView(){
      button_CreateYourAccount.backgroundColor = kColor_CreateYourAcount
      button_CreateYourAccount.setTitle(kCreateYourAccount, forState: UIControlState.Normal)
      // textfield
      txtfld_EmailID.layer.borderColor = UIColor.clearColor().CGColor
      txtfld_EmailID.bottomBorderEnabled = true
      txtfld_EmailID.tintAdjustmentMode = UIViewTintAdjustmentMode.Normal
      txtfld_EmailID.placeholder = kPlaceholderEmailId
      txtfld_EmailID.floatingLabelTextColor =  kColor_navigationBar
      txtfld_EmailID.bottomBorderColor = kColor_navigationBar
      txtfld_EmailID.isMandatory = false
      txtfld_EmailID.tag = 3
      txtfld_EmailID.textColor = UIColor.whiteColor()
      txtfld_EmailID.validate()
      txtfld_EmailID.presentInView = self.view
      txtfld_EmailID.addRegx(kREGEX_EMAIL, withMsg:kValidateEmailMessage)
        //full name
      txtfld_FullName.layer.borderColor = UIColor.clearColor().CGColor
      txtfld_FullName.bottomBorderEnabled = true
      txtfld_FullName.tintAdjustmentMode = UIViewTintAdjustmentMode.Normal
      txtfld_FullName.placeholder = kPlaceholderFullName
      txtfld_FullName.floatingLabelTextColor =  kColor_navigationBar
      txtfld_FullName.isMandatory = false
      txtfld_FullName.tag = 2
      txtfld_FullName.textColor = UIColor.whiteColor()
      txtfld_FullName.bottomBorderColor = kColor_navigationBar
        // mobile no
      txtfld_MobileNo.layer.borderColor = UIColor.clearColor().CGColor
      txtfld_MobileNo.bottomBorderEnabled = true
      txtfld_MobileNo.tintAdjustmentMode = UIViewTintAdjustmentMode.Normal
      txtfld_MobileNo.placeholder = kPlaceholderMobileNo
      txtfld_MobileNo.tag = 1
      txtfld_MobileNo.floatingLabelTextColor =  kColor_navigationBar
      txtfld_MobileNo.isMandatory = false
      txtfld_FullName.textColor = UIColor.whiteColor()
      txtfld_FullName.bottomBorderColor = kColor_navigationBar
        // label term and condition   
        //  Terms & Conditions
        let nsText = kTermAndCondition as NSString
        let textRange = NSMakeRange(0, nsText.length)
        let attributedString = NSMutableAttributedString(string: kTermAndCondition)
        nsText.enumerateSubstringsInRange(textRange, options: .ByWords, usingBlock: {
            (substring, substringRange, _, _) in
            if (substring == "Terms" || substring == "&" || substring == "Conditions") {
                attributedString.addAttribute(NSForegroundColorAttributeName, value: kColor_navigationBar, range:substringRange)
            }})
        label_termAndCondition.attributedText = attributedString
        button_TermCondition.setImage(UIImage(named:"SelectedCheck"), forState: UIControlState.Normal)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  override func preferredStatusBarStyle() -> UIStatusBarStyle {
  return UIStatusBarStyle.LightContent;
  }
    
    //MARK:- text field delegate method
    func textFieldDidEndEditing(textField: UITextField) {
     let textfldNo = textField.tag
     switch (textfldNo){
     case 1:
        LiveNutriFitApi.sharedInstance.phoneNo = txtfld_MobileNo.text!
     case 2:
        LiveNutriFitApi.sharedInstance.nameByuser = txtfld_FullName.text!
     case 3:
         LiveNutriFitApi.sharedInstance.mailId = txtfld_EmailID.text!
     default: break
    }
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
         self.view.endEditing(true)
        return true
    }
  
    // IB action method
    @IBAction func createYourButtonActionMethod(sender: AnyObject) {
        self.view.endEditing(true)
   //       self.performSegueWithIdentifier(kSegue_PersonalDetail, sender: self)
        var param = [String:String]()
        param[kJsonKey_Email] = LiveNutriFitApi.sharedInstance.mailId as String
        param[kJsonKey_PatientName] = LiveNutriFitApi.sharedInstance.nameByuser as String
        param[kJsonKey_MobileNo] = LiveNutriFitApi.sharedInstance.mailId as String
        param[kJsonKey_DeviceId] = ""
        param[kJsonKey_DeviceType] = ""
        param[kJsonKey_AppVersion] = ""
        param[kJsonKey_DeviceInfo] = ""
        if agree{
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            ConnectionClass.patientLoginServiceImplementation(param, withUrlString: KPatient_RegisterV3) { (data, error) -> Void in
                
                if error != nil{
                    print(error?.description)
                }else{
                    if data != nil{
                        do {
                            let result = try NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers)as! NSDictionary
                            self.responceParsingforPatientLoginOTP(result)
                            //navigation syntax
                            // do some task
//                            dispatch_async(dispatch_get_main_queue()) {
//                             //   self.performSegueWithIdentifier(kSegue_LoginSecond, sender: self)
//                            }
                        } catch {
                            print("Error -> \(error)")
                        }
                    }else{
                        //  network not reachable
                    }
                }
            }
            }}else{
            // show alert agree term anf condition
        }
    }
    
    @IBAction func termAndConditionCheckandUncheck(sender: AnyObject) {
        if sender.currentImage!!.isEqual(UIImage(named: "SelectedCheck")){
            agree = false
       button_TermCondition.setImage(UIImage(named:"unselectedCheck"), forState: UIControlState.Normal)
        }else{
            agree = true
       button_TermCondition.setImage(UIImage(named:"SelectedCheck"), forState: UIControlState.Normal)
        }
    }
    // completetion method
    func responceParsingforPatientLoginOTP(result:NSDictionary)
    {
            if let dict = result["d"] as? String {
                let jsonData = self.convertStringToDictionary(dict)
                if let requestStatus = jsonData!["Status"] as?  [String:AnyObject]{
                    let status = requestStatus["Status"] as? Bool
                    if status == true{
                        dispatch_async(dispatch_get_main_queue()) {
                          self.performSegueWithIdentifier(kSegue_PersonalDetail, sender: self)
                        }
                    }else{
                    if let errorno = requestStatus["ErrNo"] as? Int{
                        if errorno == 458{
                            dispatch_async(dispatch_get_main_queue(), {
                          
                        let alertController = UIAlertController(title: "User already exists ", message: String(requestStatus["ErrDesc"]), preferredStyle: .Alert)
                         let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                          alertController.addAction(defaultAction)
                           print(String(requestStatus["ErrDesc"]))
                         self.presentViewController(alertController, animated: true, completion: nil)
                    
                   })  }}}
               
                }
            }
    }
 
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == kSegue_PersonalDetail{
            let nextViewController  = segue.destinationViewController as! PersonalDetailViewController
            nextViewController.title = "title"
        }
        
    }

    
}
