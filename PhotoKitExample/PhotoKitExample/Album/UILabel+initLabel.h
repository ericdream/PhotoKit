//
//  UILabel+initLabel.h
//  XiaoKaWan
//
//  Created by apple_Eric on 5/12/16.
//  Copyright © 2016 不匠科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (initLabel)
/**
 *  Description
 *
 *  @param font  label font
 *  @param color label text color
 *
 *  @return new label
 */
+(UILabel *)creatLabelWithFont:(CGFloat)font color:(unsigned int)color NS_DEPRECATED_IOS(2_0, 7_0, "creatLabel1WithFont: 替换") __TVOS_PROHIBITED;
+(UILabel *)creatLabel1WithFont:(CGFloat)font color:(UIColor *)color;

@end

