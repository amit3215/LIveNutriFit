//
//  ViewController.swift
//  LIveNutriFit
//
//  Created by Chetu-macmini-26 on 13/02/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class FirstMainView: UIViewController {
  // view content
  //button
  @IBOutlet var button_Login: UIButton!
  @IBOutlet var button_Register: UIButton!
  // view
  @IBOutlet var label_ContentView: UILabel!
  
  @IBOutlet var label_DrName: UILabel!
  //label
  var label_login:UILabel!
  var label_register:UILabel!

//  var loginButtonCustomView:LoginButtonView = LoginButtonView()
//  var registerButtonCustomView:LoginButtonView = LoginButtonView()
  
//MARK:- controller life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
   
    

  }
  override func viewWillAppear(animated: Bool) {
    
   self.navigationController?.navigationBarHidden = true
   self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
    
  }
  override func viewDidAppear(animated: Bool) {
    SetButtonTitleOnButton()
    // demo views
    
    //    let DynamicView = UIView(frame: CGRectMake(0, 0,50,20))
    //    DynamicView.backgroundColor=UIColor.greenColor()
    //    DynamicView.center = CGPointMake(button_Login.bounds.width/2, button_Login.bounds.height/2 );
    //    button_Login.addSubview(DynamicView)
    //
    //    let DynamicView2 = UIView(frame: CGRectMake(0, 0,50,20))
    //    DynamicView2.center = CGPointMake(button_Register.frame.width/2,button_Register.frame.height/2  );
    //    DynamicView2.backgroundColor = UIColor.yellowColor()
    //    button_Register.addSubview(DynamicView2)
    
    
    
    //  loginButtonCustomView.upperLabel.text = kLoginUpper
    // loginButtonCustomView.lowerLabel.text = kLoginLower
    //loginButtonCustomView.center = button_Login.center
    //loginButtonCustomView.center = CGPointMake(button_Login.frame.width/2, button_Login.frame.height/2 );
    //loginButtonCustomView.translatesAutoresizingMaskIntoConstraints = false
    //  button_Login.addSubview(loginButtonCustomView)
    //    registerButtonCustomView.upperLabel.text = kRegisterUpper
    //    registerButtonCustomView.lowerLabel.text = kRegisterLower
    // registerButtonCustomView.center = CGPointMake(button_Register.frame.width/2, button_Register.frame.height/2 );
    //  registerButtonCustomView.center = button_Register.center
    //   button_Register.addSubview(registerButtonCustomView)
    
    //
    
  }

  override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return UIStatusBarStyle.LightContent
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
//MARK:- button content setting method
  func SetButtonTitleOnButton(){
    // login button
    button_Login.titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
    button_Login.titleLabel?.textAlignment = NSTextAlignment.Center
    var loginMutableStr = NSMutableAttributedString()
    loginMutableStr = NSMutableAttributedString(string: kLoginText, attributes: [NSFontAttributeName:UIFont(name: "HelveticaNeue-Medium", size: 15.0)!])
    loginMutableStr.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor(), range: NSRange(location:7,length:15))
    loginMutableStr.addAttribute(NSFontAttributeName, value: UIFont(name:"HelveticaNeue-Medium", size: 10)!, range:NSRange(location:7,length:15) )
    button_Login.setAttributedTitle(loginMutableStr, forState: UIControlState.Normal)
   
    // RegisterButton button
    button_Register.titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
    button_Register.titleLabel?.textAlignment = NSTextAlignment.Center
    var registerMutableStr = NSMutableAttributedString()
    registerMutableStr = NSMutableAttributedString(string: kRegisterText, attributes: [NSFontAttributeName:UIFont(name: "HelveticaNeue-Medium", size: 15.0)!])
    registerMutableStr.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor(), range: NSRange(location:9,length:10))
    registerMutableStr.addAttribute(NSFontAttributeName, value: UIFont(name:"HelveticaNeue-Medium", size: 10)!, range:NSRange(location:9,length:10) )
    button_Register.setAttributedTitle(registerMutableStr, forState: UIControlState.Normal)
    // other label content
        label_ContentView.text = kConstantText
        label_DrName.text = kDoctorName

  }
  
  
  
//MARK:- Iboutlet methods
  @IBAction func loginButtonAction(sender: AnyObject) {
     performSegueWithIdentifier(kSegue_LoginFirst, sender: self)
    
  }
  
  @IBAction func registerButtonAction(sender: AnyObject) {
    performSegueWithIdentifier(kSegue_RegistrationView, sender: self)
  }
  //MARK:- Navigate to Nextview
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     self.navigationController?.navigationBarHidden = false
    if segue.identifier == kSegue_RegistrationView{
      let nextViewController  = segue.destinationViewController as! RegisterViewController
      nextViewController.title = kTitle_Register
    }
    
    if segue.identifier == kSegue_LoginFirst{
      let nextViewController  = segue.destinationViewController as! LogInFirstViewController
      nextViewController.title = kTitle_LogIn
    }
  }
  
}
//code to  make button line  brake able and aline center
//    button_Login.titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
//    button_Login.titleLabel?.textAlignment = NSTextAlignment.Center

