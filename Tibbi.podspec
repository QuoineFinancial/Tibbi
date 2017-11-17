#
# Be sure to run `pod lib lint Tibbi.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Tibbi'
  s.version          = '1.0.2'
  s.summary          = 'This library makes working with tableViews a pleasure.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
No more boilerplate dataSources for the tableView - simply create the viewModels, the library takes the rest.
                       DESC

  s.homepage         = 'https://github.com/cristian-azov/Tibbi'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Cristian Azov' => 'cristian.azov@gmail.com' }
  s.source           = { :git => 'https://github.com/cristian-azov/Tibbi.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Tibbi/Classes/**/*'

  # s.resource_bundles = {
  #   'Tibbi' => ['Tibbi/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
