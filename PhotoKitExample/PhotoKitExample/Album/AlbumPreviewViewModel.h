//
//  AlbumPreviewViewModel.h
//  XiaoKaWan
//
//  Created by apple_Eric on 7/12/16.
//  Copyright © 2016 不匠科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ShowBigImageViewController.h"
@protocol AlbumPreviewViewModelDelegate <NSObject>

- (void)currentImage:(PHAsset *)imageData;

@end
@interface AlbumPreviewViewModel : NSObject<UIPageViewControllerDelegate,UIPageViewControllerDataSource>
@property(nonatomic,assign) id<AlbumPreviewViewModelDelegate>delegate;
- (instancetype)initWithDataArray:(PHFetchResult *)array andPageController:(UIPageViewController *)pagevc atIndex:(NSInteger)index;
@end
