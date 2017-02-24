//
//  UIColor+RF_Extension.m
//  VFLDemo
//
//  Created by 王若风 on 24/02/2017.
//  Copyright © 2017 王若风. All rights reserved.
//

#import "UIColor+RF_Extension.h"

@implementation UIColor (RF_Extension)

+ (UIColor *)randomColor
{
    return [UIColor colorWithRed:arc4random_uniform(255)/255.0
                           green:arc4random_uniform(255)/255.0
                            blue:arc4random_uniform(255)/255.0
                           alpha:1];
}

@end
