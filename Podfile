ENV['SWIFT_VERSION'] = '4.2'

platform :ios, '12.0'
use_frameworks!

project './Chat.xcodeproj'

def pods_defined
  pod 'IQKeyboardManagerSwift', '~> 6.5.0'
  pod 'Localize-Swift', '~> 2.0.0'
	pod 'Moya', '~> 12.0.1'
	pod 'Moya-ObjectMapper', '~> 2.8'
	pod 'RealmSwift', '~> 3.18.0'
  pod 'SwiftyBeaver', '~> 1.6'
end

target 'Chat' do
  inherit! :search_paths
	pods_defined
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
        end
    end
end
