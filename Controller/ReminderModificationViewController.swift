//
//  ReminderModificationViewController.swift
//  LIveNutriFit
//
//  Created by pragya on 20/05/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit
protocol AlertModification {
    func AlertModification(newData:RemiderData, andWith type:Bool)
}

class ReminderModificationViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
 @IBOutlet weak var tableView: UITableView!
    var frequency:[Int]!
    var interval = [1,2,3,4,6,8,12]
    var frequencyExtended :Bool = false
    var intervalExtended:Bool = false
    var reminderData:RemiderData!
    var stageId:Int!
    var delegate:AlertModification!
    override func viewDidLoad() {
        super.viewDidLoad()
       createFrequencyList()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        
    }
    // create content of frequency or interval
    func createFrequencyList(){
        frequency = [Int]()
        for index in 1...12 {
            frequency.append(index)
        }
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
            if frequencyExtended{
              return frequency.count
            }else{
                return 4
            }
        }else{
            if intervalExtended{
            return interval.count
            }else{
                return 4
            }
        }
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  headerCell = tableView.dequeueReusableCellWithIdentifier("HeaderCell") as! CustomHeaderCell
        switch (section) {
        case 0:
            headerCell.lblCellHeader.text = "FREQUENCY";
        //return sectionHeaderView
        case 1:
            headerCell.lblCellHeader.text = "INTERVALS";
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
         if frequencyExtended{
           cell?.textLabel?.text = "\(frequency[indexPath.row]) time in a day"
         }else{
            if indexPath.row == 3{
               cell?.textLabel?.text = "More"
            }else{
              cell?.textLabel?.text = "\(frequency[indexPath.row]) time in a day"
            }
          }
        }else{
            if intervalExtended{
            cell?.textLabel?.text = "Every \(interval[indexPath.row]) Hours"
            }else{
                if indexPath.row == 3{
                    cell?.textLabel?.text = "More"
                }else{
                    cell?.textLabel?.text = "Every \(interval[indexPath.row]) Hours"
                }
            }
        }
        return cell!
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.section {
        case 0:
            if frequencyExtended{
                // cahnge in service here
                reminderData.frequency = frequency[indexPath.row]
               methodToCreateFrequencyBaseAlertList()
                delegate.AlertModification(reminderData, andWith:true)
            }else{
                if indexPath.row == 3{
                    frequencyExtended = true
                    intervalExtended = false
                  tableView.reloadData()
                }else{
                    reminderData.frequency = frequency[indexPath.row]
                    methodToCreateFrequencyBaseAlertList()
                    delegate.AlertModification(reminderData, andWith:true)

                }
            }
        default:
            if intervalExtended{
            // cahnge in service here
                reminderData.interval = interval[indexPath.row]
                methodToCreateIntervalBaseAlertList()
               delegate.AlertModification(reminderData, andWith:false)

            }else{
                if indexPath.row == 3{
                    frequencyExtended = false
                    intervalExtended = true
                    tableView.reloadData()
                }else{
                    // cahnge in service here
                    reminderData.interval = interval[indexPath.row]
                    methodToCreateIntervalBaseAlertList()
                   delegate.AlertModification(reminderData, andWith:false)

                }
            }
        }
    }

 // service calling to update the reminder data
    func methodToCreateFrequencyBaseAlertList(){
        var startTime:Float = (reminderData.StartTime).floatValue
        let hourDiffrence  = (reminderData.EndTime).floatValue - (reminderData.StartTime).floatValue
        let minDiffrence = hourDiffrence * 60
        let alertDiffrence = round(minDiffrence/Float(reminderData.frequency - 1))
        var timeString:[String] = []
         timeString.append(reminderData.StartTime)
        if reminderData.frequency > 1{
            if reminderData.frequency > 2{
        for  _ in 1...reminderData.frequency-2 {
          
            let startTimeMint = startTime * 60 + alertDiffrence
            let rawValue = startTimeMint/60
            let extraminute = rawValue%1
           
            let hour  = Int(rawValue - extraminute)
            let mint = Int(round(extraminute * 60))
            let alarmtime = "\(hour).\(mint)"
            timeString.append(alarmtime)
            startTime  = (alarmtime).floatValue
                }
            }
            timeString.append(reminderData.EndTime)
        }
//        timeString.joinWithSeparator("~")
         reminderData.timeList = timeString
    }
    func methodToCreateIntervalBaseAlertList(){
        
        var startTime:Float = (reminderData.StartTime).floatValue
        let hourDiffrence  = (reminderData.EndTime).floatValue - (reminderData.StartTime).floatValue
        var numberOfAlarm = Int(hourDiffrence)/reminderData.interval
        switch  numberOfAlarm{
        case 1:
            numberOfAlarm += 1
        case 2:
            if  reminderData.interval == 8{
                 numberOfAlarm += 0
            }else{
            numberOfAlarm += 1
            }
          default:
            print("none")
            
        }
         var timeString:[String] = []
         timeString.append(reminderData.StartTime)
        if numberOfAlarm > 1{
             if numberOfAlarm >= 2{
        for _ in 0...numberOfAlarm - 2{
            let  alarm = Int(startTime) + reminderData.interval
             timeString.append(String(alarm))
              startTime  = Float(alarm)
                }}
           timeString.append(reminderData.EndTime)
        }
        //    timeString.joinWithSeparator("~")
        reminderData.timeList = timeString
     //   kManageRemindersV2
    }

    
}


// MARK:- Note
////// Important lo=ine need to remender
//let stringRepresentation = array.joinWithSeparator("-")
//let startTime:Float = (reminderData.StartTime).floatValue
//let endTime:Float = (reminderData.EndTime).floatValue
//let list = Array(startTime.stride(to: endTime, by: Float(reminderData.interval)))
//var timeString:[String] = []
//for object in list{
//    timeString.append(String(object))
//}
//reminderData.timeList = timeString

