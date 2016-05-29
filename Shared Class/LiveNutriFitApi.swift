//
//  LiveNutriFitApi.swift
//  LIveNutriFit
//
//  Created by pragya on 27/03/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit
private let sharedLiveNutriFitApi = LiveNutriFitApi()
class LiveNutriFitApi: NSObject {
    //MARK:- Shared Instance
    class var sharedInstance: LiveNutriFitApi {
        return sharedLiveNutriFitApi
    }
   
    private var loginDetail: LoginInfo!
    private var passwordValue:String!
    private var emailId:String!
    private var otp:Int!
    private var phoneNoValue:String!
    private var nameEnteredByuser:String!
    private var powerOfSevenData:[powerOfSeven]!
    var diseaseArray:[mediacalDetails]!
    // p[ower of seven data 
    var power7Content: [powerOfSeven]{
        get{
            return powerOfSevenData
        }
        set(newValue){
            powerOfSevenData = newValue as [powerOfSeven]
        }
    }
    
    // calculated property
    var loginData: LoginInfo{
        get{
            return loginDetail
        }
        set(newValue){
            loginDetail = newValue as LoginInfo
        }
    }
    var password: NSString{
        get{
            if passwordValue == nil{
                passwordValue = nil
            }
            return passwordValue
        }
        set(newValue){
            passwordValue = newValue as String
        }
    }
    var mailId: NSString{
        get{
            if emailId == nil{
                emailId = nil
            }
            return emailId
        }
        set(newValue){
            emailId = newValue as String
        }
    }
    var oneTimePassword: Int{
        get{
            if otp == nil{
            otp = nil
            }
            return otp
        }
        set(newValue){
            otp = newValue as Int
        }

    }
    var phoneNo: String{
        get{
            if phoneNoValue == nil{
                phoneNoValue = nil
            }
            return phoneNoValue
        }
        set(newValue){
            phoneNoValue = newValue as String
        }
    }
    var nameByuser: NSString{
        get{
            if nameEnteredByuser == nil{
                nameEnteredByuser = nil
            }
            return nameEnteredByuser
        }
        set(newValue){
            nameEnteredByuser = newValue as String
        }
    }
    // personal details entered by user
    private var birthDate:String!
    private var gender:String!
    private var weightUnit:String!
    private var currentWeightValue:Double!
    private var targerWeightValue:Double!
    private var heightUnit:String!
    //
    private var heightcmsValue:Int!  // set
    private var heightFtValue:Int!
    private var heightInchValue:Int!
    private var waistSizeValue:Int!
    private var hipSizeValue:Int!
    private var noOFMonths:Int!
    private var weightToLossValue:Double!
    var weightToLoss:Double{
        get{
            if weightToLossValue == nil{
                weightToLossValue = 0
            }
            return weightToLossValue
        }
        set(newValue){
            weightToLossValue = newValue
        }
    }
    var hipSize:Int{
        get{
            if hipSizeValue == nil{
                hipSizeValue = 0
            }
            return hipSizeValue
        }
        set(newValue){
            hipSizeValue = newValue
        }
    }
    var waistSize:Int{
        get{
            if waistSizeValue == nil{
                waistSizeValue = 0
            }
            return waistSizeValue
        }
        set(newValue){
            waistSizeValue = newValue
        }
    }
    var heightcms:Int {
        get{
            if heightcmsValue == nil{
                heightcmsValue = 0
            }
            return heightcmsValue
        }
        set(newValue){
            heightcmsValue = newValue
        }
    }
    var noOFMonth:Int {
        get{
            if noOFMonths == nil{
                noOFMonths = 0
            }
            return noOFMonths
        }
        set(newValue){
          noOFMonths = newValue
        }
    }
    var height:Double {
        get{
            if heightPrefredUnit{
                if heightcms != 0{
                let feet:Double = Double(heightcms)/30.48
               return feet
                }else{
                    let string:String = "\(heightFt).\(heightInch)"
                    return Double(string)!

                }
            }else{
                if heightFt != 0 || heightInch != 0 {
                let string:String = "\(heightFt).\(heightInch)"
                let cm:Double = Double(string)!*30.48
                return cm
                }else{
                    return Double(heightcms)
                    }
            
            }
        }
    }
    var heightFt:Int{
        get{
            if heightFtValue == nil{
                heightFtValue = 0
            }
            return heightFtValue
        }
        set(newValue){
            heightFtValue = newValue
        }
    }
    var heightInch:Int{
        get{
            if heightInchValue == nil{
                heightInchValue = 0
            }
            return heightInchValue
        }
        set(newValue){
            heightInchValue = newValue
        }
    }
    
