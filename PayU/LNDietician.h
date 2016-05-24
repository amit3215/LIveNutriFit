//
//  LNDietician.h
//  PayUMoney
//
//  Created by Amit kumar on 30/04/16.
//  Copyright © 2016 Amit kumar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LNDietician : NSObject


@property (nonatomic, strong) NSString *DieticianId;
@property (nonatomic, strong) NSString *DieticianName;
@property (nonatomic, strong) NSString *DieticianImage ;

@property (nonatomic, strong) NSString *EmailId;
@property (nonatomic, strong) NSString *Mobile;
@property (nonatomic, strong) NSString *Address ;

@property (nonatomic, strong) NSString *Qualification;
@property (nonatomic, strong) NSString *ProfileSummary;
@property (nonatomic, assign) BOOL IsActive ;

@property (nonatomic, strong) NSString *ReferralCode;
@property (nonatomic, strong) NSString *Password;
@property (nonatomic, strong) NSString *Hobbies ;




@property (nonatomic, strong) NSString *MapedPatientId;
@property (nonatomic, strong) NSString *DeviceId;
@property (nonatomic, strong) NSString *DeviceType ;

@property (nonatomic, strong) NSString *FlagOnLeave;
@property (nonatomic, strong) NSString *StartDate;
@property (nonatomic, assign) BOOL EndDate ;

@property (nonatomic, strong) NSString *SlotShift;
@property (nonatomic, strong) NSString *TotalMemberCanAssign;
@property (nonatomic, strong) NSString *RefStateId ;


@property (nonatomic, assign) BOOL IsPremium;
@property (nonatomic, assign) BOOL IsInHouseCoach;
@property (nonatomic, assign) BOOL IsMentor ;

@property (nonatomic, assign) BOOL IsMaped;
@property (nonatomic, strong) NSString *PackageAmount;



@end
