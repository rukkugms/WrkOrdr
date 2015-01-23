//
//  WorkViewController.h
//  KontractWorkOrder
//
//  Created by Riya on 1/23/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WorkViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *worktable;
@property (strong, nonatomic) IBOutlet UIView *titleview;
- (IBAction)clsebtn:(id)sender;
- (IBAction)Addbtn:(id)sender;

@end
