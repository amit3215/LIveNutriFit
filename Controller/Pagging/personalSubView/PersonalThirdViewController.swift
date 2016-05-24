//
//  PersonalThirdViewController.swift
//  LIveNutriFit
//
//  Created by pragya on 15/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class PersonalThirdViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,NoOfMonthChange {
    
    @IBOutlet weak var tableView: UITableView!
    
    var personal3arrayList:[[String:AnyObject]]!
    var visibleCell:[[String:AnyObject]] = [[String:AnyObject]]()
    override func viewDidLoad() {
        super.viewDidLoad()
      contentArrayForExpendedCell()
        noOfCellCalculation()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        contentArrayForExpendedCell()
        noOfCellCalculation()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func contentArrayForExpendedCell(){
        personal3arrayList = [[String:AnyObject]]()
        for (index,object) in personal3Array.enumerate(){
            var dict = [String:AnyObject]()
            switch index {
            case 0:
                dict["Title"] = object
                dict["isExpandable"] = false
                dict["isExpanded"] = false
                dict["isVisible"] = true
                dict["cellIdentifier"] = kCellIdentifer_weightReduce
            case 1:
                dict["Title"] = object
                dict["isExpandable"] = true
                dict["isExpanded"] = false
                dict["isVisible"] = true
                dict["Tag"] = index
                dict["cellIdentifier"] = kCellIdentifer_targetMonth
            case 2:
                dict["Title"] = object
                dict["isExpandable"] = false
                dict["isExpanded"] = false
                dict["isVisible"] = false
                dict["Tag"] = index
                dict["cellIdentifier"] = kCellIdentifer_MonthPicker
            case 3:
                dict["Title"] = object
                dict["isExpandable"] = true
                dict["isExpanded"] = false
                dict["isVisible"] = true
                dict["tag"] = index
                dict["cellIdentifier"] = kCellIdentifer_weightLossJourney
            case 4:
                dict["Title"] = object
                dict["isExpandable"] = false
                dict["isExpanded"] = false
                dict["isVisible"] = true
                dict["cellIdentifier"] = kCellIdentifer_description
                dict["tag"] = index
            default:
                print("not possible")
            }
            personal3arrayList.append(dict)
        }
    }
    func noOfCellCalculation(){
        visibleCell = []
        for object in personal3arrayList{
            let isVisible = object["isVisible"] as! Bool
            if isVisible{
                visibleCell.append(object)
            }
        }
    }

    
// table view delegate method
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return visibleCell.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let dict = visibleCell[indexPath.row]
        let cellIdentifier = dict["cellIdentifier"]as! String
        switch cellIdentifier {
        case kCellIdentifer_weightReduce:
            let cell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifer_weightReduce) as! WeightToReduceTableViewCell
            cell.lblCellTitle.text = dict["Title"] as? String
            cell.selectionStyle = .None
            return cell
        case kCellIdentifer_targetMonth:
            let cell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifer_targetMonth) as! TargetMonthTableViewCell
            cell.lblCellTItle.text = dict["Title"] as? String
            cell.lblcellDetailText.text = String(LiveNutriFitApi.sharedInstance.noOFMonth)
            cell.selectionStyle = .None
            return cell
        case kCellIdentifer_weightLossJourney:
            let cell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifer_weightLossJourney) as! WeightLossJourneyTableViewCell
            cell.lblCellTitle.text = dict["Title"] as? String
            cell.selectionStyle = .None
            return cell
        case kCellIdentifer_MonthPicker:
            let cell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifer_MonthPicker) as! NumberOfMonthTableViewCell
            cell.selectionStyle = .None
            cell.delegate = self
            return cell
        case kCellIdentifer_description:
            let cell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifer_description) as! DescriptionTableViewCell
           
            let cal = NSCalendar.currentCalendar()
            let date = cal.dateByAddingUnit(.Month, value: LiveNutriFitApi.sharedInstance.noOFMonth, toDate: NSDate(), options: [])
            let formatter = NSDateFormatter()
            formatter.dateStyle = NSDateFormatterStyle.LongStyle
            let dateString = formatter.stringFromDate(date!)
            let attrStringOne = NSMutableAttributedString(string: kCellDescription)
            let attrStringTwo = NSMutableAttributedString(string: dateString)
            attrStringTwo.addAttribute(NSFontAttributeName, value: UIFont(name: "HelveticaNeue",size: 15.0)!, range: NSRange(location: 0,length:NSString(string: dateString).length ))
            attrStringTwo.addAttribute(NSForegroundColorAttributeName, value: kColor_navigationBar, range: NSRange(location: 0,length:NSString(string: dateString).length ))
            
            let finalString:NSMutableAttributedString = attrStringOne
            finalString.appendAttributedString(attrStringTwo)
            
            cell.lblDescription.attributedText = finalString
            return cell
         default:
            print("no of these")
            return UITableViewCell()
        }
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let dict = visibleCell[indexPath.row]
        let cellIdentifier = dict["cellIdentifier"]as! String
        switch cellIdentifier {
        case kCellIdentifer_weightLossJourney:
            return 220
        case kCellIdentifer_description:
            return 110
        case kCellIdentifer_MonthPicker:
            return 150
        default:
            return 60
        }
        
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let dict = visibleCell[indexPath.row]
        var index:Int!
        if dict["isExpandable"]as! Bool{
            for (indexNumber,object) in personal3arrayList.enumerate(){
                if dict["Title"] as! String == object["Title"] as! String{
                    index = indexNumber
                }
            }
            var realValue = personal3arrayList[index + 1] as [String:AnyObject]
            if realValue["isVisible"] as! Bool{
                realValue["isVisible"] = false
                personal3arrayList.removeAtIndex(index + 1)
                personal3arrayList.insert(realValue, atIndex: index + 1)
            }else{
                realValue["isVisible"] = true
                personal3arrayList.removeAtIndex(index + 1)
                personal3arrayList.insert(realValue, atIndex: index + 1)
            }
        }
        noOfCellCalculation()
        tableView.reloadData()
    }
    func noOfMonthChange() {
        NSNotificationCenter.defaultCenter().postNotificationName("weightLossJourney", object: nil)
       contentArrayForExpendedCell()
        noOfCellCalculation()
        tableView.reloadData()
        
    }
}
