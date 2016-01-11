//
//  KHFlatButton.h
//
//  Created by Kyle Horn on 10/7/13.
//  Copyright (c) 2013 Kyle Horn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KHFlatButton : UIButton

@property (nonatomic) CGFloat cornerRadius;

+ (KHFlatButton *)buttonWithFrame:(CGRect)frame withTitle:(NSString *)title backgroundColor:(UIColor *)backgroundColor cornerRadius:(CGFloat)radius;

// Factory method that returns a button with default corner radius of 3.0
+ (KHFlatButton *)buttonWithFrame:(CGRect)frame withTitle:(NSString *)title backgroundColor:(UIColor *)backgroundColor;

+ (UIBarButtonItem *)barButtonWithTitle:(NSString *)title backgroundColor:(UIColor *)backgroundColor;

@end
