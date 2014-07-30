//
//  JDFViewController.m
//  JDFNavigationBarActivityIndicator
//
//  Created by Joe Fryer on 07/29/2014.
//  Copyright (c) 2014 Joe Fryer. All rights reserved.
//

#import "JDFViewController.h"
#import "JDFNavigationBarActivityIndicator.h"


@interface JDFViewController ()

@property (nonatomic, strong) JDFNavigationBarActivityIndicator *activityIndicator;
@property (nonatomic, strong) UIButton *button;

@end


@implementation JDFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"JDFActivityIndicator";
    
    JDFNavigationBarActivityIndicator *activityIndicator = [[JDFNavigationBarActivityIndicator alloc] init];
    activityIndicator.color = [UIColor colorWithRed:52.0f/255.0f green:152.0f/255.0f blue:219.0f/255.0f alpha:1.0f];
    [activityIndicator addToNavigationBar:self.navigationController.navigationBar startAnimating:NO];
    self.activityIndicator = activityIndicator;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Toggle" forState:UIControlStateNormal];
    CGFloat buttonWidth = 100.0f;
    button.frame = CGRectMake((self.view.frame.size.width / 2) - (buttonWidth / 2), 250.0f, buttonWidth, 30.0f);
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    self.button = button;
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [self.activityIndicator setNeedsLayout];
    
    CGFloat buttonWidth = 100.0f;
    self.button.frame = CGRectMake((self.view.frame.size.width / 2) - (buttonWidth / 2), 250.0f, buttonWidth, 30.0f);
}

- (void)buttonPressed:(UIButton *)sender
{
    if (self.activityIndicator.animating) {
        [self.activityIndicator stopAnimating];
    } else {
        [self.activityIndicator startAnimating];
    }
}

@end
