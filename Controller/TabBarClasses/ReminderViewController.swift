//
//  ReminderViewController.swift
//  LIveNutriFit
//
//  Created by pragya on 20/05/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class ReminderViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,TimeSelection,AlertModification {
    var stageId:Int!
    var reminderData:RemiderData!
    @IBOutlet weak var tableView: UITableView!
    var popViewController: UIViewController!
     var subView:UIView!
    var typeOfContent:Bool = false
    var saveButtonEable:Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
     reminderData = RemiderData()
        getReminderList()
//         reminderData = RemiderData()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        if saveButtonEable{
        
    let saveButton = UIBarButtonItem(title: "Save", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(ReminderViewController.SaveButtonPress))
     self.navigationItem.rightBarButtonItem = saveButton
        }
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  //MARK :Table view delegate data source
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }else{
            return reminderData.timeList.count
        }
    }
     func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  headerCell = tableView.dequeueReusableCellWithIdentifier("HeaderCell") as! CustomHeaderCell
        switch (section) {
        case 0:
            if typeOfContent{
                 headerCell.lblCellHeader.text = "INTERVAL";
            }else{
                headerCell.lblCellHeader.text = "FREQUENCY";
            }
        //return sectionHeaderView
        case 1:
            headerCell.lblCellHeader.text = "SET TIME";
        //return sectionHeaderView
        default:
            headerCell.lblCellHeader.text = "";
        }
        
        return headerCell
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell")
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "CELL")
        }
        if indexPath.section == 0{
            if typeOfContent{
             cell?.textLabel?.text = "Every \(reminderData.interval) Hours"
            }else{
          cell?.textLabel?.text = "\(reminderData.frequency) time in a day"
            }
        }else{
            
            cell?.textLabel?.text = reminderData.timeList[indexPath.row]
        }
      return cell!
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0{
         self.performSegueWithIdentifier(kSegue_ReminderCustomization, sender: self)
        }else{
          SelectTimeFromReminder(indexPath.row)
            
        }
    }
    
// web service calling
  func getReminderList() {
    var param = [String:AnyObject]()
    param[kJsonKey_PatientId] = LiveNutriFitApi.sharedInstance.loginData.patientId
    param[kJsonKey_Module] = kJsonKeyValue_Module
    param[kJsonKey_StageId] = stageId
    getReminderWebServiceCallling(param, withjson: kGetReminderList)
    
    }
    func  SubmitAlertData(){
    var param = [String:AnyObject]()
    param[kJsonKey_ReminderId] = reminderData.ReminderId
    param[kJsonKey_PatientId] = LiveNutriFitApi.sharedInstance.loginData.patientId
    param[kJsonKey_Module] = kJsonKeyValue_Module
    param[kJsonKey_StageId] = stageId
        if typeOfContent{
          param[kJsonKey_Frequency] = 0
          param[kJsonKey_Interval] = reminderData.interval
        }else{
            param[kJsonKey_Frequency] = reminderData.frequency
            param[kJsonKey_Interval] = 0
        }
    
    param[kJsonKey_StartTime] = reminderData.StartTime
    param[kJsonKey_EndTime] = reminderData.EndTime
    param[kJsonKey_TimeString] = reminderData.timeList.joinWithSeparator("~")
    updateReminderWebServiceCalling(param, withjson: kManageRemindersV2)
    }
    
    
    func getReminderWebServiceCallling(param:[String:AnyObject], withjson type:String) {
        ConnectionClass.patientLoginServiceImplementation(param, withUrlString: kGetReminderList) { (data, error) -> Void in
            if error != nil{
                print(error?.description)
            }else{
                if data != nil{
                    do {
                        let result = try NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers)as! NSDictionary
                        self.responceParsingforGetAlarmData(result)
                        
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
    func updateReminderWebServiceCalling(param:[String:AnyObject], withjson type:String) {
        ConnectionClass.patientLoginServiceImplementation(param, withUrlString: kManageRemindersV2) { (data, error) -> Void in
            if error != nil{
                print(error?.description)
            }else{
                if data != nil{
                    do {
                        let result = try NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers)as! NSDictionary
                        self.responceParsingforUpdateAlarmData(result)
                        
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
    func responceParsingforUpdateAlarmData(result:NSDictionary)
    {
        if let dict = result["d"] as? String {
            //    print(dict)
            let jsonData = convertStringToDictionary(dict)
            print(jsonData)
            if let requestStatus = jsonData!["Status"] as? [String:AnyObject] {
                if let status = requestStatus["Status"] as? Int{
                    if status == 1{
                        print("alarm data uploaded")
                    }
                }
            }
        }
    }

    
    
// responce parser for get alarm data
    func responceParsingforGetAlarmData(result:NSDictionary)
    {
        if let dict = result["d"] as? String {
            //    print(dict)
            let jsonData = convertStringToDictionary(dict)
            print(jsonData)
            if let requestStatus = jsonData!["Status"] as? [String:AnyObject] {
                if let status = requestStatus["Status"] as? Int{
                    if status == 1{
                     if let afterLoginDetail = jsonData!["ReminderList"] as? [String:AnyObject]{
                        if let powerOFSeven = afterLoginDetail["PowerOf7"] as? [[String:AnyObject]]{
                            print(powerOFSeven)
                        reminderData = ParserApi.parsingRemiderData(powerOFSeven)
                            if reminderData.frequency == 0{
                                typeOfContent = true
                            }else{
                                typeOfContent = false
                            }
                            print(reminderData)
                            dispatch_async(dispatch_get_main_queue()) {
                            self.tableView.reloadData()
                            }
                }
               }
             }
          }
        }
      }
    }
    //MARK popup To select the reminder time
    func SelectTimeFromReminder(index:Int){
        let viewController = self.storyboard?.instantiateViewControllerWithIdentifier("selectTime") as!
        TimeSelectionViewController
        viewController.delegate = self
        viewController.index = index
        self.popViewController = UINavigationController(rootViewController: viewController)
        //  self.popViewController.
        subView = self.popViewController.view
        subView.tag = 5001
        self.view.addSubview(subView)
    }
    
    func returnSelectedTimeFromPicker(selectedTime:SelectedTime){
        RemoveSubViewfromSuperview()
       reminderData.timeList[selectedTime.index] = "\(selectedTime.hour):\(selectedTime.minutes)"
        let indexPath = NSIndexPath(forRow: selectedTime.index, inSection: 1)
        self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Top)
        
    }
    func cancelButtonTapped(){
        RemoveSubViewfromSuperview()
    }
    func RemoveSubViewfromSuperview(){
        subView.removeFromSuperview()
    }
   
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.navigationController?.navigationBarHidden = false
       if segue.identifier == kSegue_ReminderCustomization{
            let nextViewController  = segue.destinationViewController as! ReminderModificationViewController
            nextViewController.title = self.title
            nextViewController.reminderData = self.reminderData
            nextViewController.stageId  = self.stageId
            nextViewController.delegate = self
        }
    }
    func AlertModification(newData: RemiderData, andWith type: Bool) {
        reminderData.timeList =  newData.timeList
        if type{
            reminderData.frequency = newData.frequency
            typeOfContent = false
        }else{
            reminderData.interval = newData.interval
            typeOfContent = true
        }
        saveButtonEable = true
    }
    func SaveButtonPress(){
        SubmitAlertData()
    }
   
}
