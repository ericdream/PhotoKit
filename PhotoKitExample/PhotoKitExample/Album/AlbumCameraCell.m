//
//  AlbumCameraCell.m
//  XiaoKaWan
//
//  Created by apple_Eric on 10/10/16.
//  Copyright © 2016 不匠科技. All rights reserved.
//

#import "AlbumCameraCell.h"
#import <Masonry.h>
@implementation AlbumCameraCell
- (void)layoutSubviews{
    [super layoutSubviews];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self.contentView);
    }];
}
- (UIImageView*)imageView
{
    if(_imageView==nil){
        _imageView = [[UIImageView alloc] init];
        _imageView.image = [UIImage imageNamed:@"addImage"];
        [self.contentView addSubview:_imageView];
    }
    return _imageView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
