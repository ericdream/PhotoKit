//
//  UIColor+color.h
//  PFLivePlayer
//
//  Created by apple_Eric on 31/10/2016.
//  Copyright © 2016 bujiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (color)
+ (UIColor *)mainColor;
+ (UIColor *)pinkColor;
+ (UIColor *)bgColor;
+ (UIColor *)sexFemaleColor;
+ (UIColor *)sexMaleColor;
+ (UIColor *)p_colorWithHex:(unsigned int)rgbValue;
+ (UIColor *)p_colorWithHex:(unsigned int)rgbValue alpha:(CGFloat)alpha;
+ (UIColor *)randomColor;

+ (UIColor *)yf_blue;
+ (UIColor *)yf_red;
+ (UIColor *)yf_green;
+ (UIColor *)yf_gray;
+ (UIColor *)yf_lightGray;
+ (UIColor *)yf_titleColor;
+ (UIColor *)yf_bodyColor;
+ (UIColor *)yf_boldBodyColor;
+ (UIColor *)yf_placeHolderColor;
+ (UIColor *)yf_backgroundGray;

@end
