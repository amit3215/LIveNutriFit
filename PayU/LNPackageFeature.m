//
//  LNPackageFeature.m
//  PayUMoney
//
//  Created by Amit kumar on 26/04/16.
//  Copyright © 2016 Amit kumar. All rights reserved.
//

#import "LNPackageFeature.h"
#import "LNPlanFeature.h"
#import "LNPlan.h"
#import "Utiity.h"

@implementation LNPackageFeature

- (id) initWithDictionary:(NSDictionary*)dic {
    
    
    dic = [dic dictionaryByReplacingNullsWithStrings];
    
    _planFeatureList = [[NSMutableArray alloc] init];
    
    _planList = [[NSMutableArray alloc] init];
    
    if(self = [super init])
    {
        
       
        _planName = [dic objectForKey:@"PlanName"];
        _packagePlanName = [dic objectForKey:@"PackagePlanName"];
        _colourCode= [dic objectForKey:@"ColourCode"];
        
        
        NSArray *arr = [dic objectForKey:@"PlanFeatureList"];
        
        for (NSDictionary *dic in arr) {
            
            LNPlanFeature *plan = [[LNPlanFeature alloc] initWithDictionary:dic];
            
            [_planFeatureList addObject:plan];
           
        }
        
        NSArray *arrPlan = [dic objectForKey:@"PlanList"];
        
        for (NSDictionary *dic in arrPlan) {
            
             LNPlan *plan = [[LNPlan alloc] initWithDictionary:dic];
            [_planList addObject:plan];
            
        }
        
      
        
    }
    return self;
}





@end
