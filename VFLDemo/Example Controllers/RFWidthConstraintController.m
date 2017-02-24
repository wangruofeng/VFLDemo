//
//  RFWidthConstraintController.m
//  VFLDemo
//
//  Created by 王若风 on 24/02/2017.
//  Copyright © 2017 王若风. All rights reserved.
//

#import "RFWidthConstraintController.h"

@interface RFWidthConstraintController ()

@end

@implementation RFWidthConstraintController

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
    [button sizeToFit];
    
    [self.view addSubview:button];

    
    // addConstraints
    // [button(>=50)]
    NSDictionary *views = @{@"button": button};
    NSInteger margin = 16;
    NSDictionary *metrics = @{@"sideMargin":@(margin),
                              @"topMargin":@(margin + 64)};
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-sideMargin-[button]"
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topMargin-[button]"
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[button(>=200)]"
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:views]];
}

@end
