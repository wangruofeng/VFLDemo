//
//  RFPriorityController.m
//  VFLDemo
//
//  Created by 王若风 on 24/02/2017.
//  Copyright © 2017 王若风. All rights reserved.
//

#import "RFPriorityController.h"

@interface RFPriorityController ()

@end

@implementation RFPriorityController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setUp {
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    button1.translatesAutoresizingMaskIntoConstraints = NO;
    [button1 setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:1]];
    [button1 setTitle:@"Button1" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    button2.translatesAutoresizingMaskIntoConstraints = NO;
    [button2 setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:1]];
    [button2 setTitle:@"Button2" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [button1 sizeToFit];
    [button2 sizeToFit];
    
    [self.view addSubview:button1];
    [self.view addSubview:button2];
    
    /*
    [button(100@20)]
     
    NSLayoutConstraint's priority
    Priority must be greater than 0
    Priority cannot be higher than NSLayoutPriorityRequired, which is 1000.
     
    value range (0 - 1000]
     
    UILayoutPriorityRequired         1000
    UILayoutPriorityDefaultHigh      750
    UILayoutPriorityDefaultLow       250
    UILayoutPriorityFittingSizeLevel 50
     */
    
    // addConstraints
    NSDictionary *views = @{@"button1": button1,
                            @"button2": button2};
    NSInteger margin = 50;
    NSDictionary *metrics = @{@"sideMargin":@(margin),
                              @"topMargin":@(margin * 0.5 + 64),
                              @"space": @10
                              };
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-sideMargin-[button1(100@1000)]-sideMargin-|"
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-sideMargin-[button2]-sideMargin-|"
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topMargin-[button1]-space-[button2]"
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:views]];
    
}

@end
