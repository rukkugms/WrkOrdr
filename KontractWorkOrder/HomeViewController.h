//
//  HomeViewController.h
//  KontractWorkOrder
//
//  Created by Riya on 1/23/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WorkViewController.h"
@interface HomeViewController : UIViewController

- (IBAction)btn:(id)sender;
@property(strong,nonatomic)WorkViewController*workVCtrl;

@end
