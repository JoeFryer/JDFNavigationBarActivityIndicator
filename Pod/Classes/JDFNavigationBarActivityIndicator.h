//
//  JDFNavigationBarActivityIndicator.h
//  ERBrowser
//
//  Created by Joe Fryer on 28/07/2014.
//  Copyright (c) 2014 Celf Creative. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 @c JDFNavigationBarActivityIndicator is a @c UIView subclass that provides an easy, space-effective way to show an activity indicator on a UINavigationBar.
 
 It is visually similar in concept to the progress indicator shown in iOS Safari, in that it appears as a thin, animating line at the bottom of a navigation bar. The difference is that it is an indeterminate progress indicator, making it useful for when you don't know the completion progress of a task.
 
 Create an instance with the vanilla @c init initialiser. You do not need to set its @c frame. Use @c addToNavigationBar:startAnimating: to add it to your desired UINavigationBar. Methods are provided for starting & stopping the animation. You should call @c setNeedsLayout after device rotation, if required. 
 
 You can supply a custom color and highlightColor.
 */
@interface JDFNavigationBarActivityIndicator : UIView

/** The main color of the activity indicator.
 */
@property (nonatomic, strong) UIColor *color;

/** The highlight color of the activity indicator.
 */
@property (nonatomic, strong) UIColor *highlightColor;

/** Indicates whether the activity indicator is currently animating or not.
 */
@property (nonatomic, readonly) BOOL animating;

/** Adds the activity indicator to the navigation bar supplied. startAnimating indicates whether the activity indicator should start animating after it is added to the navigation bar, or not.
 */
- (void)addToNavigationBar:(UINavigationBar *)navigationBar startAnimating:(BOOL)startAnimating;

/** Starts the activity animation.
 */
- (void)startAnimating;

/** Stops the activity animation.
 */
- (void)stopAnimating;

@end
