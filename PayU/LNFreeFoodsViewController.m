//
//  LNFreeFoodsViewController.m
//  LIveNutriFit
//
//  Created by Amit kumar on 22/05/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

#import "LNFreeFoodsViewController.h"
#import <SVProgressHUD.h>

@interface LNFreeFoodsViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *freeFoodWebView;

@end

@implementation LNFreeFoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSString* htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    [_freeFoodWebView loadHTMLString:htmlString baseURL:nil];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Free Food";
    
   
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
