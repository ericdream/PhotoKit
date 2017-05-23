//
//  UIColor+color.m
//  PFLivePlayer
//
//  Created by apple_Eric on 31/10/2016.
//  Copyright © 2016 bujiang. All rights reserved.
//

#import "UIColor+color.h"

@implementation UIColor (color)
+ (UIColor *)mainColor{
    return [UIColor p_colorWithHex:0x5790e7];
}

+ (UIColor *)pinkColor{
    return [UIColor p_colorWithHex:0xF64CB1];
}
+ (UIColor *)sexFemaleColor{
    return [UIColor p_colorWithHex:0xFAA4EF];
}
+ (UIColor *)sexMaleColor{
    return [UIColor p_colorWithHex:0xAEC7F2];
}
+ (UIColor *)bgColor{
    return [UIColor p_colorWithHex:0xE9EAEB];
}

+ (UIColor *)yf_blue {
    return [UIColor p_colorWithHex:0x5790e7];
}

+ (UIColor *)yf_red {
    return [UIColor p_colorWithHex:0xf1584a];
}

+ (UIColor *)yf_green {
    return [UIColor p_colorWithHex:0x5ed86e];
}

+ (UIColor *)yf_gray {
    return [UIColor p_colorWithHex:0x7f8b99];
}

+ (UIColor *)yf_lightGray {
    return [UIColor p_colorWithHex:0x1e1e1e];
}

+ (UIColor *)yf_titleColor {
    return [UIColor p_colorWithHex:0x1e1e1e];
}

+ (UIColor *)yf_bodyColor{
    return [UIColor p_colorWithHex:0x565656];
}

+ (UIColor *)yf_boldBodyColor {
    return [UIColor p_colorWithHex:0x0c0c0c];
}

+ (UIColor *)yf_placeHolderColor {
    return [UIColor p_colorWithHex:0xb0b0b0];
}

+ (UIColor *)yf_backgroundGray {
    return [UIColor p_colorWithHex:0xf9f9f9];
}


+ (UIColor *)p_colorWithHex:(unsigned int)rgbValue {
    return [UIColor p_colorWithHex:rgbValue alpha:1.0];
}
+ (UIColor *)p_colorWithHex:(unsigned int)rgbValue alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:(CGFloat) (((rgbValue & 0xFF0000) >> 16) / 255.0) green:(CGFloat) (((rgbValue & 0xFF00) >> 8) / 255.0) blue:(CGFloat) ((rgbValue & 0xFF) / 255.0) alpha:alpha];
}
+ (UIColor *)randomColor {
    NSInteger aRedValue = arc4random() % 255;
    NSInteger aGreenValue = arc4random() % 255;
    NSInteger aBlueValue = arc4random() % 255;
    UIColor *randColor = [UIColor colorWithRed:aRedValue / 255.0f green:aGreenValue / 255.0f blue:aBlueValue / 255.0f alpha:1.0f];
    return randColor;
}
@end
