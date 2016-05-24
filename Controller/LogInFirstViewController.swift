//
//  LogInFirstViewController.swift
//  LIveNutriFit
//
//  Created by Chetu-macmini-26 on 18/02/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class LogInFirstViewController: UIViewController,UITextFieldDelegate {
  
  @IBOutlet var textField_MobileNo: MKTextField!
  @IBOutlet var View_BaseView: UIView!
  // button
  @IBOutlet var button_HavePassword: UIButton!
  @IBOutlet var button_GenerateOTP: UIButton!
//MARK:- controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        SetButtonTitleOnButton()
        // Do any additional setup after loading the view.
    }
  override func viewWillAppear(animated: Bool) {
    let navigationBar = self.navigationController?.navigationBar
    navigationBar?.barStyle = UIBarStyle.Default
    navigationBar?.barTintColor = kColor_navigationBar
    navigationBar?.tintColor = UIColor.whiteColor()
    navigationBar?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
  }
  
  override func viewDidAppear(animated: Bool) {
   
  }
  override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent;
   }

  override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
  }
  //MARK:- method setting view
  func SetButtonTitleOnButton(){
    // have password
    button_HavePassword.setTitle(kHavePassword, forState: UIControlState.Normal)
    // generate otp
    button_GenerateOTP.setTitle(kGenerateOtp, forState: UIControlState.Normal)
    // text field
    let imageView = UIImageView();
    let image = UIImage(named: "MobileIcon");
    imageView.image = image;
    imageView.frame = CGRect(x: 0 , y:0 , width: 20, height: 20)
    textField_MobileNo.layer.borderColor = UIColor.clearColor().CGColor
    textField_MobileNo.bottomBorderEnabled = true
    textField_MobileNo.tintAdjustmentMode = UIViewTintAdjustmentMode.Normal
    textField_MobileNo.rightViewMode = UITextFieldViewMode.Always
   
    textField_MobileNo.placeholder = kPlaceholderEmailId
    textField_MobileNo.isMandatory = false
    textField_MobileNo.validate()
    textField_MobileNo.presentInView = self.view
    textField_MobileNo.addRegx(kREGEX_EMAIL, withMsg:kValidateEmailMessage)
     textField_MobileNo.rightView = imageView
  }
    //MARK:- IBoutlet selection method
    @IBAction func havePasswordActionOnTapped(sender: AnyObject) {
         textField_MobileNo.isMandatory = true
        if textField_MobileNo.validate(){
        self.view.endEditing(true)
        
         performSegueWithIdentifier(kSegue_HavePassword, sender: self)
        }
        
    }
    @IBAction func generateOtpActionOnTapped(sender: AnyObject) {
         self.view.endEditing(true)
        var param = [String:String]()
        param[kJsonKey_Email] = LiveNutriFitApi.sharedInstance.mailId as String
        param[kJsonKey_DeviceId] = ""
        param[kJsonKey_DeviceType] = ""
        param[kJsonKey_AppVersion] = ""
        param[kJsonKey_DeviceInfo] = ""
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
        ConnectionClass.patientLoginServiceImplementation(param, withUrlString: KPatientLoginOTP) { (data, error) -> Void in
            
            if error != nil{
                print(error?.description)
            }else{
                if data != nil{
                do {
                    let result = try NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers)as! NSDictionary
                    self.responceParsingforPatientLoginOTP(result)
                    //navigation syntax 
                    // do some task
                    dispatch_async(dispatch_get_main_queue()) {
                    self.performSegueWithIdentifier(kSegue_LoginSecond, sender: self)
                    }
                } catch {
                    print("Error -> \(error)")
                }
                }else{
                    //  network not reachable
                }
                }
            }
        }
    }
  //MARK:- text field delegate method
    func textFieldDidEndEditing(textField: UITextField) {
       //  print("textFieldDidEndEditing")
        LiveNutriFitApi.sharedInstance.mailId = textField_MobileNo.text!
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // print("textFieldShouldReturn")
        return true

    }
    // completetion method
    func responceParsingforPatientLoginOTP(result:NSDictionary)
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
        if let dict = result["d"] as? String {
            let jsonData = self.convertStringToDictionary(dict)
            if let requestStatus = jsonData!["Status"] as? [String:AnyObject] {
                if let status = requestStatus["Status"] as? Int{
                    if status == 1{
                        if let otp = jsonData!["OTP"]as? String{
                         LiveNutriFitApi.sharedInstance.oneTimePassword = Int(otp)!
                            print(otp)
                        }
                        if let afterLoginDetail = jsonData!["PersonalDetail"] as? [[String:AnyObject]]{
                            let parseData = ParserApi.parsonPatientLoginResponce(afterLoginDetail)
                            LiveNutriFitApi.sharedInstance.loginData = parseData
                        }
                    }
                }
            }
        }
        }
    }

    
    
    // MARK: - Navigation
 override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    self.navigationController?.navigationBarHidden = false
    if segue.identifier == kSegue_LoginSecond{
    let nextViewController  = segue.destinationViewController as! GenerateOtpViewController
        nextViewController.title = "title"
    }else if segue.identifier == kSegue_HavePassword{
        let nextViewController  = segue.destinationViewController as! HavePasswordViewController
        nextViewController.title = "title"
    }
    }
  
}
