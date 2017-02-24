//
//  RFSecondController.m
//  VFLDemo
//
//  Created by 王若风 on 24/02/2017.
//  Copyright © 2017 王若风. All rights reserved.
//

#import "RFSecondController.h"
#import "RFView.h"

@interface RFSecondController ()

@property (nonatomic, strong) RFView *view1;
@property (nonatomic, strong) RFView *view2;
@property (nonatomic, strong) RFView *view3;

@end

@implementation RFSecondController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setUp];
}

- (void)setUp {
    
    self.view1 = [self randomBgColorView];
    self.view2 = [self randomBgColorView];
    self.view3 = [self randomBgColorView];
    
    [self.view addSubview:self.view1];
    [self.view addSubview:self.view2];
    [self.view addSubview:self.view3];
    
    [self addVFLConstraints];
}

- (void)addVFLConstraints {
    
    NSArray *c = self.view.constraints;
    NSArray *c1 = self.view.constraints;
    NSArray *c2 = self.view.constraints;
    NSArray *c3 = self.view.constraints;
    
    NSLog(@"view.constraints:%@",c);
    NSLog(@"view1.constraints:%@",c1);
    NSLog(@"view2.constraints:%@",c2);
    NSLog(@"view3.constraints:%@",c3);
    
    NSDictionary *views = @{@"view1":self.view1,
                            @"view2":self.view2,
                            @"view3":self.view3
                            };
    NSInteger margin = arc4random_uniform(88);
    NSLog(@"margin:%ld",margin);
    NSDictionary *metrics = @{@"sideMargin":@(margin),
                              @"margin":@(margin),
                              @"topMargin":@(margin + 64)};
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-sideMargin-[view1]-sideMargin-|"
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-sideMargin-[view2]-sideMargin-|"
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-sideMargin-[view3]-sideMargin-|"
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topMargin-[view1]-margin-[view2(==view1)]-margin-[view3(==view1)]-margin-|"
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:views]];
}

- (void)updateViewConstraints {
    [super updateViewConstraints];
    
    NSLog(@"%s",__FUNCTION__);
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    NSLog(@"%s",__FUNCTION__);
}

@end
