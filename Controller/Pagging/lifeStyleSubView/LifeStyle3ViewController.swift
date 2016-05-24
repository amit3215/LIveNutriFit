//
//  LifeStyle3ViewController.swift
//  LIveNutriFit
//
//  Created by pragya on 21/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class LifeStyle3ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,lifestyleSwitch,drinkNo {
    
    @IBOutlet weak var tableView: UITableView!
    
  var lifeStyle3arrayList:[[String:AnyObject]]!
  var visibleCell:[[String:AnyObject]] = [[String:AnyObject]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        contentArrayForExpendedCell()
        noOfCellCalculation()
        // Do any additional setup after loading the view.
    }
    func contentArrayForExpendedCell(){
        lifeStyle3arrayList = [[String:AnyObject]]()
        for (index,object) in klifeStyle3Array.enumerate(){
            var dict = [String:AnyObject]()
            switch index {
            case 0:
                dict["Title"] = object
                dict["isExpandable"] = false
                dict["isExpanded"] = false
                dict["isVisible"] = true
                dict["cellIdentifier"] = "onlyHeader"
            case 1,4,7:
                dict["Title"] = object
                dict["isExpandable"] = false
                dict["isExpanded"] = false
                dict["isVisible"] = true
                dict["Tag"] = index
                dict["cellIdentifier"] = "headerWithSwitch"
            case 2,5,8:
                dict["Title"] = object
                dict["isExpandable"] = true
                dict["isExpanded"] = false
                if index == 2{
                dict["isDisable"] = LiveNutriFitApi.sharedInstance.alcohol
                }else if index == 5{
                 dict["isDisable"] = LiveNutriFitApi.sharedInstance.smoking
                }else{
                  dict["isDisable"] = LiveNutriFitApi.sharedInstance.chewingTabacco
                }
                dict["isVisible"] = true
                dict["tag"] = index
                dict["cellIdentifier"] = "drinkDropDown"
            case 3,6,9:
                dict["Title"] = object
                dict["isExpandable"] = true
                dict["isExpanded"] = false
                dict["isVisible"] = false
                dict["cellIdentifier"] = "DrinkPicker"
                dict["tag"] = index
            default:
                print("not possible")
            }
            lifeStyle3arrayList.append(dict)
        }
    }
    func noOfCellCalculation(){
        visibleCell = []
        for object in lifeStyle3arrayList{
            let isVisible = object["isVisible"] as! Bool
            if isVisible{
                visibleCell.append(object)
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return visibleCell.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
    let dict = visibleCell[indexPath.row]
    let cellIdentifier = dict["cellIdentifier"]as! String
    switch cellIdentifier {
    case kCellIdentifer_OnlyHeader:
     let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! HeaderTableViewCell
        cell.lblCellHeader.text = dict["Title"] as? String
        cell.selectionStyle = .None
        return cell
    case kCellIdentifer_HeaderWithSwitch:
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! HeaderWithSwitchTableViewCell
        cell.lblCellHeader.text = dict["Title"] as? String
        cell.switchButton.tag =  indexPath.row
        cell.selectionStyle = .None
        cell.delegate = self
        return cell
    case kCellIdentifer_DrinkDropDown:
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! DropDownTableViewCell
        cell.lblCellHeader.text = dict["Title"] as? String
        let cellDisable:Bool = dict["isDisable"] as! Bool
        if cellDisable {
            cell.lblCellHeader.text = dict["Title"] as? String
             cell.lblCellHeader.textColor = UIColor.blackColor()
            let index =  dict["tag"] as! Int
            if index == 2{
                  cell.lblNoofDrinks.text = String(LiveNutriFitApi.sharedInstance.noOfDrinks)
            }else if index == 5{
                 cell.lblNoofDrinks.text = String(LiveNutriFitApi.sharedInstance.noOfCigarette)
            }else{
                cell.lblNoofDrinks.text = String(LiveNutriFitApi.sharedInstance.noOfPack)
            }
            cell.selectionStyle = .Default
            cell.userInteractionEnabled = true
        
        }else{
            cell.lblCellHeader.text = dict["Title"] as? String
            cell.lblCellHeader.textColor = UIColor.lightGrayColor()
            cell.lblNoofDrinks.text = ""
            cell.selectionStyle = .None
            cell.userInteractionEnabled = false
        }
       
        return cell
    case kCellIdentifer_DrinkPicker:
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! DrinkPickerTableViewCell
        cell.pickerDrink.tag =  dict["tag"] as! Int
        cell.selectionStyle = .Default
        cell.delegate = self
        return cell
    default:
        return UITableViewCell()
    }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let dict = visibleCell[indexPath.row]
        let cellIdentifier = dict["cellIdentifier"]as! String
        switch cellIdentifier {
        case kCellIdentifer_DrinkPicker:
        return 180
        default:
        return 60
        }
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let dict = visibleCell[indexPath.row]
        var index:Int!
        if dict["isExpandable"]as! Bool{
            for (indexNumber,object) in lifeStyle3arrayList.enumerate(){
                if dict["Title"] as! String == object["Title"] as! String{
                    index = indexNumber
                }
            }
            var realValue = lifeStyle3arrayList[index + 1] as [String:AnyObject]
            if realValue["isVisible"] as! Bool{
                realValue["isVisible"] = false
                lifeStyle3arrayList.removeAtIndex(index + 1)
                lifeStyle3arrayList.insert(realValue, atIndex: index + 1)
            }else{
                realValue["isVisible"] = true
                lifeStyle3arrayList.removeAtIndex(index + 1)
                lifeStyle3arrayList.insert(realValue, atIndex: index + 1)
            }
        }
        noOfCellCalculation()
        tableView.reloadData()
        
    }
    // delegate method
    func cellSwitchValueChanged(Index: Int,typeOfSender switchValue:Bool){
        switch  Index {
        case 1:
            LiveNutriFitApi.sharedInstance.alcohol = switchValue
             NumberOfDrinkChanged()
        case 3:
             LiveNutriFitApi.sharedInstance.smoking = switchValue
             NumberOfDrinkChanged()
        case 5:
             LiveNutriFitApi.sharedInstance.chewingTabacco = switchValue
              NumberOfDrinkChanged()
        default:
         print("default")
        }
        
    }
    func NumberOfDrinkChanged(){
        contentArrayForExpendedCell()
        noOfCellCalculation()
        tableView.reloadData()
    }
}
