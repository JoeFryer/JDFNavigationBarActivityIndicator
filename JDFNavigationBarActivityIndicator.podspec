#
# Be sure to run `pod lib lint JDFNavigationBarActivityIndicator.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "JDFNavigationBarActivityIndicator"
  s.version          = "1.0"
  s.summary          = "A UIView subclass that provides an easy, space-effective way to show an activity indicator on a UINavigationBar."
  s.description      = <<-DESC
JDFNavigationBarActivityIndicator is a UIView subclass that provides an easy, space-effective way to show an activity indicator on a UINavigationBar.
 
It is visually similar in concept to the progress indicator shown in iOS Safari, in that it appears as a thin, animating line at the bottom of a navigation bar. The difference is that it is an indeterminate progress indicator, making it useful for when you don't know the completion progress of a task.
                        DESC
  s.homepage         = "https://github.com/JoeFryer/JDFNavigationBarActivityIndicator"
  s.license          = 'MIT'
  s.author           = { "Joe Fryer" => "joe.d.fryer@gmail.com" }
  s.source           = { :git => "https://github.com/JoeFryer/JDFNavigationBarActivityIndicator.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/joefryer88'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'

  s.frameworks = 'UIKit'
end
