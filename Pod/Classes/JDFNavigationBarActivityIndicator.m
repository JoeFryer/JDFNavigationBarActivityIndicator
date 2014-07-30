//
//  JDFNavigationBarActivityIndicator.m
//  ERBrowser
//
//  Created by Joe Fryer on 28/07/2014.
//  Copyright (c) 2014 Celf Creative. All rights reserved.
//

#import "JDFNavigationBarActivityIndicator.h"


// Geometry
CGFloat const JDFNavigationBarActivityIndicatorHeight = 2.0f;

// Animation Key
static NSString *const JDFNavigationBarActivityIndicatorAnimationKey = @"JDFNavigationBarActivityIndicatorAnimationKey";

// Options
static CGFloat const JDFNavigationBarActivityIndicatorGradientViewWidthRatio = 1.0f;
static CGFloat const JDFNavigationBarActivityIndicatorAnimationDuration = 1.0f;



/// *********************************************
/// JDFNavigationBarActivityIndicatorGradientView
/// *********************************************

@interface JDFNavigationBarActivityIndicatorGradientView : UIView

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) UIColor *highlightColor;

@end


@implementation JDFNavigationBarActivityIndicatorGradientView

#pragma mark - Getters

- (UIColor *)color
{
    if (!_color) {
        if (!self.window.tintColor) {
            return [UIColor blueColor];
        }
        return self.window.tintColor;
    }
    return _color;
}

- (UIColor *)highlightColor
{
    if (!_highlightColor) {
        return [UIColor whiteColor];
    }
    return _highlightColor;
}


#pragma mark - Drawing

- (void)drawRect:(CGRect)rect
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIColor *mainColor = self.color;
    UIColor *highlightColor = self.highlightColor;
    static UIColor *tailColor = nil;
    if (!tailColor) {
        tailColor = [UIColor colorWithRed: 0.78 green: 0.912 blue: 0.996 alpha: 1];
    }
    
    CGFloat gradientLocations[] = {0, 0.4, 0.9, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)mainColor.CGColor, (id)tailColor.CGColor, (id)highlightColor.CGColor, (id)mainColor.CGColor], gradientLocations);
    
    CGRect bounds = self.bounds;
    UIBezierPath *path = [UIBezierPath bezierPathWithRect: bounds];
    CGContextSaveGState(context);
    [path addClip];
    CGContextDrawLinearGradient(context, gradient,
                                CGPointMake(CGRectGetMinX(bounds), CGRectGetMidY(bounds)),
                                CGPointMake(CGRectGetMaxX(bounds), CGRectGetMidY(bounds)),
                                0);
    CGContextRestoreGState(context);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}

@end

/// *********************************************




/// *********************************************
/// JDFNavigationBarActivityIndicator
/// *********************************************

@interface JDFNavigationBarActivityIndicator()

// State
@property (nonatomic) BOOL animating;

// Views
@property (nonatomic, strong) JDFNavigationBarActivityIndicatorGradientView *gradientView;
@property (nonatomic, weak) UINavigationBar *navigationBar;

// Animation
@property (nonatomic, strong) CABasicAnimation *animation;

@end


@implementation JDFNavigationBarActivityIndicator

#pragma mark - Getters

- (JDFNavigationBarActivityIndicatorGradientView *)gradientView
{
    if (!_gradientView) {
        _gradientView = [[JDFNavigationBarActivityIndicatorGradientView alloc] initWithFrame:[self gradientViewFrame]];
        _gradientView.color = self.color;
        _gradientView.highlightColor = self.highlightColor;
    }
    return _gradientView;
}

- (UIColor *)color
{
    if (!_color) {
        if (!self.window.tintColor) {
            return [UIColor blueColor];
        }
        return self.window.tintColor;
    }
    return _color;
}

- (CABasicAnimation *)animation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    animation.fromValue = @(-self.gradientView.frame.size.width);
    animation.toValue = @(self.frame.size.width + (self.gradientView.frame.size.width / 2));
    animation.duration = JDFNavigationBarActivityIndicatorAnimationDuration;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation.repeatCount = INFINITY;
    return animation;
}


#pragma mark - Layout

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.frame = [self activityIndicatorFrame];
    self.gradientView.frame = [self gradientViewFrame];
}


#pragma mark - Public

- (void)addToNavigationBar:(UINavigationBar *)navigationBar startAnimating:(BOOL)startAnimating
{
    self.navigationBar = navigationBar;
    self.frame = [self activityIndicatorFrame];
    self.alpha = 0.0f;
    [navigationBar addSubview:self];
    self.backgroundColor = self.color;
    
    if (startAnimating) {
        [self startAnimating];
    }
    
    [self addSubview:self.gradientView];
}

- (void)startAnimating
{
    self.gradientView.frame = [self gradientViewFrame];
    
    [self.gradientView.layer addAnimation:self.animation forKey:JDFNavigationBarActivityIndicatorAnimationKey];

    if (self.animating) {
        return;
    }
    self.hidden = NO;
    self.animating = YES;
    [UIView animateWithDuration:0.4 animations:^{
        self.alpha = 1.0f;
    }];
}

- (void)stopAnimating
{
    if (!self.animating) {
        return;
    }
    [UIView animateWithDuration:0.4 animations:^{
        self.alpha = 0.0f;
    } completion:^(BOOL finished) {
        self.animating = NO;
        self.hidden = YES;
        [self.gradientView.layer removeAnimationForKey:JDFNavigationBarActivityIndicatorAnimationKey];
    }];
}


#pragma mark - Frames

- (CGRect)activityIndicatorFrame
{
    CGRect frame = CGRectMake(0.0f, self.navigationBar.bounds.size.height - JDFNavigationBarActivityIndicatorHeight, self.navigationBar.bounds.size.width, JDFNavigationBarActivityIndicatorHeight);
    return frame;
}

- (CGRect)gradientViewFrame
{
    return CGRectMake(0.0f, 0.0f, self.bounds.size.width * JDFNavigationBarActivityIndicatorGradientViewWidthRatio, self.bounds.size.height);
}

@end

/// *********************************************

