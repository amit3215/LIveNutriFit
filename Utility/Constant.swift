//
//  Constant.swift
//  LIveNutriFit
//
//  Created by Chetu-macmini-26 on 13/02/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import Foundation
import UIKit
let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
// web service 
let baseUrl = "http://52.24.100.222/LiveNutriFitWebService/patient.asmx/";
// image download url
let power7ImgBaseUrl = "http://www.livenutrifit.com/LiveNutriFitWebService/uploads/powerof7images/";

// diffrent services extensions
let kPatientLogin = "Patient_LoginV2"; // PatientLogin
let KPatientLoginOTP = "Patient_Login_OTP";//Patient Login with OTP
let KPatient_RegisterV3 = "Patient_RegisterV3";
let kDieticianDetailList = "Dietician_List";
let kGetReminderList = "GetReminderList";// get reminder list
let kManageRemindersV2 = "ManageRemindersV2";// ManageRemindersV2
let kGetPowerOfSeven = "GetPowerOfSevenPointList";
// uibutton title
// screen Title
let kTitle_Register = "REGISTER";
let kTitle_LogIn = "LOG IN";
// loginInFirstView
let kHavePassword = "HAVE PASSWORD";
let kGenerateOtp = "GENERAT OTP";
let kConfirmationCode = "LET’S GO";
// registration screen
let kCreateYourAccount = "CREATE YOUR ACCOUNT";
// power of seven
let editReminder = "Reminder\nEdit";
let onlyReminder = "Reminder";

// label constant text
// login Screen Page
let kLoginText = "LOG IN\nExisting Member";
let kRegisterText = "REGISTER\nNew Member";
let kConstantText = "\"WE KNOW THIS JOURNEY IS \n LONG BUT IT GETS. ENJOYABLE \n WITH A FRIENDLY \n PERSONAL HEALTH COACH\"";
let kDoctorName = "DR. ANJALI HOODA SANGWAN, MD";
let kTermAndCondition = "I agree with Terms & Conditions";
let kConfirmationCodeText = "ENTER THE CONFIRMATION CODE\nWE TEXTED TO YOUR MOBILE NO.";
let kHavePasswordText = "ENTER YOUR PASSWORD\nTO LOGIN YOUR ACCOUNT";
let kMedicalDetailsText = "YOUR\n MEDICAL HISTORY WILL HELP YOUR \nPERSONAL HEALTH COACH\nTO CUSTOMIZE  YOUR\nNUTRITION AND FITNESS \nPLAN";
let kTwoStepAwayText = "YOU ARE\nTWO STEPS AWAY FROM\nFINDING YOUR \nPERSONAL HEALTH COATCH";

// textfield placeholder
let kPlaceholderMobileNoMailId = "MOBILE NO./EMAIL ID";
let kPlaceholderMobileNo = "MOBILE NO.";
let kPlaceholderFullName = "FULL NAME";
let kPlaceholderEmailId = "EMAIL ID";
let kPlaceholderConfirmationCode = "Confirmation Code";
let kPlaceholderPassword = "Password";
let kPlaceholderDateOfBirth = "Date of Birth";
let kPlaceholder = "";
// color code
let kColor_navigationBar = UIColor(netHex:0x00B2D8);
let kColor_CreateYourAcount = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1);
let kColor_ButtonSelectedColor = UIColor(red: 116/255, green: 187/255, blue: 18/255, alpha: 1);
let kColor_ButtonBorderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1);
let kColorGreen = UIColor(red: 127/255, green: 191/255, blue: 0/255, alpha: 1);

// segue identifier
let kSegue_RegistrationView = "RegisterView";
let kSegue_LoginFirst = "LoginFirst";
let kSegue_LoginSecond = "GenerateOtp";
let kSegue_HavePassword = "havePassword";
let kSegue_DashBord = "DashBord";
let kSegue_PersonalDetail = "personalDetail";
let kSegue_PersonalDetail2 = "personal2";
let kSegue_AfterCreatingProfile = "afterCreatingProfile";
let kSegue_CoachDiscription = "coachDiscription";
let kSegue_TwoStepAway = "TwoStepAway";
let kSegue_ReminderCustomization = "ReminderCustomization";
let kSegue_ReminderSetting = "ReminderSetting";
// regex
let kREGEX_EMAIL = "[A-Z0-9a-z._%+-]{3,}+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
// validation alert message
let kValidateEmailMessage = "Email Id Should Be like \"example@gmail.com\"";
// json keys for request
let kJsonKey_EmailId = "EmailId";
let kJsonKey_Email = "Email";
let kJsonKey_Password = "Password";
let kJsonKey_DeviceId = "DeviceId";
let kJsonKey_DeviceType = "DeviceType";
let kJsonKey_AppVersion = "AppVersion";
let kJsonKey_DeviceInfo = "DeviceInfo";
let kJsonKey_PatientName = "PatientName";
let kJsonKey_MobileNo = "MobileNo";
let kJsonKey_PatientId = "PatientId";
let kJsonKey_Module = "Module";
let kJsonKey_StageId = "StageId";
// reminder jsonkey
let  kJsonKey_ReminderId = "ReminderId"
let  kJsonKey_Frequency = "Frequency"
let  kJsonKey_Interval = "Interval"
let  kJsonKey_StartTime = "StartTime"
let  kJsonKey_EndTime = "EndTime"
let  kJsonKey_TimeString = "TimeString"

