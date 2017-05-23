//
//  PostImagePreviewViewModel.h
//  XiaoKaWan
//
//  Created by apple_Eric on 7/13/16.
//  Copyright © 2016 不匠科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class PhotoObject;
@protocol PostImagePreviewViewModelDelegate <NSObject>

- (void)currentImage:(PhotoObject *)imageData;

@end
@interface PostImagePreviewViewModel : NSObject<UIPageViewControllerDelegate,UIPageViewControllerDataSource>
@property(nonatomic,weak) id<PostImagePreviewViewModelDelegate>delegate;

- (instancetype)initWithDataArray:(NSArray *)array andPageController:(UIPageViewController *)pagevc atIndex:(NSInteger)index;
- (void)setdataWithImages:(NSArray *)array andIndex:(NSInteger)index;
@end
