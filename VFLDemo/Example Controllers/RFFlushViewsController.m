//
//  RFFlushViewsController.m
//  VFLDemo
//
//  Created by 王若风 on 24/02/2017.
//  Copyright © 2017 王若风. All rights reserved.
//

#import "RFFlushViewsController.h"
#import "RFView.h"

@interface RFFlushViewsController ()

@property (nonatomic, strong) RFView *view1;
@end

@implementation RFFlushViewsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setUp {
  
    self.view1 = [self randomBgColorView];
    RFView *view2 = [self randomBgColorView];
    RFView *view3 = [self randomBgColorView];


    [self.view addSubview:self.view1];
    [self.view addSubview:view2];
    [self.view addSubview:view3];
    

    
    // addConstraints
    // [view1][view2]
    NSDictionary *views = @{@"view1": self.view1,
                            @"view2": view2,
                            @"view3": view3};
    
    NSDictionary *metrics = @{@"topMargin":@(20 + 64),
                              @"space": @10
                              };
    
    // leadingMargin and trailingMargin default value is 16.
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[view1][view2(==view1)][view3(==view1)]-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    
    NSLog(@"%@",self.view.constraints);
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topMargin-[view1(44)]"
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topMargin-[view2(66)]"
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topMargin-[view3(88)]"
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:views]];
    
    NSLog(@"frame:%@",NSStringFromCGRect(self.view1.frame));
    //frame:{{0, 0}, {0, 0}}
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    NSLog(@"frame:%@",NSStringFromCGRect(self.view1.frame));
    
    // frame:{{16, 84}, {114.5, 44}}
}

@end
