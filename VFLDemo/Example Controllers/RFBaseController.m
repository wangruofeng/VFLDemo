//
//  RFBaseController.m
//  VFLDemo
//
//  Created by 王若风 on 24/02/2017.
//  Copyright © 2017 王若风. All rights reserved.
//

#import "RFBaseController.h"
#import "RFView.h"
#import "UIColor+RF_Extension.h"

@interface RFBaseController ()

@end

@implementation RFBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setUp];
}

- (RFView *)randomBgColorView {
    
    RFView *view = [RFView new];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    view.backgroundColor = [UIColor randomColor];
    
    return view;
}

/**
 overwrite
 */
- (void)setUp {};

@end
