# JDFNavigationBarActivityIndicator

[![Version](https://img.shields.io/cocoapods/v/JDFNavigationBarActivityIndicator.svg?style=flat)](http://cocoadocs.org/docsets/JDFNavigationBarActivityIndicator)
[![License](https://img.shields.io/cocoapods/l/JDFNavigationBarActivityIndicator.svg?style=flat)](http://cocoadocs.org/docsets/JDFNavigationBarActivityIndicator)
[![Platform](https://img.shields.io/cocoapods/p/JDFNavigationBarActivityIndicator.svg?style=flat)](http://cocoadocs.org/docsets/JDFNavigationBarActivityIndicator)

 JDFNavigationBarActivityIndicator is a UIView subclass that provides an easy, space-effective way to show an activity indicator on a UINavigationBar.
 
 It is visually similar in concept to the progress indicator shown in iOS Safari, in that it appears as a thin, animating line at the bottom of a navigation bar. The difference is that it is an indeterminate progress indicator, making it useful for when you don't know the completion progress of a task.
 
 Create an instance with the vanilla `init` initialiser. You do not need to set its `frame`. Use `addToNavigationBar:startAnimating:` to add it to your desired UINavigationBar. Methods are provided for starting & stopping the animation. You should call `setNeedsLayout` after device rotation, if required.
 
 You can supply a custom `color` and `highlightColor`.


## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

JDFNavigationBarActivityIndicator is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "JDFNavigationBarActivityIndicator"

## Author

Joe Fryer, joe.d.fryer@gmail.com

## License

JDFNavigationBarActivityIndicator is available under the MIT license. See the LICENSE file for more info.

