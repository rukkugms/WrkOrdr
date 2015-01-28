//
//  PlngTileViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 25/08/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Rightscheck.h"
#import "WorkViewController.h"
#import "ChartViewController.h"


@interface PlngTileViewController : UIViewController
{
    NSString*userid;
    BOOL recordResults;
    NSInteger plntype;
    NSInteger checkws;
}

@property(strong,nonatomic)NSString *username;
-(IBAction)close:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *planngview;
@property (strong, nonatomic) IBOutlet UIView *workentryview;

@property(strong,nonatomic)WorkViewController *workctrlr;
@property(strong,nonatomic)ChartViewController *chartctrl;

@property(strong,nonatomic)Rightscheck *rights;
@property(readwrite)NSInteger ModuleID;
@property(strong,nonatomic)NSMutableArray *userrightsarray;
@property(strong,nonatomic)NSString *result;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *plnindictr;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *wrkindctr;


@end
