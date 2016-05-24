//
//  NumberOfMonthTableViewCell.swift
//  LIveNutriFit
//
//  Created by pragya on 27/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit
protocol NoOfMonthChange {
    func noOfMonthChange()
}

class NumberOfMonthTableViewCell: UITableViewCell,UIPickerViewDataSource,UIPickerViewDelegate {
    
    @IBOutlet weak var pickerNoOfMonths: UIPickerView!
    var numberOfMonths:[Int] = [Int]()
    var  delegate:NoOfMonthChange!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        createPickerArray()
        pickerNoOfMonths.dataSource = self
        pickerNoOfMonths.delegate = self
    }

    func createPickerArray() {
        for value in 1...50{
            numberOfMonths.append(value)
            
        }
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numberOfMonths.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(numberOfMonths[row])
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        LiveNutriFitApi.sharedInstance.noOFMonth = numberOfMonths[row]
         print("numberOfDrink\(numberOfMonths[row])")
        delegate.noOfMonthChange()
       
        
    }

}
