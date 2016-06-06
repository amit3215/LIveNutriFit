//
//  ParserApi.swift
//  LIveNutriFit
//
//  Created by pragya on 27/03/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit
private let sharedParserApi = ParserApi()
class ParserApi: NSObject {
    class var sharedInstance: ParserApi {
        return sharedParserApi
    }
    
    class func parsonPatientLoginResponce(dataArray: [[String:AnyObject]])->(LoginInfo){
        let object: LoginInfo = LoginInfo()
        for item in dataArray{
            if let patientId = item ["PatientId"]as? Int{
                object.patientId = patientId
            }
            if let dieticianId   = item["DieticianId"] as? Int{
                object.dieticianId = dieticianId
            }
            if let patientName = item["PatientName"] as? String{
                object.patientName = patientName
            }
            if let emailId = item["EmailId"] as? String{
                object.emailId = emailId
            }
            if let dob = item["DOB"] as? String{
                object.dob = dob
            }
            if let gender   = item["Gender"] as? String{
                object.gender = gender
            }
            if let mobile   = item["Mobile"] as? String{
                object.mobile = mobile
            }
            if let address   = item["Address"] as? String{
                object.address = address
            }
            if let landmark   = item["Landmark"] as? String{
                object.landmark = landmark
            }
            if let countryId   = item["CountryId"] as? Int{
                object.countryId = countryId
            }
            if let stateId   = item["StateId"] as? Int{
                object.stateId = stateId
            }
            if let city   = item["City"] as? String{
                object.city = city
            }
            if let pincode   = item["Pincode"] as? String{
                object.pincode = pincode
            }
            if let profileImage   = item["ProfileImage"] as? String{
                object.profileImage = profileImage
            }
            if let targetWeight   = item["TargetWeight"] as? Float{
                object.targetWeight = targetWeight
            }
            if let targetWeightUnit   = item["TargetWeightUnit"] as? String{
                object.targetWeightUnit = targetWeightUnit
            }
            if let targetTime = item["TargetTime"] as? Float{
                object.targetTime = targetTime
            }
            if let isActive = item ["IsActive"]as? Int{
                if isActive == 0 {
                   object.isActive = false
                } else {
                   object.isActive = true
                }
            }
            if let createdOn   = item["CreatedOn"] as? String{
                object.createdOn = createdOn
            }
            if let leadConverted   = item["LeadConverted"] as? Int{
                object.leadConverted = leadConverted
            }
            if let referralCode   = item["ReferralCode"] as? String{
                object.referralCode = referralCode
            }
            if let password   = item["Password"] as? String{
                object.password = password
            }
            if let deviceId   = item["DeviceId"] as? String{
                object.deviceId = deviceId
            }
            if let heightMeasureUnit   = item["HeightMeasureUnit"] as? String{
                object.heightMeasureUnit = heightMeasureUnit
            }
            if let weighttMeasureUnit   = item["WeighttMeasureUnit"] as? String{
                object.weighttMeasureUnit = weighttMeasureUnit
            }
            if let weightLossJourney   = item["WeightLossJourney"] as? String{
                object.weightLossJourney = weightLossJourney
            }
            if let isVerified   = item["IsVerified"] as? Int{
                object.isVerified = isVerified
            }
            if let isLifeStyleFilled   = item["IsLifeStyleFilled"] as? Int{
                object.isLifeStyleFilled = isLifeStyleFilled
            }
            if let isMedicalHistoryFilled   = item["IsMedicalHistoryFilled"] as? Int{
                object.isMedicalHistoryFilled = isMedicalHistoryFilled
            }
            if let packageId   = item["PackageId"] as? Int{
                object.packageId = packageId
            }
            if let totalPoint   = item["TotalPoint"] as? Int{
                object.totalPoint = totalPoint
            }
            
            
        }
        return object
    }
 
