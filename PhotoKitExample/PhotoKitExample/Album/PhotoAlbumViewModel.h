//
//  PhotoAlbumViewModel.h
//  XiaoKaWan
//
//  Created by apple_Eric on 7/11/16.
//  Copyright © 2016 不匠科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PhotoCollectionViewCell.h"
#import <Photos/Photos.h>
@protocol PhotoAlbumViewModelDelegate <NSObject>

- (void)selectImages:(NSArray<PHAsset*> *)images;

@end
@protocol PhotoAlbumPreviewDelegate <NSObject>

- (void)selectImages:(PHFetchResult *)images atIndex:(NSInteger)index andSelectImages:(NSMutableArray *)selectImages;
- (void)selectFromTakePhotol;

@end
@interface PhotoAlbumViewModel : NSObject<UICollectionViewDelegate,UICollectionViewDataSource,PhotoCollectionViewCellDelegate>
- (instancetype)initWihCollectionView:(UICollectionView *)collectionView;
@property(nonatomic,weak) id<PhotoAlbumViewModelDelegate>delegate;
@property(nonatomic,weak) id<PhotoAlbumPreviewDelegate>previewDeleage;
@property(nonatomic,strong) NSMutableArray *selectImages;
@property(nonatomic) NSInteger limitCount;
@end

