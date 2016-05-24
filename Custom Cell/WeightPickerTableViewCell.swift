//
//  WeightPickerTableViewCell.swift
//  LIveNutriFit
//
//  Created by pragya on 16/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//
import UIKit
protocol weightSelected {
    func weightSelectedreloadCell(index:Int)
}
class WeightPickerTableViewCell: UITableViewCell,UIPickerViewDataSource,UIPickerViewDelegate {
    
    @IBOutlet weak var pickerWeight: UIPickerView!
    
   // var colors = ["Red","Yellow","Green","Blue"]
    var weight:[Int] = [Int]()
    var delegate:weightSelected!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        createPickerArray()
        pickerWeight.dataSource = self
        pickerWeight.delegate = self
        
    }
    func createPickerArray() {
        for value in 40...200{
           weight.append(value)
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
        return weight.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(weight[row])
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerWeight.tag == 2{
            LiveNutriFitApi.sharedInstance.currentWeight = Double(weight[row])
            print(LiveNutriFitApi.sharedInstance.currentWeight)
            delegate.weightSelectedreloadCell(pickerWeight.tag)
            
        }else{
            LiveNutriFitApi.sharedInstance.targerWeight = Double(weight[row])
            print(LiveNutriFitApi.sharedInstance.targerWeight)
            delegate.weightSelectedreloadCell(pickerWeight.tag)

        }
        // print("\(weight[row])")
    }
}
