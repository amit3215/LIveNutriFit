//
//  Utiity.h
//  TrackApp
//
//  Created by Amit kumar on 17/11/15.
//  Copyright © 2015 chetu-mac-mini-20. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//#import "AReachability.h"
//#import "SVProgressHUD.h"
//#import "SSKeychain.h"


@interface Utiity : NSObject
//@property (weak) id<UITextViewDelegate> delegate;

 


+ (NSString *)getUrl:(NSString*)methodName;

+(BOOL)isValidEmail:(NSString *)checkString;

+ (UIColor *)colorFromHexString:(NSString *)hexString;
 
+(void)setNavigation:(UIViewController*)controller backButtonEnable:(BOOL)enable;
NSString *ObjectOrNull(id object);
+(UIView*)setNavigationTitleViewWithTitle:(NSString*)titile  andSubtitle:(NSString*)subtitle;
@end

@interface NSDictionary (DATEFORKEY)
- (NSDate *) dateForKey:(NSString *) key;
- (NSString *)JSONString;

@end

@interface NSDictionary (SKConvertDictionary)
- (NSDictionary *) dictionaryByReplacingNullsWithStrings;
@end


@interface UIBarButtonItem (TRBarButton)
+ (UIBarButtonItem*)backArrowButtonWithTarget:(id)target action:(SEL)action;

@end
