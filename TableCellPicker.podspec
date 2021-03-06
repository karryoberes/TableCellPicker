#
# Be sure to run `pod lib lint TableCellPicker.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "TableCellPicker"
  s.version          = "0.2.3"
  s.summary          = "A table view cell that displays a picker view for selecting a value."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
			This CocoaPod provides the ability to instantiate a custom tableview cell with a picker view for selecting values.
                       DESC

  s.homepage         = "https://github.com/karryoberes/TableCellPicker"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Oberes, Karry Raia C." => "karry.raia.c.oberes@accenture.com" }
  s.source           = { :git => "https://github.com/karryoberes/TableCellPicker.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.deprecated = true
  
  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'TableCellPicker' => ['Pod/**/*.xib']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
