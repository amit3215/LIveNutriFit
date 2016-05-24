//
//  ReminderData.swift
//  LIveNutriFit
//
//  Created by pragya on 21/05/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import Foundation
class RemiderData {
   
private  var Frequency:Int!
private  var TimeListArray:[String]!
private  var Interval:Int!
    var EndTime:String!
    var IsActive:Int!
    var Module:String!
    var PatientId:Int!
    var ReminderId:Int!
    var ReminderOffTime:String!
    var StageId:Int!
    var StageName:String!
    var StartTime:String!
    
    var frequency:Int{
    set(newValue){
    Frequency = newValue as Int
    }
    get{
        if Frequency == nil{
            Frequency = 0
        }
        return Frequency
    }
    }
    var interval:Int{
        set(newValue){
            Interval = newValue as Int
        }
        get{
            if Interval == nil{
                Interval = 0
            }
            return Interval
        }
    }
    var timeList:[String]{
        set(newValue){
            TimeListArray = newValue as [String]
        }
        get{
            if TimeListArray == nil{
                TimeListArray = []
            }
            return TimeListArray
        }
    }
    
    init(){
    }
}