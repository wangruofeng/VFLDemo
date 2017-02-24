//
//  RFCompleteLineLayoutController.m
//  VFLDemo
//
//  Created by 王若风 on 24/02/2017.
//  Copyright © 2017 王若风. All rights reserved.
//

#import "RFCompleteLineLayoutController.h"

@interface RFCompleteLineLayoutController ()

@end

@implementation RFCompleteLineLayoutController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setUp {
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    button1.translatesAutoresizingMaskIntoConstraints = NO;
    [button1 setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:1]];
    [button1 setTitle:@"Find" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    button2.translatesAutoresizingMaskIntoConstraints = NO;
    [button2 setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:1]];
    [button2 setTitle:@"Find Next" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UITextField *tf = [UITextField new];
    tf.translatesAutoresizingMaskIntoConstraints = NO;
    tf.borderStyle = UITextBorderStyleLine;
    tf.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    [button1 sizeToFit];
    [button2 sizeToFit];
    [tf sizeToFit];
    
    [self.view addSubview:button1];
    [self.view addSubview:button2];
    [self.view addSubview:tf];
    
    // addConstraints
    // [flexibleButton(>=70,<=100)]
    NSDictionary *views = @{@"button1": button1,
                            @"button2": button2,
                            @"textField": tf};
    NSInteger margin = 50;
    NSDictionary *metrics = @{@"sideMargin":@(margin),
                              @"topMargin":@(margin * 0.5 + 64),
                              @"space": @10
                              };
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[button1]-[button2]-[textField(>=20)]-|"
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topMargin-[button1]"
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topMargin-[button2]"
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topMargin-[textField]"
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:views]];
}

@end
