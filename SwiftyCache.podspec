#
# Be sure to run `pod lib lint SwiftyCache.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftyCache'
  s.version          = '0.1.0'
  s.summary          = 'Swifty API for NSCache.'
  s.homepage         = 'https://github.com/satishbabariya/SwiftyCache'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Satish Babariya' => 'satish.babariya@gmail.com' }
  s.source           = { :git => 'https://github.com/satishbabariya/SwiftyCache.git', :tag => s.version }


  s.requires_arc = true
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.11'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'
  s.swift_version = '4.2'
  s.cocoapods_version = '>= 1.4.0'  

  s.source_files = 'Sources/SwiftyCache/SwiftyCache.swift'
end