// default key value for request
let kJsonKeyValue_Module = "PowerOf7";
// dietion list
let kJsonKey_IsActive = "IsActive";
// array list
// personal
let personalArray = ["Gender","Birthday","Preferred Unit","CurrentWeight","Preferred Unit","Height","Waist (optional)","Hip (optionl)","Weight to lose","Target month","Weight loss journey"];
// personal 2 
let personal2Array = ["Preferred Unit","CurrentWeight","weight Selection","Target Weight","weight Selection","Preferred Unit","Height","height selection","Waist (optional)","Hip (optionl)"];
let personal3Array = ["Weight to Loss","Target Months","month Picker","Weight Loss Journey","discription"];
// medical
let karrayDisease = ["Abnormal Cholesterol","Diabetes","High Blood Pressure","Cardiovascular Disease","High Uric Acid","Abnormal Thyroid","Stroke","Any Major Surgeries","Any Major Medical Issues"];
// lyfe style
let kLifeStyleArray = ["Meal Preference (Select One)","Cuisine Preference(Select Muliple)","Food Allergies (Selected multiple)","Physical Activity Level"];
let kMealPreference = ["Veg","Veg+Egg","Non Veg","Vegan","Jain"];
let kCuisinePreference = ["North Indian","South Indian","Italian","Chinese","Meditarian"];
let kFoodAllergies = ["Nuts","Gluten","Eggs","Sea food","Dairy"];
let kPhysicalActivity = ["Beginner","Intermediate","Advance"];
let kCellDescription = "Selected Weight Loss journey\nWould Enable Your to Achieve Your\nGoal By ";
// lyfe style 2
let kLifeStyle2Array = ["Cheat Meal Day","Cheat meal Time","Cardio Preference (Select multiple)","Daily Sleep Hours"];
let kCheatMealDay = ["S","M","T","W","T","F","S"];
let kCheatMealTime = ["Breakfast","Lunch","Dinner"];
let kCardioPreference = ["Walking","Jogging","Running","Cycling","Swimming"];
let kSleepHours = ["-5 Hr","6 Hr","7 Hr","8 Hr","9 + Hr"];
// lifestyle 3
let klifeStyle3Array = ["Do You Want to Quit","Alcohol","No of drinks per day","No of drink","Smoking","No of cigarette per day","No of cigarette","Chewing Tobacco","No of pack per day","No of pack"];
let kMedical2Array = ["Joint Troubles (Multiple choice)","Family history of weight \nproblem","Attach Documents(Optional)"];
let kMedicalSubArray = ["Neck","Shoulder","Elbow","Wrist","Lower Back","Hip","Knee","Ankle"]
let dashBoard = ["","","My Coach","Start Weight","Ideal Weight","Current Weight","Target Weight","Weight to  loss","Weight Loss Journey","Calories Budget","Body Mass Index (BMI)","Basal MetaBolic Rate (BMR)","Waist-Hip Ratio","Health Points"];

// cell identifier
let kCellIdentifer_twoTypeSelection = "twoTypeSelection";
let kCellIdentifer_weightPrefrences = "weightPrefrences";
let kCellIdentifer_weightPicker = "weightPicker";
let kCellIdentifer_twoTypeHeightSelection = "twoTypeSelectionHeight";
let kCellIdentifer_heightPrefrences = "heightPrefrence";
let kCellIdentifer_heightPicker = "heightSelection";
let kCellIdentifer_description = "description";
// personal 3
let kCellIdentifer_weightReduce = "weightReduce";
let kCellIdentifer_targetMonth = "targetMonth";
let kCellIdentifer_weightLossJourney = "weightLossJourney";
let kCellIdentifer_MonthPicker = "MonthPicker";
// life Style 3
let kCellIdentifer_OnlyHeader = "onlyHeader";
let kCellIdentifer_HeaderWithSwitch = "headerWithSwitch";
let kCellIdentifer_DrinkDropDown = "drinkDropDown";
let kCellIdentifer_DrinkPicker = "DrinkPicker";
// medical 2
let kCellIdentifer_EightButton = "EightButton";
let kCellIdentifer_headerWithSwitch = "headerWithSwitch";
let kCellIdentifer_headerWithButton  = "headerWithButton";
// DashBoard View
let kCell_DashBoardBMI = "BMIStatus";
let kCell_DashBoardPower7 = "power7";
let kCellCoachHeader = "sliderHeader";
let kCellCoachSlider = "sliderCell";
let kCellWeightLossDetails = "WeightLossDetails";
let kCellweightLossJourny = "weightLossJourny";
let kCellWeightLossDetailsExt = "WeightLossDetailsExt"
let kStoryboardIdentifier = "coachModel";



