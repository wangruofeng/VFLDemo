//
//  RFConnectionToSuperviewController.m
//  VFLDemo
//
//  Created by 王若风 on 24/02/2017.
//  Copyright © 2017 王若风. All rights reserved.
//

#import "RFConnectionToSuperviewController.h"

@interface RFConnectionToSuperviewController ()

@end

@implementation RFConnectionToSuperviewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setUp {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [button setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:1]];
    [button setTitle:@"Button" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.view addSubview:button];
    
    
    // addConstraints
    // |-50-[purpleBox]-50-|
    NSDictionary *views = @{@"button": button};
    NSInteger margin = 50;
    NSDictionary *metrics = @{@"sideMargin":@(margin),
                              @"topMargin":@(10 + 64)};
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-sideMargin-[button]-sideMargin-|"
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topMargin-[button]"
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:views]];
}

@end
