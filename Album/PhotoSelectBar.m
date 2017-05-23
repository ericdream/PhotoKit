//
//  PhotoSelectBar.m
//  XiaoKaWan
//
//  Created by apple_Eric on 7/11/16.
//  Copyright © 2016 不匠科技. All rights reserved.
//

#import "PhotoSelectBar.h"
#import "UILabel+initLabel.h"
#import "Masonry.h"
#import "UIColor+color.h"
#define numberWidth 20
#define titleWidth 50
#define selectWidth 60
#define labelHeght 40
@interface PhotoSelectBar ()
@property(nonatomic,strong)UIView *line;
@end
@implementation PhotoSelectBar
- (void)setNumber:(NSInteger)number{
    self.seletButton.numberLb.transform = CGAffineTransformMakeScale(0.8, 0.8);
    [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0.2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.seletButton.numberLb.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
    }];
    self.seletButton.numberLb.text = [NSString stringWithFormat:@"%li",(long)number];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    [self.seletButton mas_makeConstraints:^(MASConstraintMaker *make) {
       make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(self.mas_right).offset(-10);
        make.height.equalTo(@labelHeght);
        make.width.equalTo(@selectWidth);
        
    }];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.equalTo(@0.5);
    }];
}
- (PhotoSelectButton *)seletButton{
    if(_seletButton == nil){
        _seletButton = [[PhotoSelectButton alloc] init];
        [_seletButton addTarget:self action:@selector(commitImage) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_seletButton];
        _seletButton.enabled = NO;
    }
    return _seletButton;
}
- (void)commitImage{
    [self.delegate commitAction];
}
- (UIView *)line{
    if(_line == nil){
        _line = [[UIView alloc] init];
        _line.backgroundColor = [UIColor p_colorWithHex:0xbfbfbf];
        [self addSubview:_line];
    }
    return _line;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

@implementation PhotoSelectButton
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self setNeedsUpdateConstraints];
    }
    return self;
}
- (void)updateConstraints{
    [super updateConstraints];
    [self.numberLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self.mas_left);
        make.height.equalTo(@numberWidth);
        make.width.equalTo(@numberWidth);
    }];
    [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self.numberLb.mas_right).offset(5);
        make.height.equalTo(@labelHeght);
        make.width.equalTo(@titleWidth);
    }];
}
- (UILabel *)titleLb{
    if(_titleLb == nil){
        _titleLb = [UILabel creatLabelWithFont:14 color:0xffda44];
        _titleLb.text =@"完成";
        [self addSubview:_titleLb];
    }
    return _titleLb;
}
- (UILabel*)numberLb{
    if(_numberLb == nil){
        _numberLb = [UILabel creatLabelWithFont:14 color:0xffffff];
        _numberLb.textAlignment = NSTextAlignmentCenter;
        _numberLb.backgroundColor = [UIColor p_colorWithHex:0xffda44];
        _numberLb.layer.cornerRadius = numberWidth/2;
        _numberLb.layer.masksToBounds = YES;
        _numberLb.hidden = YES;
        [self addSubview:_numberLb];
    }
    return _numberLb;
}
@end
