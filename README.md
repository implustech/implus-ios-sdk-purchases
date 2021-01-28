## Requirements

ImplusPurcases SDK minimum requirements:
* iOS 9.0+
* Xcode 10+
***
## Installation
**CocoaPods**

To integrate `ImplusPurchases` into your Xcode project using CocoaPods, specify it into your `Podfile`.

```
target 'MyApp' do
	use_frameworks!
    pod 'ImplusPurchases', '~> 0.1'
end
```

***
## Importing ImplusPurchases
```swift
import ImplusPurchases
```
***
## Setup
**Basic configuration**
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool { 
    IMPurchase.shared.enableLog(true)
    IMPurchase.shared.configure("appkey") 
}
```

**With app key and user id**

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool { 
    IMPurchase.shared.enableLog(true)
    IMPurchase.shared.configure("appkey", userId: "userId")
}
```

***
## Getting product groups
To get product groups you need to call `getProductGroups` function. It will return `dictionary` with group name as key and `IMGroup` as value.

```swift
IMPurchase.shared.getProductGroups { (productGroups, error) in
	if let group = productGroups["pro"] {
		let products = group.products
	}
}
```

To get `IMProduct` array  you need to check if your wanted group exists in product group dictionary. Then you are able to take product array by calling `group.products`
***
## Check if payment available
Before starting the purchase process you need to check if purchase is available in the device. It can be disabled by parent control or other reasons.

```swift 
let canMakePurchases = IMPurchase.shared.canMakePayments()
```
***
## Making purchase
To start the purchase process call function `purchaseProduct` it will take `IMProduct` object as a parameter.

```swift
IMPurchase.shared.purchaseProduct(selectedPlan) { (transaction, entitlement, error, isCanceled) in {

}
```

Closure will return `SKPaymentTransaction`,  entitlement dictionary, error if it occurred and bool to indicate if a user canceled the purchase process.

## Checking user status

To check if user have any active entitlements call function `hasActiveSubscription`

```swift
IMPurchase.shared.hasActiveSubscription { (entitlements, error) in
	if entitlements["pro"]?.isActive() == true {
		// user have active entiltement
	} else {
		// user don't have active entitlement
	}
}
```
It will return the entitlements dictionary where key entitlement id and value `IMEntitlment` object. To check if entilement active call `isActive()` method of `IMEntitlement` object.

> **NOTE** `hasActiveSubscription`  will return the cached result. This function once in a while make a network calls to refresh cache information. To clear cash call `IMPurchase.shared.invalidateCache()`.
***
## Restoring purchases

To restore user purchases call `restorePurchases` function.

```swift
IMPurchase.shared.restorePurchases { (entitlement, error) in
	if entitlement["pro"]?.isActive() == true {
		// Purchase restored and have active entitlment
	} else {
		if error != nil {
			// Purchase restore finished with error
		} else {
			// Purchase restore finished but user don't have active entitlment
		}
	}
```

## UploadUserInfo
To UploadUserInfo  call `uploadUserInfo` function. This method needs to pass in the parameter  `userId`

> **NOTE**  Adds an interface `uploadUserInfo`, which is used to upload subscribed user data. Currently, this data is used for iap attribution.

```
swift
IMPurchase.shared.uploadUserInfo(userId: "xxxx") { (result, error) in
    
}

Objective-C
[[IMPurchase shared] uploadUserInfoWithUserId:@"xxxx" completion:^(BOOL result, NSError * _Nullable error) {
    
}];
```

An error (if it occurs) and a boolean value, indicating the success or failure of the submitted data

