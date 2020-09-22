//
//  ViewController.m
//  ImplusPurchasesSDK
//
//  Created by Vilius Padleckis on 2020-09-16.
//  Copyright © 2020 Implus.co. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [[IMPurchase shared] invalidateCache];
    [[IMPurchase shared] getProductGroups:^(NSDictionary<NSString *,IMGroup *> * _Nullable groups, NSError * _Nullable error) {
        self->_groups = groups;
        [self->_tableView reloadData];
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self checkStatus];
    _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    _activityIndicator.alpha = 1.0;
    _activityIndicator.center = self.view.center;
    [self.view addSubview:_activityIndicator];
    [_activityIndicator startAnimating];
    [_activityIndicator setHidden:true];
}

- (IBAction)buttonAction:(id)sender {
//    BOOL *sandbox = [[IMPurchase shared] isSandbox];
//    NSLog(@"%@",sandbox? @"YES":@"NO");
    [self checkStatus];
}
- (IBAction)invalidateCacheAction:(id)sender {
    [[IMPurchase shared] invalidateCache];
}

- (IBAction)restoreAction:(id)sender {
    [[IMPurchase shared] restorePurchases:^(NSDictionary<NSString *, IMEntitlement*>* ent, NSError * _Nullable error) {
        NSLog(@"restored");
    }];
}

-(void)checkStatus {
    [[IMPurchase shared] hasActiveSubscription:^(NSDictionary<NSString *,IMEntitlement *> * _Nullable entitlements, NSError * _Nullable error) {
        NSString * status = @"";
        if ([entitlements[@"pro"] isActive]) {
            status = @"pro active";
            [self->_statusLabel setTextColor:[UIColor greenColor]];
        } else {
            status = @"pro not active";
            [self->_statusLabel setTextColor:[UIColor redColor]];
        }
        [self->_statusLabel setText:[NSString stringWithFormat:@"Subcription status: %@", status]];
    }];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *allKeys = [_groups allKeys];
    NSString *curKey = [allKeys objectAtIndex:section];
    IMGroup *curArray = [_groups objectForKey:curKey];
    return [curArray.products count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_groups count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: @"cell"];
    }
    NSArray *allKeys = [_groups allKeys];
    NSString *curKey = [allKeys objectAtIndex:indexPath.section];
    IMGroup *curArray = [_groups objectForKey:curKey];
    
    SKProduct* product = curArray.products[indexPath.row].product;
    NSString* indef = [product productIdentifier];
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [numberFormatter setLocale:product.priceLocale];
    NSString *priceString = [numberFormatter stringFromNumber:product.price];
    NSString* isTrial = @"NO";
    if ([[product introductoryPrice] numberOfPeriods] != nil) {
        isTrial = @"Yes";
    }
    
    [[cell textLabel] setText:[NSString stringWithFormat:@"%@ | %@ | trial: %@", indef, priceString, isTrial]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *allKeys = [_groups allKeys];
    NSString *curKey = [allKeys objectAtIndex:indexPath.section];
    IMGroup *curArray = [_groups objectForKey:curKey];

    [_activityIndicator setHidden:false];
    [[IMPurchase shared] purchaseProduct:curArray.products[indexPath.row] completion:^(SKPaymentTransaction * _Nonnull transaction, NSDictionary<NSString *, IMEntitlement*>* _Nullable ent, NSError * _Nullable error, BOOL canceled) {
        if (canceled || error != nil) {
            NSLog(@"Canceled");
            [self->_errorLabel setText:error.localizedDescription];
//            if (error != nil) {
//                UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error then purching"
//                                                                               message:error.description
//                                               preferredStyle:UIAlertControllerStyleAlert];
//
//                UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
//                   handler:^(UIAlertAction * action) {}];
//
//                [alert addAction:defaultAction];
//                [self presentViewController:alert animated:YES completion:nil];
//            }
        } else {
            NSLog(@"Purchase completed");
            [self checkStatus];
        }
        [_activityIndicator setHidden:true];
        
    }];
    
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:false];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSArray *allKeys = [_groups allKeys];
    return [allKeys objectAtIndex:section];
}


@end
