//
//  RFLayoutAnchorController.m
//  VFLDemo
//
//  Created by 王若风 on 24/02/2017.
//  Copyright © 2017 王若风. All rights reserved.
//

#import "RFLayoutAnchorController.h"
#import "RFView.h"

const NSInteger kTopMargin = 64 + 16;
const NSInteger kBottomMargin = 16;

@interface RFLayoutAnchorController ()
@property (nonatomic, strong) RFView *subview;
@end

@implementation RFLayoutAnchorController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setUp {
    
    self.subview = [self randomBgColorView];
    
    [self.view addSubview:self.subview];
    
   
    // 以下两个方法可以达到同样的效果
//    [self useNSLayoutConstraint];
//    [self useUILayoutGuide];
    
    
    // 以下两个方法可以达到同样的效果
    [self useNSLayoutConstraint2];
//    [self useUILayoutGuide2];

    /**** for more information about `NSLayoutAnchor` see https://github.com/oarrabi/OALayoutAnchor ****/
}

- (void)useNSLayoutConstraint {
    
    [NSLayoutConstraint constraintWithItem:self.subview
                                 attribute:NSLayoutAttributeLeading
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeLeadingMargin
                                multiplier:1.0
                                  constant:0.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.subview
                                 attribute:NSLayoutAttributeTrailing
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeTrailingMargin
                                multiplier:1.0
                                  constant:0.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.subview
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeTopMargin
                                multiplier:1.0
                                  constant:0.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.subview
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeBottomMargin
                                multiplier:1.0
                                  constant:0.0].active = YES;
}

- (void)useNSLayoutConstraint2 {
    
    [NSLayoutConstraint constraintWithItem:self.subview
                                 attribute:NSLayoutAttributeLeading
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeLeadingMargin
                                multiplier:1.0
                                  constant:0.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.subview
                                 attribute:NSLayoutAttributeTrailing
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeTrailingMargin
                                multiplier:1.0
                                  constant:0.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.subview
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeTopMargin
                                multiplier:1.0
                                  constant:kTopMargin].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.subview
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeBottomMargin
                                multiplier:1.0
                                  constant:-kBottomMargin].active = YES;
}


- (void)useUILayoutGuide {
    
    // Creating the same constraints using Layout Anchors
    UILayoutGuide *margins = self.view.layoutMarginsGuide;
    
    [self.subview.leadingAnchor constraintEqualToAnchor:margins.leadingAnchor].active = YES;
    [self.subview.trailingAnchor constraintEqualToAnchor:margins.trailingAnchor].active = YES;
    [self.subview.topAnchor constraintEqualToAnchor:margins.topAnchor].active = YES;
    [self.subview.bottomAnchor constraintEqualToAnchor:margins.bottomAnchor].active = YES;
}

- (void)useUILayoutGuide2 {
    
    UILayoutGuide *margins = self.view.layoutMarginsGuide;

    [self.subview.leadingAnchor constraintEqualToAnchor:margins.leadingAnchor].active = YES;
    [self.subview.trailingAnchor constraintEqualToAnchor:margins.trailingAnchor].active = YES;
    [self.subview.topAnchor constraintEqualToAnchor:margins.topAnchor constant:kTopMargin].active = YES;
    [self.subview.bottomAnchor constraintEqualToAnchor:margins.bottomAnchor constant:(-kBottomMargin)].active = YES;
}

@end
