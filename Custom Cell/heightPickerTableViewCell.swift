//
//  heightPickerTableViewCell.swift
//  LIveNutriFit
//
//  Created by pragya on 17/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit
protocol heightSelected {
    func heightSelectedreloadCell(index:Int)
}

class heightPickerTableViewCell: UITableViewCell,UIPickerViewDataSource,UIPickerViewDelegate  {
    @IBOutlet weak var pickerHeight: UIPickerView!
  //  var colors = ["Red","Yellow","Green","Blue"]
    var heightInch:[Int] = [Int]()
    var heightfeet:[Int] = [Int]()
    var heightCms:[Int] = [Int]()
    var delegate:heightSelected!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(heightPickerTableViewCell.methodOfReceivedNotification(_:)), name:"PickerRelaod" , object: nil)
        
        createPickerArray()
        pickerHeight.dataSource = self
        pickerHeight.delegate = self
    }
    func createPickerArray() {
        if LiveNutriFitApi.sharedInstance.heightPrefredUnit{
            for value in 0...20{
            heightfeet.append(value)
            if value <= 12{
                 heightInch.append(value)
            }
        }
        }else{
            for value in 0...500{
                heightCms.append(value)
            }
        }
    }
    func methodOfReceivedNotification(notification: NSNotification){
        createPickerArray()
        self.pickerHeight.reloadAllComponents()
        //Take Action on Notification
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        if LiveNutriFitApi.sharedInstance.heightPrefredUnit{
            return 2
        }else{
            return 1
        }
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if LiveNutriFitApi.sharedInstance.heightPrefredUnit{
            switch component {
            case 0:
                return heightfeet.count
            default:
                return heightInch.count
            }
            
        }else{
            return heightCms.count
        }
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if LiveNutriFitApi.sharedInstance.heightPrefredUnit{
            switch component {
            case 0:
                return String(heightfeet[row])
            default:
                return String(heightInch[row])
            }
        }else{
            return String(heightCms[row])
        }
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if LiveNutriFitApi.sharedInstance.heightPrefredUnit{
            switch component {
            case 0:
                LiveNutriFitApi.sharedInstance.heightFt = heightfeet[row]
                print(LiveNutriFitApi.sharedInstance.heightFt)
                LiveNutriFitApi.sharedInstance.heightcms = 0
               delegate.heightSelectedreloadCell(pickerHeight.tag)
            default:
                 LiveNutriFitApi.sharedInstance.heightInch = heightInch[row]
                 LiveNutriFitApi.sharedInstance.heightcms = 0
                 print(LiveNutriFitApi.sharedInstance.heightInch)
                delegate.heightSelectedreloadCell(pickerHeight.tag)
    
            }
        }else{
             LiveNutriFitApi.sharedInstance.heightFt = 0
            LiveNutriFitApi.sharedInstance.heightInch = 0
            LiveNutriFitApi.sharedInstance.heightcms = heightCms[row]
             print(LiveNutriFitApi.sharedInstance.heightcms)
            delegate.heightSelectedreloadCell(pickerHeight.tag)
        }
//        if pickerWeight.tag == 2{
//            LiveNutriFitApi.sharedInstance.currentWeight = weight[row]
//            print(LiveNutriFitApi.sharedInstance.currentWeight)
//            delegate.weightSelectedreloadCell(pickerWeight.tag)
//            
//        }else{
//            LiveNutriFitApi.sharedInstance.targerWeight = weight[row]
//            print(LiveNutriFitApi.sharedInstance.targerWeight)
//            delegate.weightSelectedreloadCell(pickerWeight.tag)
//            
//        }
        // print("\(weight[row])")
    }

}
