//
//  UIColor+Lightness.m
//  SingleV
//
//  Created by Matias Franco on 10/23/15.
//  Copyright © 2015 Matias Franco. All rights reserved.
//

#import "UIColor+Lightness.h"

@implementation UIColor (Lightness)

- (CGFloat)lightness {
    CGFloat r,g,b,a;
    [self getRed:&r green:&g blue:&b alpha:&a];
    float luminence = 0.2126*(r) + 0.7152*(g) + 0.0722*(b);
    return luminence;
}
@end
