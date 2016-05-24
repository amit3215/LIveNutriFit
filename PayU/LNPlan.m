//
//  LNPlan.m
//  PayUMoney
//
//  Created by Amit kumar on 26/04/16.
//  Copyright © 2016 Amit kumar. All rights reserved.
//

#import "LNPlan.h"
#import "Utiity.h"


@implementation LNPlan

- (id) initWithDictionary:(NSDictionary*)dic {
    
    
    dic = [dic dictionaryByReplacingNullsWithStrings];
    
    if(self = [super init])
    {
        
        
        _PackageId = [dic objectForKey:@"PackageId"];
        _PackageName = [dic objectForKey:@"PackageName"];
        _PackageDescription= [dic objectForKey:@"PackageDescription"];
        
        _PackageDuration = [dic objectForKey:@"PackageDuration"];
        _PackageAmount = [dic objectForKey:@"PackageAmount"];
        _PerDayCost= [dic objectForKey:@"PerDayCost"];
        
        
        
        _PackageDurationType = [dic objectForKey:@"PackageDurationType"];
        _PackageType = [dic objectForKey:@"PackageType"];
        _CoachSelection= [dic objectForKey:@"CoachSelection"];
        
        
        
        _PaidType = [dic objectForKey:@"PaidType"];
        _ColorCode = [dic objectForKey:@"ColorCode"];
        _PackageBalance= [dic objectForKey:@"PackageBalance"];
        
        
        
        
    }
    return self;
}


@end
