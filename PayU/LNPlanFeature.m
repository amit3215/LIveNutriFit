//
//  LNPlanFeature.m
//  PayUMoney
//
//  Created by Amit kumar on 26/04/16.
//  Copyright © 2016 Amit kumar. All rights reserved.
//

#import "LNPlanFeature.h"
#import "Utiity.h"

@implementation LNPlanFeature


- (id) initWithDictionary:(NSDictionary*)dic {
    
    
    dic = [dic dictionaryByReplacingNullsWithStrings];
    
    if(self = [super init])
    {
        
        
        _featureName = [dic objectForKey:@"FeatureName"];
        _IsActive = [dic objectForKey:@"IsActive"];
        
    }
    return self;
}

@end
