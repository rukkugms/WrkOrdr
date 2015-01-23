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
{
    BOOL recordResults;
}

@property (strong, nonatomic)NSString*username;
/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

- (IBAction)btn:(id)sender;
@property(strong,nonatomic)WorkViewController*workVCtrl;

-(IBAction)logoutaction:(id)sender;

@end
