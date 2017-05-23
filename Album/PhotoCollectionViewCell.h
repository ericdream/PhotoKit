//
//  PhotoCollectionViewCell.h
//  XiaoKaWan
//
//  Created by apple_Eric on 7/11/16.
//  Copyright © 2016 不匠科技. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PhotoCollectionViewCellDelegate <NSObject>

- (void)selectItemAtIndex:(NSIndexPath*)index;

@end
@interface PhotoCollectionViewCell : UICollectionViewCell
@property(nonatomic,weak)id<PhotoCollectionViewCellDelegate>delegate;
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong) UIButton *selectButton;
@property(nonatomic,strong) NSIndexPath *indexPath;

@end

