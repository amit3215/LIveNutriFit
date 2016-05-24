//
//  TRWebServiceManger.h
//  TrackApp
//
//  Created by Amit kumar on 19/11/15.
//  Copyright © 2015 chetu-mac-mini-20. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Utiity.h"


@interface TRWebServiceManger : NSObject<NSURLSessionDelegate>{
    NSDictionary *serverResponse;
}
+ (TRWebServiceManger*)sharedManager;
 



-(void)makeRequestWithURL:(NSString*)url andParameter:(NSDictionary*)param andCompletionHandler:(void (^)(NSDictionary *result))completionHandler;



@end
