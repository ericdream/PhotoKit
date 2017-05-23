//
//  PostImagePreviewViewModel.m
//  XiaoKaWan
//
//  Created by apple_Eric on 7/13/16.
//  Copyright © 2016 不匠科技. All rights reserved.
//

#import "PostImagePreviewViewModel.h"
#import "ShowBigImageViewController.h"
#import "PhotoObject.h"
@implementation PostImagePreviewViewModel{
    NSArray *photoArray;
    UIPageViewController *pageViewController;
}
- (instancetype)initWithDataArray:(NSArray *)array andPageController:(UIPageViewController *)pagevc atIndex:(NSInteger)index{
    self = [super init];
    if(self){
        pageViewController = pagevc;
        [self setImages:array withIndex:index];
    }
    return self;
}
- (void)setdataWithImages:(NSArray *)array andIndex:(NSInteger)index{
    [self setImages:array withIndex:index];
}
- (void)setImages:(NSArray *)array withIndex:(NSInteger)index{
    photoArray = array;
    [pageViewController setViewControllers:@[[self getControllerAtIndex:index]] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
}
- (ShowBigImageViewController *)getControllerAtIndex:(NSInteger)index{
    PhotoObject *photo = photoArray[index];
    ShowBigImageViewController *controller = [[ShowBigImageViewController alloc] init];
    
    controller.image = photo.image;
    controller.index = index;
    controller.imageUrl = photo.url;
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
