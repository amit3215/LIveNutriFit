//
//  LNPlan.h
//  PayUMoney
//
//  Created by Amit kumar on 26/04/16.
//  Copyright © 2016 Amit kumar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LNPlan : NSObject


@property (nonatomic, strong) NSString *PackageId;
@property (nonatomic, strong) NSString *PackageName;
@property (nonatomic, strong) NSString *PackageDescription ;

@property (nonatomic, strong) NSString *PackageDuration;
@property (nonatomic, strong) NSString *PackageAmount;
@property (nonatomic, strong) NSString *PerDayCost ;

@property (nonatomic, strong) NSString *PackageDurationType;
@property (nonatomic, strong) NSString *PackageType;
@property (nonatomic, strong) NSString *CoachSelection ;

@property (nonatomic, strong) NSString *PaidType;
@property (nonatomic, strong) NSString *ColorCode;
@property (nonatomic, strong) NSString *PackageBalance ;

@property (nonatomic, assign) BOOL IsAvailable;
- (id) initWithDictionary:(NSDictionary*)dic;


@end
