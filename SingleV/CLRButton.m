//
//  CLRButton.m
//  SingleV
//
//  Created by Matias Franco on 10/22/15.
//  Copyright © 2015 Matias Franco. All rights reserved.
//

#import "CLRButton.h"

@implementation CLRButton
-(instancetype) init {
    self = [super init];
    if(self) {
        _borderWidth = 1.0;
        _borderRadius = 1.0;
    }
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    self.layer.borderWidth = self.borderWidth;
    self.layer.cornerRadius = self.borderRadius;
    self.layer.borderColor = self.tintColor.CGColor;
    [self setTitleColor:self.tintColor forState:(UIControlStateNormal)];
    [self setTitleColor:self.buttonHighlightColor forState:UIControlStateHighlighted];
}

-(void) setBorderWidth:(float)borderWidth {
    _borderWidth = borderWidth;
    [self setNeedsLayout];
}

-(void) setBorderRadius:(float)borderRadius {
    _borderRadius = borderRadius;
    [self setNeedsLayout];
}

-(void) setButtonHighlightColor:(UIColor *)buttonHighlightColor {
    _buttonHighlightColor = buttonHighlightColor;
    [self setNeedsLayout];
}

-(void) tintColorDidChange{
    [super tintColorDidChange];
    
    [self setNeedsLayout];
}

-(void) setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    if(highlighted) {
        self.backgroundColor = self.tintColor;
        
    } else {
        self.backgroundColor = [UIColor clearColor];
    }
}
@end
