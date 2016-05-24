//
//  DrinkPickerTableViewCell.swift
//  LIveNutriFit
//
//  Created by pragya on 24/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit
protocol drinkNo {
    func NumberOfDrinkChanged()
}
class DrinkPickerTableViewCell: UITableViewCell,UIPickerViewDataSource,UIPickerViewDelegate {

    @IBOutlet weak var pickerDrink: UIPickerView!
    var numberOfDrink:[Int] = [Int]()
    var delegate:drinkNo!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        createPickerArray()
        pickerDrink.dataSource = self
        pickerDrink.delegate = self
    }
    func createPickerArray() {
        for value in 1...50{
            numberOfDrink.append(value)
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
        return numberOfDrink.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(numberOfDrink[row])
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerDrink.tag {
        case 3:
            LiveNutriFitApi.sharedInstance.noOfDrinks = numberOfDrink[row]
        case 6:
            LiveNutriFitApi.sharedInstance.noOfCigarette = numberOfDrink[row]
        case 9:
            LiveNutriFitApi.sharedInstance.noOfPack = numberOfDrink[row]
        default:
            print("picker tag wrong")
        }
        delegate.NumberOfDrinkChanged()
        print("numberOfDrink\(numberOfDrink[row])")
    }

}
