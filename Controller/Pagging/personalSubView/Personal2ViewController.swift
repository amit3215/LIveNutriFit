//
//  Personal2ViewController.swift
//  LIveNutriFit
//
//  Created by pragya on 15/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class Personal2ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,personal2Delegate,weightSelected,personal2Delegateheight,heightSelected,CustomSliderCellDelegate{

    @IBOutlet weak var tbleviewPersonal2: UITableView!
    var personal2arrayList:[[String:AnyObject]]!
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
        tbleviewPersonal2.reloadData()
    }
    // make a conntent array
    func contentArrayForExpendedCell(){
        personal2arrayList = [[String:AnyObject]]()
        for (index,object) in personal2Array.enumerate(){
            var dict = [String:AnyObject]()
            switch index {
            case 0:
                dict["Title"] = object
                dict["isExpandable"] = false
                dict["isExpanded"] = false
                dict["isVisible"] = true
                dict["cellIdentifier"] = "twoTypeSelection"
                print()
             case 1,3:
                dict["Title"] = object
                dict["isExpandable"] = true
                dict["isExpanded"] = false
                dict["isVisible"] = true
                if index == 1{
                dict["weightValue"] = String(format: "%.2f", LiveNutriFitApi.sharedInstance.currentWeight)
                    print(dict["weightValue"])
                }else{
                dict["weightValue"] = String(format: "%.2f", LiveNutriFitApi.sharedInstance.targerWeight)
                    print(dict["weightValue"])
                }
                dict["cellIdentifier"] = "weightPrefrences"
            case 2,4:
                dict["Title"] = object
                dict["isExpandable"] = true
                dict["isExpanded"] = false
                dict["isVisible"] = false
                dict["Tag"] = index
                dict["cellIdentifier"] = "weightPicker"
            case 5:
                dict["Title"] = object
                dict["isExpandable"] = false
                dict["isExpanded"] = false
                dict["isVisible"] = true
                dict["cellIdentifier"] = "twoTypeSelectionHeight"
            case 6:
                dict["Title"] = object
                dict["isExpandable"] = true
                dict["isExpanded"] = false
                dict["isVisible"] = true
                if LiveNutriFitApi.sharedInstance.heightPrefredUnit{
                dict["heightValue"] = String(format:"%.1f", LiveNutriFitApi.sharedInstance.height)
                    //"\(LiveNutriFitApi.sharedInstance.heightFt).\(LiveNutriFitApi.sharedInstance.heightInch)"
                }else{
                dict["heightValue"] =  String(format:"%.f", LiveNutriFitApi.sharedInstance.height)
                    //"\(LiveNutriFitApi.sharedInstance.heightcms)"
                }
                print(dict["heightValue"])
                dict["cellIdentifier"] = "heightPrefrence"
            case 7:
                dict["Title"] = object
                dict["isExpandable"] = true
                dict["isExpanded"] = false
                dict["isVisible"] = false
                dict["Tag"] = index
                dict["cellIdentifier"] = "heightSelection"
            case 8:
                dict["Title"] = object
                dict["isExpandable"] = false
                dict["isExpanded"] = false
                dict["isVisible"] = true
                dict["sliderValue"] = LiveNutriFitApi.sharedInstance.waistSize
                dict["Tag"] = index
                dict["cellIdentifier"] = "sliderCell"
            case 9:
                dict["Title"] = object
                dict["isExpandable"] = false
                dict["isExpanded"] = false
                dict["isVisible"] = true
                dict["sliderValue"] = LiveNutriFitApi.sharedInstance.hipSize
                dict["Tag"] = index
                dict["cellIdentifier"] = "sliderCell"
            default:
                print("no poible")
            }
            personal2arrayList.append(dict)
        }
    }
    func noOfCellCalculation(){
        visibleCell = []
        for object in personal2arrayList{
        let isVisible = object["isVisible"] as! Bool
        if isVisible{
            visibleCell.append(object)
        }
        }
    }
    //MARK: table view delegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return visibleCell.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let dict = visibleCell[indexPath.row]
        let cellIdentifier = dict["cellIdentifier"]as! String
        switch cellIdentifier {
        case kCellIdentifer_twoTypeSelection:
         let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! WeightTypeSelectionTableViewCell
            cell.lbl_cellTitle.text = dict["Title"] as? String
            cell.selectionStyle = .None
            cell.delegate = self
            return cell
        case  kCellIdentifer_weightPrefrences:
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! WeightPrefrenceTableViewCell
            cell.lblCellTitle.text = dict["Title"] as? String
            cell.lblWeightPrefrence.tag = indexPath.row
            if LiveNutriFitApi.sharedInstance.weightPrefredUnit{
            let value =  dict["weightValue"] as! String
            print(value)
             cell.lblWeightPrefrence.text = "\(value) kg"
            }else{
            let value = dict["weightValue"] as! String
            print(value)
            cell.lblWeightPrefrence.text = "\(value) lbs"
            }
            return cell
        case  kCellIdentifer_weightPicker:
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! WeightPickerTableViewCell
            cell.pickerWeight.tag = indexPath.row
            cell.delegate = self
            cell.selectionStyle = .None
            return cell
        case kCellIdentifer_twoTypeHeightSelection:
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! HeightTypeSelectionTableViewCell
            cell.lblcellTitle.text = dict["Title"] as? String
            cell.selectionStyle = UITableViewCellSelectionStyle.None
          //  cell.userInteractionEnabled = false
            cell.delegate = self
            return cell
        case kCellIdentifer_heightPrefrences:
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! WeightPrefrenceTableViewCell
            cell.lblCellTitle.text = dict["Title"] as? String
            cell.lblWeightPrefrence.tag = indexPath.row
            if LiveNutriFitApi.sharedInstance.heightPrefredUnit{
                let value =  dict["heightValue"] as! String
                print(value)
                cell.lblWeightPrefrence.text = "\(value) inch"
            }else{
                let value = dict["heightValue"] as! String
                print(value)
                cell.lblWeightPrefrence.text = "\(value) cms"
            }
            return cell
        case  kCellIdentifer_heightPicker:
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! heightPickerTableViewCell
            cell.pickerHeight.tag = dict["Tag"] as! Int
            cell.delegate = self
            cell.selectionStyle = .None
            return cell
        default:
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! sliderTableViewCell
            cell.lblCellTitle.text = dict["Title"] as? String
            if dict["Title"] as? String == personal2Array[8]{
            cell.sliderHeightSlider.value = Float(LiveNutriFitApi.sharedInstance.waistSize)
            cell.sliderHeightSlider.tag = dict["Tag"] as! Int
            cell.lblSliderValue.text = String(LiveNutriFitApi.sharedInstance.waistSize)
            }else{
            cell.sliderHeightSlider.value = Float(LiveNutriFitApi.sharedInstance.hipSize)
            cell.sliderHeightSlider.tag = dict["Tag"] as! Int
            cell.lblSliderValue.text = String(LiveNutriFitApi.sharedInstance.hipSize)
            }
            cell.delegate = self
            cell.selectionStyle = .None
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let dict = visibleCell[indexPath.row]
        let cellIdentifier = dict["cellIdentifier"]as! String
        switch cellIdentifier {
        case kCellIdentifer_weightPicker:
            return 150
        case kCellIdentifer_heightPicker:
            return 150
        default:
            return 60
        }
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       let dict = visibleCell[indexPath.row]
        var index:Int!
        if dict["isExpandable"]as! Bool{
            for (indexNumber,object) in personal2arrayList.enumerate(){
                if dict["Title"] as! String == object["Title"] as! String{
                  index = indexNumber
                }
            }
         var realValue = personal2arrayList[index + 1] as [String:AnyObject]
            if realValue["isVisible"] as! Bool{
                realValue["isVisible"] = false
                personal2arrayList.removeAtIndex(index + 1)
                personal2arrayList.insert(realValue, atIndex: index + 1)
            }else{
            realValue["isVisible"] = true
            personal2arrayList.removeAtIndex(index + 1)
            personal2arrayList.insert(realValue, atIndex: index + 1)
            }
        }
        noOfCellCalculation()
        tbleviewPersonal2.reloadData()
    }
