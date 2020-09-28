//
//  ViewController.swift
//  ImplusPurchasesExample
//
//  Created by Vilius Padleckis on 2020-09-28.
//  Copyright © 2020 Implus.co. All rights reserved.
//

import UIKit
import ImplusPurchases
class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var errorLabel: UILabel!
    var activityIndicator: UIActivityIndicatorView!
    var groups: ProductGroups! = ProductGroups()
    let entitlementName = "pro"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        IMPurchase.shared.invalidateCache()
        IMPurchase.shared.getProductGroups { (groups, error) in
            self.groups = groups
            self.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkStatus()
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.alpha = 1.0
        activityIndicator.center = self.view.center
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        activityIndicator.isHidden = true
    }
    
    @IBAction func checkSubAction(_ sender: Any) {
        checkStatus()
    }
    
    @IBAction func invalidateCacheAction(_ sender: Any) {
        IMPurchase.shared.invalidateCache()
    }
    
    @IBAction func restoreAction(_ sender: Any) {
        IMPurchase.shared.restorePurchases { (entitlement, error) in
            NSLog("restored");
            if let error = error {
                self.errorLabel.text = error.localizedDescription
            }
            if entitlement[self.entitlementName]?.isActive() == true {
                self.statusLabel.text = "Restore completed. Active purchase found"
            } else {
                self.statusLabel.text = "Restore completed. Active purchase not found"
            }
            self.statusLabel.textColor = UIColor.blue
        }
    }
    
    func checkStatus() {
        IMPurchase.shared.hasActiveSubscription { (entitlements, error) in
            var status = ""
            if entitlements[self.entitlementName]?.isActive() == true {
                status = "\(self.entitlementName) active"
                self.statusLabel.textColor = UIColor.green
            } else {
                status = "\(self.entitlementName) not active"
                self.statusLabel.textColor = UIColor.red
            }
            self.statusLabel.text = "Subscription status: \(status)"
        }
    }
    
    func purchaseProduct(product: IMProduct) {
        activityIndicator.isHidden = false
        IMPurchase.shared.purchaseProduct(product) { (_, entitlement, error, isCanceled) in
            if error != nil {
                if !isCanceled {
                    self.errorLabel.text = error!.localizedDescription
                }
            } else {
                print("Purchases completed")
                self.checkStatus()
            }
            self.activityIndicator.isHidden = true
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let keys = Array(groups.keys)
        return groups[keys[section]]?.products.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let keys = Array(groups.keys)
        return keys[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        let keys = Array(groups.keys)
        let group = groups[keys[indexPath.section]]
        if let products = group?.products {
            let skProduct = products[indexPath.row].product
            let identifier = skProduct.productIdentifier
            var isTrial = "NO"
            
            let numberFormatter = NumberFormatter()
            numberFormatter.formatterBehavior = .behavior10_4
            numberFormatter.numberStyle = .currency
            numberFormatter.locale = skProduct.priceLocale
            let priceString = numberFormatter.string(from: skProduct.price) ?? "-"
            
            if skProduct.introductoryPrice?.numberOfPeriods != nil {
                isTrial = "YES"
            }
            
            cell!.textLabel?.text = "\(identifier) | \(priceString) | trial: \(isTrial)"
        } else {
            cell!.textLabel?.text = "Missing product data"
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let keys = Array(groups.keys)
        guard let group = groups[keys[indexPath.section]] else { return }
        let product = group.products[indexPath.row]
        self.purchaseProduct(product: product)
    }
    
}

