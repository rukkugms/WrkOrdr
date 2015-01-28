//
//  ChartViewController.h
//  KontractWorkOrder
//
//  Created by GMSIndia 2 on 28/01/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddplanViewController.h"

@interface ChartViewController : UIViewController

- (IBAction)addplanbtn:(id)sender;
@property(strong,nonatomic)AddplanViewController *addplanVCtrl;

@property (strong, nonatomic) IBOutlet UITableView *charttable;
- (IBAction)clsebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UITableViewCell *chartcell;

@property (strong, nonatomic) IBOutlet UIView *titleview;


@end
