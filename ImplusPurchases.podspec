#
# Be sure to run `pod lib lint ImplusPurchases.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ImplusPurchases'
  s.version          = '0.1.4'
  s.summary          = 'iOS in-app purchase framework which will help implement purchases in your app in a few minutes.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/implustech/implus-ios-sdk-purchases.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Implus.co' => 'cocoapods@implustech.com ' }
  s.source           = { :git => 'https://github.com/implustech/implus-ios-sdk-purchases.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.vendored_frameworks  = "ImplusPurchasesSDK/Framework/ImplusPurchases.xcframework"

  # s.pod_target_xcconfig = {
  #  'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  # }
  # s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

  s.dependency 'gRPC-ProtoRPC', '~>1.31.0'
  s.dependency 'Protobuf','~>3.13.0'
  s.dependency 'Founq_KeychainIDFA'

  s.pod_target_xcconfig = {
    # This is needed by all pods that depend on Protobuf:
    'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS=1',
    # This is needed by all pods that depend on gRPC-RxLibrary:
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
  }
end
