//
//  NutriFitPlanViewController.swift
//  LIveNutriFit
//
//  Created by pragya on 07/06/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class NutriFitPlanViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      webServiceCallingTogetOfferData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - web Service method
    func webServiceCallingTogetOfferData(){
        dispatch_async(dispatch_get_main_queue(), {
            self.actionShowLoader()
            SwiftLoader.show("Loading...", animated: true)
        })
        var param = [String:AnyObject]()
        param[kJsonKey_Patientid] = 1141
        param[kJsonKey_IsWeightJounryChange] = 0
      

        nutriFitPlanWebServiceCalling(param, withUrlType: kGetMealAndFitnesslPlanV5)
        
    }
    
    
    func nutriFitPlanWebServiceCalling(param:[String:AnyObject], withUrlType Url:String) {
        ConnectionClass.patientLoginServiceImplementation(param, withUrlString: Url) { (data, error) -> Void in
            if error != nil{
                print(error?.description)
            }else{
                if data != nil{
                    do {
                        let result = try NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers)as! NSDictionary
                        self.responceParsingforOfferData(result)
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
    func responceParsingforOfferData(result:NSDictionary)
    {
        if let dict = result["d"] as? String {
            let jsonData = convertStringToDictionary(dict)
            //  print(jsonData)
            if let requestStatus = jsonData!["Status"] as? [String:AnyObject] {
                if let status = requestStatus["Status"] as? Int{
                    if status == 1{
                        if let data = jsonData!["ResponseStatus"] as? NSArray{
                       let offerList = ParserApi.parsingOfferArrayList(data)
                            print(offerList)
                            dispatch_async(dispatch_get_main_queue(), {
                              //  self.tableView.delegate = self
                              //  self.tableView.dataSource = self
                              //  self.tableView.reloadData()
                                SwiftLoader.hide()
                            })
                        }
                        SwiftLoader.hide()
                    }
                }
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
