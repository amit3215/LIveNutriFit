//
//  Utiity.m
//  TrackApp
//
//  Created by Amit kumar on 17/11/15.
//  Copyright © 2015 chetu-mac-mini-20. All rights reserved.
//

#import "Utiity.h"
//#import "REFrostedViewController.h"
//#import "TRTrackRequestTableViewController.h"
//#import "TRMapViewController.h"
//#import "SDWebImage/UIImageView+WebCache.h"




#define RadiansToDegrees(radians)(radians * 180.0/M_PI)
#define DegreesToRadians(degrees)(degrees * M_PI / 180.0)




@implementation Utiity

+ (NSString *)getUrl:(NSString*)methodName{
    return [@"www.payumoney" stringByAppendingString:methodName];
}

+ (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}
+(void)setNavigation:(UIViewController*)controller backButtonEnable:(BOOL)enable{
    
    
    controller.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"ic_menu_black"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:controller
                                                                             action:@selector(toggleMenu)];
}



+(BOOL)isValidEmail:(NSString *)checkString {
    
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}


+(UIView*)setNavigationTitleViewWithTitle:(NSString*)titile  andSubtitle:(NSString*)subtitle {
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:15];
    titleLabel.text = titile;
    [titleLabel sizeToFit];
    
    UILabel *subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 22, 0, 0)];
    subTitleLabel.backgroundColor = [UIColor clearColor];
    subTitleLabel.textColor = [UIColor blackColor];
    subTitleLabel.font = [UIFont boldSystemFontOfSize:9];
    subTitleLabel.text = subtitle;
    [subTitleLabel sizeToFit];
    
    UIView *twoLineTitleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MAX(subTitleLabel.frame.size.width, titleLabel.frame.size.width), 30)];
    [twoLineTitleView addSubview:titleLabel];
    [twoLineTitleView addSubview:subTitleLabel];
    
    float widthDiff = subTitleLabel.frame.size.width - titleLabel.frame.size.width;
    
    if (widthDiff > 0) {
        CGRect frame = titleLabel.frame;
        frame.origin.x = widthDiff / 2;
        titleLabel.frame = CGRectIntegral(frame);
    }else{
        CGRect frame = subTitleLabel.frame;
        frame.origin.x = abs(widthDiff) / 2;
        subTitleLabel.frame = CGRectIntegral(frame);
    }
    
    
    return twoLineTitleView;

}

@end
#pragma mark
#pragma mark NSDictionary class categeory

@implementation NSDictionary (SKConvertDictionary)
- (NSDictionary *) dictionaryByReplacingNullsWithStrings {
    NSMutableDictionary *replaced = [NSMutableDictionary dictionaryWithDictionary: self];
    const id nul = [NSNull null];
    const NSString *blank = @"";
    
    for (NSString *key in self) {
        const id object = [self objectForKey: key];
        if (object == nul) {
            [replaced setObject: blank forKey: key];
        }
        else if ([object isKindOfClass: [NSDictionary class]]) {
            [replaced setObject: [(NSDictionary *) object dictionaryByReplacingNullsWithStrings] forKey: key];
        }
    }
    return [NSDictionary dictionaryWithDictionary: replaced];
}

@end

@implementation UIBarButtonItem (TRBarButton)
+ (UIBarButtonItem*)backArrowButtonWithTarget:(id)target action:(SEL)action
{
    
    
    UIImage *buttonImage = [UIImage imageNamed:@"menuBtn.png"];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:buttonImage forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 40, 40);
    [button addTarget:target action: action forControlEvents:UIControlEventTouchUpInside];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [view addSubview:button];
    
    UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] initWithCustomView:view];
    
    
    
    return customBarItem;
}
@end



@implementation NSDictionary (DATEFORKEY)


- (NSDate *) dateForKey:(NSString *) key {
    
    NSString *obj = [self objectForKey:key];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM/dd/yyyy HH:mm:ss"];
    return [formatter dateFromString:obj];
}

- (NSString *)JSONString
{
    NSError *error;
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    
    
    NSString *jsonString = [[NSString alloc] initWithData:postData encoding:NSUTF8StringEncoding];
    return jsonString;
}


@end