    var genderType: Bool{
        get{
            if gender == nil{
                gender = "M"
            }
            if gender == "M"{
                return true
            }else{
                return false
            }
        }
        set(newValue){
            if newValue{
                gender = "M"
            }else{
            gender = "F"
            }
        }
    }
    var weightPrefredUnit: Bool{
        get{
            if weightUnit == nil{
                weightUnit = "kg"
            }
            if weightUnit == "kg"{
                return true
            }else{
                return false
            }
        }
        set(newValue){
            if newValue{
                weightUnit = "kg"
            }else{
                weightUnit = "lbs"
            }
        }
    }
    var heightPrefredUnit: Bool{
        get{
            if heightUnit == nil{
                heightUnit = "Inch"
            }
            if heightUnit == "Inch"{
                return true
            }else{
                return false
            }
        }
        set(newValue){
            if newValue{
                heightUnit = "Inch"
            }else{
                heightUnit = "cm"
            }
        }
    }

    var dateOfBirth: NSString{
        get{
            if birthDate == nil{
                birthDate = ""
            }
            return birthDate
        }
        set(newValue){
            birthDate = newValue as String
        }
    }
    var currentWeight: Double{
        get{
            if currentWeightValue == nil{
                currentWeightValue = 0
            }
            return currentWeightValue
        }
        set(newValue){
            currentWeightValue = newValue as Double
        }
        
    }
    var targerWeight: Double{
        get{
            if targerWeightValue == nil{
                targerWeightValue = 0
            }
            return targerWeightValue
        }
        set(newValue){
            targerWeightValue = newValue as Double
        }
        
    }
    // life Style detail by user
    private var alcoholTaken:Bool!
    private var smokingValue:Bool!
    private var chewingTabaccoValue:Bool!
    private var noOfDrinksInDay:Int!
    private var noOfCigaretteInDay:Int!
    private var noOfPackInDay:Int!
    
    var alcohol: Bool{
        get{
            if alcoholTaken == nil{
                alcoholTaken = false
            }
            return alcoholTaken
        }
        set(newValue){
            alcoholTaken = newValue as Bool
        }
    }
    var smoking: Bool{
        get{
            if smokingValue == nil{
                smokingValue = false
            }
            return smokingValue
        }
        set(newValue){
            smokingValue = newValue as Bool
        }
    }
    var chewingTabacco: Bool{
        get{
            if chewingTabaccoValue == nil{
                chewingTabaccoValue = false
            }
            return chewingTabaccoValue
        }
        set(newValue){
            chewingTabaccoValue = newValue as Bool
        }
    }
    var noOfDrinks: Int{
        get{
            if noOfDrinksInDay == nil{
                noOfDrinksInDay = 0
            }
            return noOfDrinksInDay
        }
        set(newValue){
            noOfDrinksInDay = newValue as Int
        }
    }
    var noOfCigarette: Int{
        get{
            if noOfCigaretteInDay == nil{
                noOfCigaretteInDay = 0
            }
            return noOfCigaretteInDay
        }
        set(newValue){
            noOfCigaretteInDay = newValue as Int
        }
    }

    var noOfPack: Int{
        get{
            if noOfPackInDay == nil{
                noOfPackInDay = 0
            }
            return noOfPackInDay
        }
        set(newValue){
            noOfPackInDay = newValue as Int
        }
    }
// medical
    private var ImgDocument:UIImage!
    
    var ImageDocument: UIImage{
        get{
            if ImgDocument == nil{
                ImgDocument = nil
            }
            return ImgDocument
        }
        set(newValue){
            ImgDocument = newValue as UIImage
        }
    }



}
