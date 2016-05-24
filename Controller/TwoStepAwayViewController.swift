//
//  TwoStepAwayViewController.swift
//  LIveNutriFit
//
//  Created by pragya on 29/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class TwoStepAwayViewController: UIViewController {
    @IBOutlet weak var lblTwoStepAwayText: UILabel!

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var imageViewBg: UIImageView!
     var parseData:[CoachDetail]!
    override func viewDidLoad() {
        super.viewDidLoad()
   lblTwoStepAwayText.text = kTwoStepAwayText
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // iboutlet method
    @IBAction func arrowButtonTappedAction(sender: AnyObject) {
        var param = [String:AnyObject]()
        param[kJsonKey_IsActive] = 1
        ConnectionClass.patientLoginServiceImplementation(param, withUrlString: kDieticianDetailList) { (data, error) -> Void in
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
            if let dieticianList = jsonData!["DieticianList"] as? [[String:AnyObject]] {
                parseData = [CoachDetail]()
                parseData = ParserApi.parsingCoachDetailData(dieticianList)
                dispatch_async(dispatch_get_main_queue(),{
                  self.performSegueWithIdentifier(kSegue_CoachDiscription, sender: self)
                })
                }}else{
                // if not sucess
            }
            }
        }
    }
    // MARK: - Navigation


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == kSegue_CoachDiscription{
            let nextViewController  = segue.destinationViewController as! CoachDetailsViewController
            nextViewController.parseData =  parseData
        }
 
    }

}
