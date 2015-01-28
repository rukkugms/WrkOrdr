//
//  AddworkViewController.h
//  KontractWorkOrder
//
//  Created by Riya on 1/23/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface AddworkViewController : UIViewController
- (IBAction)clsebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UITextView *destxtview;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollview;

@property (strong, nonatomic) IBOutlet UITextField *workordrtxtfld;
@property (strong, nonatomic) IBOutlet UITextField *prioritytxtfld;
@property (strong, nonatomic) IBOutlet UITextField *planttxtfld;
@property (strong, nonatomic) IBOutlet UITextField *subunittxtfld;
@property (strong, nonatomic) IBOutlet UITextField *equmnttxtfld;

@property (strong, nonatomic) IBOutlet UITextField *tagtxtfld;
@property (strong, nonatomic) IBOutlet UITextField *requsttxtfld;
@property (strong, nonatomic) IBOutlet UITextField *date1;
@property (strong, nonatomic) IBOutlet UITextField *approvetxtfld;

@property (strong, nonatomic) IBOutlet UITextField *date2;
- (IBAction)updatebtn:(id)sender;
- (IBAction)cancelbtn:(id)sender;

@end
