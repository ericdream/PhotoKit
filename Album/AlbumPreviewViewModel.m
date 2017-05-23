//
//  AlbumPreviewViewModel.m
//  XiaoKaWan
//
//  Created by apple_Eric on 7/12/16.
//  Copyright © 2016 不匠科技. All rights reserved.
//

#import "AlbumPreviewViewModel.h"

@implementation AlbumPreviewViewModel{
    PHFetchResult *photoArray;
}
- (instancetype)initWithDataArray:(PHFetchResult *)array andPageController:(UIPageViewController *)pagevc atIndex:(NSInteger)index{
    self = [super init];
    if(self){
        photoArray = array;
        [pagevc setViewControllers:@[[self getControllerAtIndex:index]] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
    }
    return self;
}
- (ShowBigImageViewController *)getControllerAtIndex:(NSInteger)index{
    ShowBigImageViewController *controller = [[ShowBigImageViewController alloc] init];
    controller.asset = photoArray[index];
    controller.index = index;
    return controller;
}
#pragma mark -  UIPageViewControllerDelegate
//- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed{
//    ShowBigImageViewController *controler = (ShowBigImageViewController *)previousViewControllers[0];
//    NSLog(@"%i",controler.index);
//}
//- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers{
//ShowBigImageViewController *controler = (ShowBigImageViewController *)pendingViewControllers[0];
//    NSLog(@"%i",controler.index);
//}
#pragma mark -  UIPageViewControllerDataSource
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    ShowBigImageViewController *controler = (ShowBigImageViewController *)viewController;
    NSInteger index = controler.index;
     [self.delegate currentImage:photoArray[index]];
    if(index<=0)return nil;
    index--;
    return [self getControllerAtIndex:index];
}
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    ShowBigImageViewController *controler = (ShowBigImageViewController *)viewController;
    NSInteger index = controler.index;
     [self.delegate currentImage:photoArray[index]];
    if(index>=photoArray.count-1) return nil;
    index++;
    return [self getControllerAtIndex:index];
}

@end
