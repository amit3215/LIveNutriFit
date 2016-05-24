//
//  HavePasswordViewController.swift
//  LIveNutriFit
//
//  Created by pragya on 25/03/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class HavePasswordViewController: UIViewController,UITextFieldDelegate {
   //IBoutlet button
    @IBOutlet weak var btn_letsGo: UIButton!
    // textfield
    @IBOutlet weak var txtfld_Password: MKTextField!
    @IBOutlet weak var lbl_HavePasswordText: UILabel!
    //view controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        
    }
    func updateView(){
        btn_letsGo.setTitle(kConfirmationCode, forState: UIControlState.Normal)
        lbl_HavePasswordText.text = kHavePasswordText
        txtfld_Password.layer.borderColor = UIColor.clearColor().CGColor
        txtfld_Password.bottomBorderEnabled = true
        txtfld_Password.tintAdjustmentMode = UIViewTintAdjustmentMode.Normal
        txtfld_Password.placeholder = kPlaceholderPassword
        txtfld_Password.floatingLabelTextColor =  kColor_navigationBar
        txtfld_Password.isMandatory = false
        txtfld_Password.tintColor = kColor_navigationBar
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Iboutlet action method
    @IBAction func letsGoactionOnTapped(sender: AnyObject) {
        self.view.endEditing(true)
        var param = [String:String]()
        param[kJsonKey_EmailId] = LiveNutriFitApi.sharedInstance.mailId as String
        //"narendra.kumar@sirez.com"
        param[kJsonKey_Password] = LiveNutriFitApi.sharedInstance.password as String
        //"123456"
        param[kJsonKey_DeviceId] = ""
        param[kJsonKey_DeviceType] = ""
        param[kJsonKey_AppVersion] = ""
        param[kJsonKey_DeviceInfo] = ""
       ConnectionClass.patientLoginServiceImplementation(param, withUrlString: kPatientLogin) { (data, error) -> Void in
        if error != nil{
            print(error?.description)
        }else{
            if data != nil{
            do {
                let result = try NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers)as! NSDictionary
                self.responceParsingforPatientLogin(result)
                
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
    
    func responceParsingforPatientLogin(result:NSDictionary)
    {
        if let dict = result["d"] as? String {
        //    print(dict)
           let jsonData = convertStringToDictionary(dict)
            print(jsonData)
            if let requestStatus = jsonData!["Status"] as? [String:AnyObject] {
                if let status = requestStatus["Status"] as? Int{
                    if status == 1{
                      if let afterLoginDetail = jsonData!["AfterLoginDetail"] as? [[String:AnyObject]]{
                        let parseData = ParserApi.parsonPatientLoginResponce(afterLoginDetail)
                        dispatch_async(dispatch_get_main_queue()) {
                            self.performSegueWithIdentifier(kSegue_DashBord, sender: self)
                        }
                        LiveNutriFitApi.sharedInstance.loginData = parseData
                    }
                  }
            }  }
        }
    }
    //MARK:- text field delegate method
    func textFieldDidEndEditing(textField: UITextField) {
        //  print("textFieldDidEndEditing")
        LiveNutriFitApi.sharedInstance.password = txtfld_Password.text!
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // print("textFieldShouldReturn")
        return true
    }
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == kSegue_DashBord{
            let nextViewController  = segue.destinationViewController as! DashboardViewController
            nextViewController.title = "title"
        }
    }

}
