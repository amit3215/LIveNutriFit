//
//  LifeStyleViewController.swift
//  LIveNutriFit
//
//  Created by pragya on 10/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class LifeStyleViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var tableView_LifeStyle: UITableView!
    // content array
    var arrayOfArray:[[String:[String]]] = [[String:[String]]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        createContentList()

        // Do any additional setup after loading the view.
    }
    // content creater
    func createContentList(){
        for (index,object) in kLifeStyleArray.enumerate(){
            switch index {
            case 0:
                let dict:[String:[String]] = [object:kMealPreference]
                arrayOfArray.append(dict)
            case 1:
                let dict:[String:[String]] = [object:kCuisinePreference]
                arrayOfArray.append(dict)
            case 2:
                let dict:[String:[String]] = [object:kFoodAllergies]
                arrayOfArray.append(dict)
            default:
                let dict:[String:[String]] = [object:kPhysicalActivity]
                arrayOfArray.append(dict)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // tableview delegate method
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let dict = arrayOfArray[indexPath.row]
        if indexPath.row == 0{
            let cellIdentifier = "lifeStyle5Button"
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! lifeStyleFiveButtonTableViewCell
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
        }else if indexPath.row == 1 || indexPath.row == 2{
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
        }else{
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
        }
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 3{
            return 90
        }else{
        return 130
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
