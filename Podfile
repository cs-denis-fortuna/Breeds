platform :ios, '13.6'
use_frameworks!

source 'https://github.com/CocoaPods/Specs.git'

target 'Breeds' do
  pod 'Alamofire', '~> 5.2'
  pod 'Kingfisher', '~> 5.14'
  pod 'SwiftLint', '0.39.2'

  plugin 'cocoapods-keys', {
    :project => "Breeds",
    :keys => [
      "TheDogAPIKey"
    ]
  }
end

target 'BreedsTests' do
  pod 'Quick'
  pod 'Nimble'
  pod 'Nimble-Snapshots'
end


