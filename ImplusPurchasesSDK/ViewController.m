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
    [[IMPurchase shared] requestProducts:^(NSDictionary<NSString *,IMGroup *> * _Nullable groups, NSError * _Nullable error) {
        self->_products = groups[@"premium"].products;
        NSLog(@"%@",groups);
        [self->_tableView reloadData];
    }];
}

- (IBAction)buttonAction:(id)sender {
    [[IMPurchase shared] hasActiveSubscription:^(NSDictionary<NSString *,IMEntitlement *> * _Nullable entitlements, NSError * _Nullable error) {
        if ([entitlements[@"pro"] isActive]) {
            NSLog(@"pro active");
        } else {
            NSLog(@"pro not active");
        }
        
        if ([entitlements[@"premium"] isActive]) {
            NSLog(@"premium active");
        } else {
            NSLog(@"premium not active");
        }
    }];
}

- (IBAction)restoreAction:(id)sender {
    [[IMPurchase shared] restorePurchases:^(NSDictionary<NSString *, IMEntitlement*>* ent, NSError * _Nullable error) {
        NSLog(@"restored");
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_products count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: @"cell"];
    }
    
    SKProduct* product = _products[indexPath.row].product;
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
    
    [[cell textLabel] setText:[NSString stringWithFormat:@"n: %@ | p: %@ | t: %@", indef, priceString, isTrial]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [[IMPurchase shared] purchaseProduct:_products[indexPath.row] completion:^(SKPaymentTransaction * _Nonnull transaction, NSDictionary<NSString *, IMEntitlement*>* _Nullable ent, NSError * _Nullable error, BOOL canceled) {
        if (canceled) {
            NSLog(@"Canceled");
        } else {
            NSLog(@"Buy");
        }
    }];
    
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:false];
}


@end

