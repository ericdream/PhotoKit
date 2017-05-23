//
//  PostImagePreviewViewController.m
//  XiaoKaWan
//
//  Created by apple_Eric on 7/13/16.
//  Copyright © 2016 不匠科技. All rights reserved.
//

#import "PostImagePreviewViewController.h"
#import "PostImagePreviewViewModel.h"
@interface PostImagePreviewViewController ()<PostImagePreviewViewModelDelegate>
@property(nonatomic,strong)PostImagePreviewViewModel *viewModel;
@property(nonatomic,strong)UIPageViewController *photoPageViewController;
@end

@implementation PostImagePreviewViewController{
    PhotoObject *imageObj;
    NSMutableArray *seletImages;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    imageObj = self.images[self.index];
    seletImages = [NSMutableArray arrayWithArray:self.images];
   if(!self.hiddenDeleteBtn) [self rightButtonWithIconfont:@"\U0000e61d"];
    [self photoPageViewController];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];


}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
   
}
- (void)rightClick{

    NSInteger index = [seletImages indexOfObject:imageObj];
    [seletImages removeObject:imageObj];
    if(self.imageArrayCallBack)self.imageArrayCallBack(seletImages);
    if(seletImages.count == 0){
        [self popViewController];
        return;
    }
    if(index>0 && seletImages.count>0) index--;
    if(index==0 ) index = 0;
    imageObj = seletImages[index];
    [self.viewModel setdataWithImages:seletImages andIndex:index];
    
    
    
}
- (PostImagePreviewViewModel *)viewModel{
    if(_viewModel == nil){
        _viewModel= [[PostImagePreviewViewModel alloc] initWithDataArray:self.images andPageController:_photoPageViewController atIndex:self.index];
        _viewModel.delegate = self;
    }
    return _viewModel;
}
- (UIPageViewController *)photoPageViewController{
    if(_photoPageViewController == nil){
        NSDictionary *option = [NSDictionary dictionaryWithObject:[NSNumber numberWithInt:5] forKey:UIPageViewControllerOptionInterPageSpacingKey];
        _photoPageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:option];
        [self.view addSubview:_photoPageViewController.view];
        _photoPageViewController.dataSource = self.viewModel;
        _photoPageViewController.delegate = self.viewModel;
    }
    return _photoPageViewController;
}
#pragma mark - PostImagePreviewViewModelDelegate
- (void)currentImage:(PhotoObject *)imageData{
    imageObj = imageData;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
