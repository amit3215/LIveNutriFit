//
//  LNHowWorkViewController.m
//  LIveNutriFit
//
//  Created by Amit kumar on 22/05/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

#import "LNHowWorkViewController.h"
#import <SVProgressHUD.h>

@interface LNHowWorkViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *howWorkWebView;

@end

@implementation LNHowWorkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *urlAddress = @"http://www.livenutrifit.com/howtowork.html";
    

    //Create a URL object.
    NSURL *url = [NSURL URLWithString:urlAddress];
    
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    //Load the request in the UIWebView.
    [_howWorkWebView loadRequest:requestObj];
    self.automaticallyAdjustsScrollViewInsets = NO;

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    //SHOW HUD
    [SVProgressHUD show];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    //KILL HUD
    [SVProgressHUD dismiss];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    if(!webView.loading){
        //KILL HUD
        [SVProgressHUD dismiss];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
