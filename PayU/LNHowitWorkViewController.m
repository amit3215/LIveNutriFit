


//
//  LNHowitWorkViewController.m
//  LIveNutriFit
//
//  Created by Amit kumar on 22/05/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

#import "LNHowitWorkViewController.h"
#import <SVProgressHUD.h>

@interface LNHowitWorkViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *howItWorkWebView;

@end

@implementation LNHowitWorkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    NSString *urlAddress = @"";
    
    
    if (_noteType == LNWebViewTypeOurCompany) {
         urlAddress = @"http://52.24.100.222/who_we_are.aspx?mob=y";
    }if (_noteType == LNWebViewTypeTermCondition) {
        urlAddress = @"http://52.24.100.222/Terms_of_service.aspx?mob=y";
    }if (_noteType == LNWebViewTypePrivacyPolicy) {
        urlAddress = @"http://52.24.100.222/privacypolicy.aspx?mob=y";
    }if (_noteType == LNWebViewTypeContactUS) {
        urlAddress = @"http://52.24.100.222/Contactus.aspx?mob=y";
    }
    if (_noteType == LNWebViewTypeMeetOurTeam) {
        urlAddress = @"http://52.24.100.222/mentors.aspx?mob=y";
    }
    
   
    
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:urlAddress];
    
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    //Load the request in the UIWebView.
    [_howItWorkWebView loadRequest:requestObj];
     self.automaticallyAdjustsScrollViewInsets = NO;
    

}

-(void)viewDidDisappear:(BOOL)animated{
    _noteType = LNWebViewTypeSelf;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
 
    
    if (_noteType == LNWebViewTypeOurCompany) {
        self.navigationItem.title = @"Our Company";
    }if (_noteType == LNWebViewTypeTermCondition) {
        self.navigationItem.title = @"Term & Condition";
    }if (_noteType == LNWebViewTypePrivacyPolicy) {
        self.navigationItem.title = @"Privacy Policy";
    }if (_noteType == LNWebViewTypeContactUS) {
        self.navigationItem.title = @"Contact Us";
    }if (_noteType == LNWebViewTypeMeetOurTeam) {
        self.navigationItem.title = @"Meet Our Team";
    }
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
