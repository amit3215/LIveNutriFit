//
//  TRWebServiceManger.m
//  TrackApp
//
//  Created by Amit kumar on 19/11/15.
//  Copyright © 2015 chetu-mac-mini-20. All rights reserved.
//

#import "TRWebServiceManger.h"



@implementation TRWebServiceManger

+ (TRWebServiceManger*)sharedManager {
    
    static TRWebServiceManger *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[super allocWithZone:NULL] init];
        
    });
    return sharedMyManager;
}

+ (id)allocWithZone:(NSZone *)ignore {
    return [self sharedManager];
}

- (void)makeRequestWithURL:(NSString*)url andParameter:(NSDictionary*)param andCompletionHandler:(void (^)(NSDictionary *result))completionHandler{
    
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: self delegateQueue: nil];
    
//    NSString*paramString = [self getParameters:param];
//    url = [url stringByAppendingString:paramString];
//    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
//    url = [url stringByReplacingOccurrencesOfString:@"%20"
//                                         withString:@""];
    
    
  
  
    
    NSURL *URL = [NSURL URLWithString:url];
    NSString* jsonString = [param JSONString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    [request setCachePolicy:NSURLRequestUseProtocolCachePolicy];
    [request setTimeoutInterval:720];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json"  forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json"  forHTTPHeaderField:@"Accept"];
    [request setHTTPBody:[jsonString dataUsingEncoding:NSUTF8StringEncoding]];
    [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[jsonString length]] forHTTPHeaderField:@"Content-Length"];

    NSLog(@"makeRequestWithURL :%@:%@", [[request URL] absoluteString], jsonString);
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (data!=nil) {
            serverResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        }
        
        
        NSString *myString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//        NSLog(@"Server Response  : %@",myString);
        
        NSString *packageresponse = [serverResponse objectForKey:@"d"];
        
        
         NSLog(@"Server Response  : %@",[packageresponse stringByReplacingOccurrencesOfString:@"\\" withString:@""]);
        
        
        NSData *data1 = [packageresponse dataUsingEncoding:NSUTF8StringEncoding];
        
        NSDictionary *jsonPacketResponse = [NSJSONSerialization JSONObjectWithData:data1 options:0 error:nil];
        
        
        
        
        
        if (response) {
            completionHandler(jsonPacketResponse);
        }
    }];
    [dataTask resume];
}

-(NSString*)getParameters:(NSDictionary*)param{
    NSString *parameterStrig = @"";
    for (NSString *key  in [param allKeys]) {
        parameterStrig =   [[[[parameterStrig stringByAppendingString:key] stringByAppendingString:@"="] stringByAppendingString:[[param objectForKey:key] description]] stringByAppendingString:@"&"];
    }
    return parameterStrig;
    
}






@end
