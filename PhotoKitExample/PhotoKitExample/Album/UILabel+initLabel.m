//
//  UILabel+initLabel.m
//  XiaoKaWan
//
//  Created by apple_Eric on 5/12/16.
//  Copyright © 2016 不匠科技. All rights reserved.
//

#import "UILabel+initLabel.h"
#import "UIColor+color.h"
@implementation UILabel (initLabel)
+(UILabel *)creatLabelWithFont:(CGFloat)font color:(unsigned int)color
{
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:font];
    label.textColor = [UIColor p_colorWithHex:color];
     label.numberOfLines = 0;
    return label;
}
+(UILabel *)creatLabel1WithFont:(CGFloat)font color:(UIColor *)color
{
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:font];
    label.textColor = color;
    label.numberOfLines = 0;
    return label;
}
@end