// cell delegate method
    func WeightvalueChanged() {
        contentArrayForExpendedCell()
        noOfCellCalculation()
        tbleviewPersonal2.reloadData()
    }
    func heightPrefredValueChanged(){
        NSNotificationCenter.defaultCenter().postNotificationName("PickerRelaod", object: nil)
         contentArrayForExpendedCell()
         noOfCellCalculation()
         tbleviewPersonal2.reloadData()
    }
    func weightSelectedreloadCell(index:Int){
     //   let indexPath:NSIndexPath =  NSIndexPath(forRow: index - 1 , inSection: 0)
        contentArrayForExpendedCell()
        noOfCellCalculation()
        tbleviewPersonal2.reloadData()
        //reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Top)
    }
    func heightSelectedreloadCell(index:Int){
        contentArrayForExpendedCell()
        noOfCellCalculation()
        tbleviewPersonal2.reloadData()
    }
    func sliderDidChangeValue(newSliderValue: String,typeOfSender sender:AnyObject){
        if sender.tag == 8{
            LiveNutriFitApi.sharedInstance.waistSize = Int(newSliderValue)!
            tbleviewPersonal2.reloadData()
            
        }else{
            LiveNutriFitApi.sharedInstance.hipSize = Int(newSliderValue)!
            tbleviewPersonal2.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
}