    // coachdetaiul
    class func parsingCoachDetailData(dataArray:[[String:AnyObject]])->([CoachDetail]){
        var objectArray:[CoachDetail] = [CoachDetail]()
        for item in dataArray{
            let object: CoachDetail = CoachDetail()
            if let dieticianId = item ["DieticianId"]as? Int{
                object.dieticianId = dieticianId
            }
            if let emailId   = item["EmailId"] as? String{
                object.emailId = emailId
            }
            if let address = item["Address"] as? String{
                object.address = address
            }
            if let dieticianName = item["DieticianName"] as? String{
                object.dieticianName = dieticianName
            }
            if let mobile = item["Mobile"] as? String{
                object.mobile = mobile
            }
            if let password   = item["Password"] as? String{
                object.password = password
            }
            if let profileSummary   = item["ProfileSummary"] as? String{
                object.profileSummary = profileSummary
            }
            if let isPremium   = item["IsPremium"] as? Int{
                object.isPremium = isPremium
            }
            if let refStateId   = item["RefStateId"] as? Int{
                object.refStateId = refStateId
            }
            if let flagOnLeave   = item["FlagOnLeave"] as? Int{
                object.flagOnLeave = flagOnLeave
            }
            if let isMentor   = item["IsMentor"] as? String{
                object.isMentor = isMentor
            }
            if let dieticianProfileImage   = item["DieticianImage"] as? String{
                object.dieticianProfileImage = dieticianProfileImage
            }
            if let totalMemberCanAssign   = item["TotalMemberCanAssign"] as? Int{
                object.totalMemberCanAssign = totalMemberCanAssign
            }
            if let hobbies   = item["Hobbies"] as? String{
                object.hobbies = hobbies
            }
            if let StartDate   = item["StartDate"] as? String{
                object.startDate = StartDate
            }
            if let isMaped = item["IsMaped"] as? Int{
                object.isMaped = isMaped
            }
            if let isActive = item ["IsActive"]as? Int{
                if isActive == 0 {
                    object.isActive = false
                } else {
                    object.isActive = true
                }
            }
            if let isInHouseCoach   = item["IsInHouseCoach"] as? Int{
                object.isInHouseCoach = isInHouseCoach
            }
            if let mapedPatientId   = item["MapedPatientId"] as? Int{
                object.mapedPatientId = mapedPatientId
            }
            if let dieticianId   = item["DieticianId"] as? Int{
                object.dieticianId = dieticianId
            }
            if let referralCode   = item["ReferralCode"] as? String{
                object.referralCode = referralCode
            }
            if let packageAmount   = item["PackageAmount"] as? Int{
                object.packageAmount = packageAmount
            }
            if let qualification   = item["Qualification"] as? String{
                object.qualification = qualification
            }
            if let slotShift   = item["SlotShift"] as? String{
                object.slotShift = slotShift
            }
            
           objectArray.append(object)
        }
        return objectArray
    }
    class func parsingRemiderData(dataArray:[[String:AnyObject]])->(RemiderData){
        let reminderObject:RemiderData = RemiderData()
        print(dataArray)
        var data = dataArray[0]
        if let stageName  = data["StageName"] as? String{
            reminderObject.StageName = stageName
        }
        if let interval  = data["Interval"] as? String{
            reminderObject.interval = (interval as NSString).integerValue
        }else{
            reminderObject.interval = 1
        }
        if let startTime  = data["StartTime"] as? String{
            reminderObject.StartTime = startTime
        }
        if let endTime  = data["EndTime"] as? String{
            reminderObject.EndTime = endTime
        }
        if let frequency  = data["Frequency"] as? Int{
            reminderObject.frequency = frequency
        }
        if let reminderId  = data["ReminderId"] as? Int{
            reminderObject.ReminderId = reminderId
        }
        if let reminderOffTime  = data["ReminderOffTime"] as? String{
            reminderObject.ReminderOffTime = reminderOffTime
        }
        if let module  = data["Module"] as? String{
            reminderObject.Module = module
        }
        if let isActive  = data["IsActive"] as? Int{
            reminderObject.IsActive = isActive
        }
        if let patientId  = data["PatientId"] as? Int{
            reminderObject.PatientId = patientId
        }
        if let stageId  = data["StageId"] as? Int{
            reminderObject.StageId = stageId
        }
        if let timeString  = data["TimeString"] as? String{
            let fullNameArr = timeString.characters.split{$0 == "~"}.map(String.init)
             reminderObject.timeList = fullNameArr
        }
        return reminderObject
    }
    class func parsingPowerOfSevenData(dataArray:[NSDictionary])->([powerOfSeven]){
        var powerOf7 = [powerOfSeven]()
        for data in dataArray{
            let object = powerOfSeven()
            if let Info  = data["Info"] as? String{
                object.info = Info
            }
            if let IsActive  = data["IsActive"] as? Int{
                object.isActive = IsActive
            }
            if let IsReminder  = data["IsReminder"] as? Bool{
                object.isReminder = IsReminder
            }
            if let Point  = data["Point"] as? Int{
                object.Point = Point
            }
            if let StageId  = data["StageId"] as? Int{
                object.stageId = StageId
            }
            if let Threshold  = data["Threshold"] as? Int{
                object.threshold = Threshold
            }
            if let TotalClick  = data["TotalClick"] as? Int{
                object.totalClick = TotalClick
            }
            if let StageName  = data["StageName"] as? String{
                object.stageName = StageName
            }
            if let moduleArray = data["PowerOfServenItemList"] as? [[String:AnyObject]]{
                var subObjectArray = [power7SubObject]()
                for subData in moduleArray{
                    let subObject = power7SubObject()
                    if let Click  = subData["Click"] as? Int{
                        subObject.click = Click
                    }
                    if let ImgName  = subData["ImgName"] as? String{
                        subObject.imgName = ImgName
                    }
                    if let IsActive  = subData["IsActive"] as? Int{
                        subObject.isActive = IsActive
                    }
                    if let ItemDescription  = subData["ItemDescription"] as? String{
                        subObject.itemDescription = ItemDescription
                    }
                    if let ItemName  = subData["ItemName"] as? String{
                        subObject.itemName = ItemName
                    }
                    if let PowerItemId  = subData["PowerItemId"] as? Int{
                        subObject.powerItemId = PowerItemId
                    }
                    if let SortOrder  = subData["SortOrder"] as? Int{
                        subObject.sortOrder = SortOrder
                    }
                  subObjectArray.append(subObject)
                }
                object.subobject = subObjectArray
            }
            powerOf7.append(object)
        }
        return powerOf7
    }
    class func parsingOfferArrayList(dataArray:NSArray)->([promoOffer]){
        let currentDateTime = NSDate()
        print(dataArray)
        var offerObjectArray:[promoOffer] = [promoOffer]()
        for object in dataArray{
            let promo:promoOffer = promoOffer()
            if let ValidUpto  = object["ValidUpto"] as? String{
                let formatter = NSDateFormatter()
                formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
                let localDate = formatter.dateFromString(ValidUpto)
                if (localDate!.isGreaterThanDate(currentDateTime)){
                    let formatter1 = NSDateFormatter()
                    formatter1.dateStyle = NSDateFormatterStyle.MediumStyle
                    //formatter.timeStyle = .MediumStyle
                    let dateString = formatter1.stringFromDate(localDate!)
                    promo.ValidUpto = dateString
                    
                    if let PackageId  = object["PackageId"] as? Int{
                        promo.PackageId = PackageId
                    }
                    if let PromoCode  = object["PromoCode"] as? String{
                        promo.PromoCode = PromoCode
                    }
                    if let PromoDescription  = object["PromoDescription"] as? String{
                        promo.PromoDescription = PromoDescription
                    }
                    if let PromoDiscountAmount  = object["PromoDiscountAmount"] as? Int{
                        promo.PromoDiscountAmount = PromoDiscountAmount
                    }
                    if let PromoDiscountId  = object["PromoDiscountId"] as? Int{
                        promo.PromoDiscountId = PromoDiscountId
                    }
                    if let PromoName  = object["PromoName"] as? String{
                        promo.PromoName = PromoName
                    }
                    offerObjectArray.append(promo)
                }
            }
        }
        return offerObjectArray
    }

}
