//
//  ViewController.h
//  ImplusPurchasesSDK
//
//  Created by Vilius Padleckis on 2020-09-16.
//  Copyright © 2020 Implus.co. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>
@import ImplusPurchases;

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UILabel *errorLabel;

@property (strong) NSDictionary<NSString *,IMGroup *> * groups;
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;
@property (strong) UIActivityIndicatorView *activityIndicator;

@end

