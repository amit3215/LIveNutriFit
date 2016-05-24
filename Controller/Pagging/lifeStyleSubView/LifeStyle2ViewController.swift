//
//  LifeStyle2ViewController.swift
//  LIveNutriFit
//
//  Created by pragya on 21/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class LifeStyle2ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    // content array
    var arrayOfArray:[[String:[String]]] = [[String:[String]]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        createContentList()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // content creater
    func createContentList(){
        for (index,object) in kLifeStyle2Array.enumerate(){
            switch index {
            case 0:
                let dict:[String:[String]] = [object:kCheatMealDay]
                arrayOfArray.append(dict)
            case 1:
                let dict:[String:[String]] = [object:kCheatMealTime]
                arrayOfArray.append(dict)
            case 2:
                let dict:[String:[String]] = [object:kCardioPreference]
                arrayOfArray.append(dict)
            default:
                let dict:[String:[String]] = [object:kSleepHours]
                arrayOfArray.append(dict)
            }
        }
    }
// table view delegate method
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let dict = arrayOfArray[indexPath.row]
        switch indexPath.row {
        case 0:
            let cellIdentifier = "cheatDay"
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! lifestyleDayTableViewCell
            for (key,value) in dict{
                cell.lblcellHeader.text = key
                cell.btnDay1.setTitle(value[0], forState: UIControlState.Normal)
                cell.btnDay2.setTitle(value[1], forState: UIControlState.Normal)
                cell.btnDay3.setTitle(value[2], forState: UIControlState.Normal)
                cell.btnDay4.setTitle(value[3], forState: UIControlState.Normal)
                cell.btnDay5.setTitle(value[4], forState: UIControlState.Normal)
                cell.btnDay6.setTitle(value[5], forState: UIControlState.Normal)
                cell.btnDay7.setTitle(value[6], forState: UIControlState.Normal)
            }
            cell.selectionStyle = .None
            return cell
        case 1:
            let cellIdentifier = "threeButtonSingleSelection"
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! lifeStyle3btnSingleSeltTableViewCell
            for (key,value) in dict{
                cell.lblCellHeader.text = key
                cell.btnFirst.setTitle(value[0], forState: UIControlState.Normal)
                cell.btnSecond.setTitle(value[1], forState: UIControlState.Normal)
                cell.btnThird.setTitle(value[2], forState: UIControlState.Normal)
            }
            cell.selectionStyle = .None
            return cell
        case 2:
            let cellIdentifier = "lifeStyle5ButtonMultipleSelection"
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! LifeStyleMultipleSelectionTableViewCell
            for (key,value) in dict{
                cell.lbl_CellTitle.text = key
                cell.btn_firstPrefrence.setTitle(value[0], forState: UIControlState.Normal)
                cell.btn_SecondPrefrence.setTitle(value[1], forState: UIControlState.Normal)
                cell.btn_ThirdPrefrence.setTitle(value[2], forState: UIControlState.Normal)
                cell.btn_ForthPrefrence.setTitle(value[3], forState: UIControlState.Normal)
                cell.btn_FifthPrefrence.setTitle(value[4], forState: UIControlState.Normal)
            }
            cell.selectionStyle = .None
            return cell

        default:
            let cellIdentifier = "sleepHours"
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! DailySleepHoursTableViewCell
            for (key,value) in dict{
                cell.lblCellHeader.text = key
                cell.btn1.setTitle(value[0], forState: UIControlState.Normal)
                cell.btn2.setTitle(value[1], forState: UIControlState.Normal)
                cell.btn3.setTitle(value[2], forState: UIControlState.Normal)
                cell.btn4.setTitle(value[3], forState: UIControlState.Normal)
                cell.btn5.setTitle(value[4], forState: UIControlState.Normal)
            }
            cell.selectionStyle = .None
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return  80
        case 2:
            return 130
        default:
            return 80
        }
    }
}
