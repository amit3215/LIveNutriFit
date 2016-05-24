//
//  LoginSecondViewController.swift
//  LIveNutriFit
//
//  Created by Chetu-macmini-26 on 24/02/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class GenerateOtpViewController: UIViewController {
  // button
    @IBOutlet weak var btn_letsGo: UIButton!
  //label
    @IBOutlet weak var label_ConformationText: UILabel!
  //textfield
    @IBOutlet weak var txtfld_ConformationCode: MKTextField!
    // local variable
   var oneTimePassword:Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func updateView(){
        btn_letsGo.setTitle(kConfirmationCode, forState: UIControlState.Normal)
        label_ConformationText.text = kConfirmationCodeText
        txtfld_ConformationCode.layer.borderColor = UIColor.clearColor().CGColor
        txtfld_ConformationCode.bottomBorderEnabled = true
        txtfld_ConformationCode.tintAdjustmentMode = UIViewTintAdjustmentMode.Normal
        txtfld_ConformationCode.placeholder = kPlaceholderConfirmationCode
        txtfld_ConformationCode.floatingLabelTextColor =  kColor_navigationBar
        txtfld_ConformationCode.isMandatory = false
        
    }
  //MARK:- text field delegate method
    func textFieldDidEndEditing(textField: UITextField) {
        //  print("textFieldDidEndEditing")
        oneTimePassword = Int(txtfld_ConformationCode.text!)
        //print(oneTimePassword)
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
         self.view.endEditing(true)
        return true
        
    }
     // MARK: - IBoutlet action method
    @IBAction func letsGoActionOnTapped(sender: AnyObject) {
         self.view.endEditing(true)
        print(oneTimePassword)
        print(LiveNutriFitApi.sharedInstance.oneTimePassword)
        if oneTimePassword == LiveNutriFitApi.sharedInstance.oneTimePassword{
     //       self.presentViewController(vc, animated: true, completion: nil)
          //  self.performSegueWithIdentifier(kSegue_DashBord, sender: self)
            let appDelegate = UIApplication.sharedApplication().delegate! as! AppDelegate
            let initialViewController = self.storyboard!.instantiateViewControllerWithIdentifier("TabBarController") 
            appDelegate.window?.rootViewController = initialViewController
            appDelegate.window?.makeKeyAndVisible()
//            // make a root of the main view
           
        }else{
            let alertController = UIAlertController(title: "Wrong Entry", message: "You have entered Wrong OTP", preferredStyle: .Alert)
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            presentViewController(alertController, animated: true, completion: nil)
        }
    }
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == kSegue_DashBord{
            let nextViewController  = segue.destinationViewController as! DashboardViewController
            nextViewController.title = "title"
        }
       
    }

}
