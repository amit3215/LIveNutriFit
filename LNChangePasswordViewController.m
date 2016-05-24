//
//  LNChangePasswordViewController.m
//  LIveNutriFit
//
//  Created by Amit kumar on 13/05/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

#import "LNChangePasswordViewController.h"
#import "TRWebServiceManger.h"
#import <SVProgressHUD.h>
#import "LIveNutriFit-Swift.h"

@interface LNChangePasswordViewController ()
@property (weak, nonatomic) IBOutlet UITextField *oldPasswordTextField;
@property (weak, nonatomic) IBOutlet UITextField *nextpassword;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasword;

@end

@implementation LNChangePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    [path moveToPoint:CGPointMake(_oldPasswordTextField.bounds.origin.x, _oldPasswordTextField.bounds.origin.y +_oldPasswordTextField.frame.size.height)];
//    [path addLineToPoint:CGPointMake(_oldPasswordTextField.frame.origin.x+100, _oldPasswordTextField.frame.origin.y +_oldPasswordTextField.frame.size.height)];
//    
//    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
//    shapeLayer.path = [path CGPath];
//    shapeLayer.strokeColor = [[UIColor blueColor] CGColor];
//    shapeLayer.lineWidth = 3.0;
//    shapeLayer.fillColor = [[UIColor clearColor] CGColor];
//    
//    
//    [self.view.layer addSublayer:shapeLayer];
    
   
    
    [self addBorder:_oldPasswordTextField];
    [self addBorder:_nextpassword];
    [self addBorder:_confirmPasword];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"CHANGE PASSWORD";
}


-(void)addBorder:(UITextField*)textField{
    
    CALayer *border = [CALayer layer];
    CGFloat borderWidth = 1.0;
    border.borderColor = [UIColor darkGrayColor].CGColor;
    border.frame = CGRectMake(0, textField.frame.size.height - borderWidth, textField.frame.size.width, textField.frame.size.height);
    border.borderWidth = borderWidth;
    [textField.layer addSublayer:border];
    textField.layer.masksToBounds = YES;
    
}
- (IBAction)changepassword:(id)sender {
    
    if (_nextpassword.text.length == 0) {
        [SVProgressHUD showInfoWithStatus:@"Please enter new password"];
        return;
    }
    
    if (_oldPasswordTextField.text.length == 0) {
        [SVProgressHUD showInfoWithStatus:@"Please enter old password"];
        return;
    }
    
    TRWebServiceManger *serviceManager = [TRWebServiceManger sharedManager];
    

    
    NSMutableDictionary *dataDictionary = [NSMutableDictionary dictionaryWithObject:[LiveNutriFitApi sharedInstance].loginData.patientId forKey:@"PatientId"];
    [dataDictionary setObject:_nextpassword.text forKey:@"NewPassword"];
    [dataDictionary setObject:_oldPasswordTextField.text forKey:@"OldPassword"];
    
    
    
    [serviceManager makeRequestWithURL:@"http://52.24.100.222/LiveNutriFitWebService/patient.asmx/Patient_ChangePassword" andParameter:dataDictionary andCompletionHandler:^(NSDictionary* response){

        
        
    }];

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
