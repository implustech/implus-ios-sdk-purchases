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

@property (strong) NSArray<IMProduct *> * products;

@end
