//
//  PhotoSelectBar.h
//  XiaoKaWan
//
//  Created by apple_Eric on 7/11/16.
//  Copyright © 2016 不匠科技. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol PhotoSelectBarDelegate <NSObject>

- (void)commitAction;

@end
@class PhotoSelectButton;
@interface PhotoSelectBar : UIView
@property(nonatomic,strong) PhotoSelectButton *seletButton;
@property(nonatomic) NSInteger number;
@property(nonatomic,weak) id<PhotoSelectBarDelegate>delegate;
@end

@interface PhotoSelectButton : UIButton
@property(nonatomic,strong)UILabel *numberLb;
@property(nonatomic,strong)UILabel *titleLb;
@end