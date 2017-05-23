//
//  SelectResultViewModel.m
//  XiaoKaWan
//
//  Created by apple_Eric on 7/12/16.
//  Copyright © 2016 不匠科技. All rights reserved.
//

#import "SelectResultViewModel.h"
#import "PhotoSelectBar.h"
#import "PhotoObject.h"
#import "HUDProgress.h"
#define kThumb 200
@implementation SelectResultViewModel{
    PhotoSelectBar *selectBar;
    NSArray *imageList;
}
- (void)getPhotoSelectBar:(PhotoSelectBar *)view{
    selectBar = view;
}
#pragma makr - PhotoAlbumViewModelDelegate
- (void)selectImages:(NSArray<PHAsset *> *)images{
    imageList = images;
    [selectBar setNumber:images.count];
    if(images.count>0){
        selectBar.seletButton.numberLb.hidden = NO;
        selectBar.seletButton.enabled = YES;
//        [UIView animateWithDuration:0.3 animations:^{
//        selectBar.transform = CGAffineTransformMakeTranslation(0, -44);
//        }];
    }else{
        selectBar.seletButton.numberLb.hidden = YES;
        selectBar.seletButton.enabled = NO;
//    [UIView animateWithDuration:0.3 animations:^{
//        selectBar.transform= CGAffineTransformIdentity;
//    }];
    }
}
#pragma mark - PhotoSelectBarDelegate
- (void)commitAction{

    [HUDProgress showWithStatus:@"加载中..."];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSMutableArray *imageObjects = [[NSMutableArray alloc] initWithCapacity:imageList.count];
        [imageList enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            PHAsset *asset = obj;
            [imageObjects addObject:[self getImageObjectWithsset:asset]];
        }];
        dispatch_async(dispatch_get_main_queue(), ^{
            [HUDProgress dissMiss];
            [self.delegate selectConfirm:imageObjects];
        });
    });
    
}
- (PhotoObject *)getImageObjectWithsset:(PHAsset*)asset{
   
    PhotoObject *photo = [[PhotoObject alloc] init];
    photo.location = asset.location;
    PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
    options.normalizedCropRect = CGRectMake(0, 0, kThumb, kThumb);
    options.resizeMode = PHImageRequestOptionsResizeModeExact;
    options.synchronous = YES;
    [[PHImageManager defaultManager] requestImageForAsset:asset targetSize:CGSizeMake(kThumb, kThumb) contentMode:PHImageContentModeAspectFill options:options resultHandler:^(UIImage *result, NSDictionary *info) {
        photo.thumbImage = result;
    }];
    PHImageRequestOptions *options1 = [[PHImageRequestOptions alloc] init];
    options1.synchronous = YES;
    options1.networkAccessAllowed = YES;
    [[PHImageManager defaultManager] requestImageForAsset:asset targetSize:CGSizeMake(asset.pixelWidth, asset.pixelHeight) contentMode:PHImageContentModeDefault options:options1 resultHandler:^(UIImage *result, NSDictionary *info) {
        if(result == nil){
            NSLog(@"image nill");
        }
        photo.image = result;
    }];
    return photo;
}
@end
