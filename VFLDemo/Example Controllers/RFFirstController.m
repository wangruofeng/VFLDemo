//
//  RFFirstController.m
//  VFLDemo
//
//  Created by 王若风 on 24/02/2017.
//  Copyright © 2017 王若风. All rights reserved.
//

#import "RFFirstController.h"
#import "UIColor+RF_Extension.h"
#import "RFView.h"

@interface RFFirstController ()

@end

@implementation RFFirstController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)setUp {
    RFView *view1 = [self randomBgColorView];
    RFView *view2 = [self randomBgColorView];
    
    [self.view addSubview:view1];
    [self.view addSubview:view2];
    
    NSDictionary *views = @{@"view1":view1,
                            @"view2":view2
                            };
    NSDictionary *metrics = @{@"margin":@20,
                              @"topMargin":@(64 + 20)};
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-margin-[view1]-margin-|"
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-margin-[view2]-margin-|"
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topMargin-[view1]-margin-[view2(==view1)]-margin-|"
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:views]];
}

@end
