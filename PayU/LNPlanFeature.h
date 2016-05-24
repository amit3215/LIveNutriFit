//
//  LNPlanFeature.h
//  PayUMoney
//
//  Created by Amit kumar on 26/04/16.
//  Copyright © 2016 Amit kumar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LNPlanFeature : NSObject
@property (nonatomic, strong) NSString *featureName;
@property (nonatomic, assign) BOOL IsActive;
- (id) initWithDictionary:(NSDictionary*)dic;
@end
