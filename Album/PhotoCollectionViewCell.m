//
//  PhotoCollectionViewCell.m
//  XiaoKaWan
//
//  Created by apple_Eric on 7/11/16.
//  Copyright © 2016 不匠科技. All rights reserved.
//

#import "PhotoCollectionViewCell.h"
#import "Masonry.h"
#import "UIColor+color.h"
@interface PhotoCollectionViewCell()

@end
@implementation PhotoCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top);
            make.left.equalTo(self.contentView.mas_left);
            make.right.equalTo(self.contentView.mas_right);
            make.bottom.equalTo(self.contentView.mas_bottom);
        }];
        [self.selectButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(0);
            make.height.equalTo(@30);
            make.width.equalTo(@30);
        }];
    }
    return self;
}
- (UIImageView*)imageView
{
    if(_imageView==nil){
        _imageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageView];
    }
    return _imageView;
}
- (UIButton *)selectButton{
    if(_selectButton == nil){
        _selectButton = [[UIButton alloc] init];
        [_selectButton setImage:[UIImage imageNamed:@"noSelectImage"] forState:UIControlStateNormal];
        [_selectButton setImage:[UIImage imageNamed:@"selectImage"] forState:UIControlStateSelected];
        [_selectButton addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_selectButton];
        
    }
    return _selectButton;
}
- (void)selectAction:(UIButton *)button{
    [self.delegate selectItemAtIndex:self.indexPath];
}
@end
