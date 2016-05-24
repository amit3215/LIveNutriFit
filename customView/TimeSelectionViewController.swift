
//
//  TimeSelectionViewController.swift
//  LIveNutriFit
//
//  Created by pragya on 21/05/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit
protocol TimeSelection {
    func returnSelectedTimeFromPicker(selectedTime:SelectedTime)
    func cancelButtonTapped()
}

class TimeSelectionViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    var hours:[String] = [String]()
    var minutes:[String] = [String]()
    var meridiem :[String] = ["am","pm"]
    var delegate:TimeSelection!
    var index:Int!
    // seleted time
    var selectedTime:SelectedTime!
    @IBOutlet weak var selectTime: UIPickerView!
    @IBOutlet var btnSelectedTime: UIButton!
    @IBOutlet var btnCancel: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
       selectedTime = SelectedTime()
       createPickerArray()
        selectTime.dataSource = self
        selectTime.delegate = self
         selectedTime.index = index
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func createPickerArray() {
       
        for value in 1...12{
            hours.append(String(format: "%02d", value))
        }
        for value in 00...59{
            minutes.append(String(format: "%02d", value))
        }
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       
        switch component {
        case 0:
            return hours.count
        case 1:
            return minutes.count
          default:
            return meridiem.count
        }
            
       
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    switch component {
        case 0:
            return String(hours[row])
        case 1:
           return String(minutes[row])
        default:
            return String(meridiem[row])
        }
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
          selectedTime.hour = hours[row]
        case 1:
           selectedTime.minutes = minutes[row]
        default:
        selectedTime.meridiem = meridiem[row]
        }
       
        
  //      delegate.returnSelectedTimeFromPicker(selectedTime)
      }
    // selector method
    @IBAction func selectTimeButtonTapped(sender: AnyObject) {
        delegate.returnSelectedTimeFromPicker(selectedTime)
        print("select")
    }
    @IBAction func cancelButtonTapped(sender: AnyObject) {
        delegate.cancelButtonTapped()
         print("cancel")
    }
}
class SelectedTime{
private  var hourValue:String!
private  var minutesValue:String!
private  var meridiemValue:String!
    var index:Int!
    var hour:String{
        get{
            if hourValue == nil{
                hourValue = "01"
            }
            return hourValue
        }
        set(newValue){
            hourValue = newValue as String
        }
    }
    var minutes:String{
        get{
            if minutesValue == nil{
                minutesValue = "00"
            }
            return minutesValue
        }
        set(newValue){
            minutesValue = newValue as String
        }    }
    var meridiem:String{
        get{
            if meridiemValue == nil{
                meridiemValue = "am"
            }
            return meridiemValue
        }
        set(newValue){
            meridiemValue = newValue as String
        }
    }
    
    init(){
    }
    
}
