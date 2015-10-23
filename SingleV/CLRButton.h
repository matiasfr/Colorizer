//
//  CLRButton.h
//  SingleV
//
//  Created by Matias Franco on 10/22/15.
//  Copyright © 2015 Matias Franco. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE
@interface CLRButton : UIButton

@property (nonatomic) IBInspectable float borderWidth;
@property (nonatomic) IBInspectable float borderRadius;
@property (nonatomic) UIColor* buttonHighlightColor;
@end
