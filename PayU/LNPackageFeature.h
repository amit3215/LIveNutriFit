//
//  LNPackageFeature.h
//  PayUMoney
//
//  Created by Amit kumar on 26/04/16.
//  Copyright © 2016 Amit kumar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LNPackageFeature : NSObject

@property (nonatomic, strong) NSString *planName;
@property (nonatomic, strong) NSString *packagePlanName;
@property (nonatomic, strong) NSString *colourCode ;
@property (nonatomic, strong) NSMutableArray *planFeatureList ;
@property (nonatomic, strong) NSMutableArray *planList ;
- (id) initWithDictionary:(NSDictionary*)dic ;

@end
