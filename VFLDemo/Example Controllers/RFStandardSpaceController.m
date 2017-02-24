//
//  RFStandardSpaceController.m
//  VFLDemo
//
//  Created by 王若风 on 24/02/2017.
//  Copyright © 2017 王若风. All rights reserved.
//

#import "RFStandardSpaceController.h"

@interface RFStandardSpaceController ()

@end

@implementation RFStandardSpaceController

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
    
    
    UITextField *tf = [UITextField new];
    tf.translatesAutoresizingMaskIntoConstraints = NO;
    tf.borderStyle = UITextBorderStyleLine;
    tf.placeholder = @"placeholder";
    [tf sizeToFit];
    
    [self.view addSubview:button];
    [self.view addSubview:tf];
    
    // [button]-[textField]
    // '-' means that standard space,the value is 8.
    
    // addConstraints
    NSDictionary *views = @{@"button": button,
                            @"tf": tf};
    NSInteger margin = 16;
    NSDictionary *metrics = @{@"sideMargin":@(margin),
                              @"topMargin":@(margin + 64)};
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-sideMargin-[button]-[tf]-sideMargin-|"
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topMargin-[button]"
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topMargin-[tf]"
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:views]];
}



@end
