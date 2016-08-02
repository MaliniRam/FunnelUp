#
# Be sure to run `pod lib lint FunnelUp.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FunnelUp'
  s.version          = '0.1.1'
  s.summary          = 'Allows users to send their device token to our server, so that they can start receiving push notifications'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'This cocoa pod is based on ObjectiveC. This pod basically focuses on developers who do not have a server of their own. This pod allows users to send their device token to our server, so that they can start receiving push notifications.'

  s.homepage         = 'https://github.com/MaliniRam/FunnelUp'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'MaliniRam' => 'malini.ramanathan@snyxius.com' }
  s.source           = { :git => 'https://github.com/MaliniRam/FunnelUp.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'FunnelUp/Classes/**/*'
  
  # s.resource_bundles = {
  #   'FunnelUp' => ['FunnelUp/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
