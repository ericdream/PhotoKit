//
//  PhotoAlbumViewModel.m
//  XiaoKaWan
//
//  Created by apple_Eric on 7/11/16.
//  Copyright © 2016 不匠科技. All rights reserved.
//

#import "PhotoAlbumViewModel.h"
#import "UIImage+Category.h"
#import "AlbumCameraCell.h"
static NSString* const cellID = @"photoCollectionId";
static NSString* const cellCameraId = @"cellCameraId";
#define kThumb 200
@implementation PhotoAlbumViewModel{
    PHFetchResult *assetsFetchResults;
    UICollectionView *_collectionView;
}
- (instancetype)initWihCollectionView:(UICollectionView *)collectionView{
    self = [super init];
    if(self){
        _collectionView = collectionView;
        PHFetchOptions *options = [[PHFetchOptions alloc] init];
        options.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:NO]];
        assetsFetchResults = [PHAsset fetchAssetsWithOptions:options];
        [collectionView registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:cellID];
        [collectionView registerClass:[AlbumCameraCell class] forCellWithReuseIdentifier:cellCameraId];
        _selectImages = [[NSMutableArray alloc] initWithCapacity:0];
        
    }
    return self;
}
- (void)setSelectImages:(NSMutableArray *)selectImages{
    _selectImages = selectImages;
    [_collectionView reloadData];
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return assetsFetchResults.count +1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row ==0){
        AlbumCameraCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellCameraId forIndexPath:indexPath];
        return cell;
    }
     PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
     PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
    options.normalizedCropRect = CGRectMake(0, 0, kThumb, kThumb);
    options.resizeMode = PHImageRequestOptionsResizeModeExact;
    options.synchronous = NO;
    options.networkAccessAllowed = NO;
    cell.indexPath = indexPath;
    cell.delegate = self;
    @synchronized (self) {
        PHAsset *asset = assetsFetchResults[indexPath.row-1];
            PHImageManager *imageManager = [PHImageManager defaultManager];
            [imageManager requestImageForAsset:asset targetSize:CGSizeMake(kThumb, kThumb) contentMode:PHImageContentModeAspectFill options:options resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
                if (result) {
                        if([_selectImages containsObject:asset]){
                            cell.selectButton.selected = YES;
                        }else{
                            cell.selectButton.selected = NO;
                        }
                        cell.imageView.image = result;
                }
                
            }];
    }
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 0){
        [self.previewDeleage selectFromTakePhotol];
    }else [self.previewDeleage selectImages:assetsFetchResults atIndex:indexPath.row-1 andSelectImages:_selectImages];
}
#pragma mark - PhotoCollectionViewCellDelegate
- (void)selectItemAtIndex:(NSIndexPath *)index{
    
    PHAsset *asset = assetsFetchResults[index.row -1];
    if([_selectImages containsObject:asset]){
        [_selectImages removeObject:asset];
    }else{
        if(_selectImages.count>= self.limitCount){
            [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"最多选%li张",(long)self.limitCount]];
            return;
        }
        [_selectImages addObject:asset];
    }
    [_collectionView reloadItemsAtIndexPaths:@[index]];
    if([self.delegate respondsToSelector:@selector(selectImages:)]){
        [self.delegate selectImages:_selectImages];
    }
    

}
@end
