//
//  PhotoPreviewViewController.m
//  XiaoKaWan
//
//  Created by apple_Eric on 7/12/16.
//  Copyright © 2016 不匠科技. All rights reserved.
//

#import "PhotoPreviewViewController.h"
#import "UIColor+color.h"
#import "PhotoSelectBar.h"
#import "SelectResultViewModel.h"
//#import "AddPostVViewController.h"
#import <Masonry.h>
@interface PhotoPreviewViewController ()<AlbumPreviewViewModelDelegate,SelectResultViewModelDelegate>
@property(nonatomic,strong)UIPageViewController *photoPageViewController;
@property(nonatomic,strong)AlbumPreviewViewModel *viewModel;
@property(nonatomic,strong)PhotoSelectBar *selectBar;
@property(nonatomic,strong) SelectResultViewModel *resultViewModel;
@property(nonatomic,weak)id<PhotoAlbumViewModelDelegate>delegate;
@end

@implementation PhotoPreviewViewController
{
    UIButton * rightButon;
    PHAsset *currentImage;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    currentImage = _photoArray[self.atIndex];
    [self rightButonTitle];
    [self photoPageViewController];
    self.delegate = self.resultViewModel;
    [self.delegate selectImages:_selectImages];
    // Do any additional setup after loading the view.
}


- (void)rightButonTitle{
   
   rightButon = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [rightButon setImage:[UIImage imageNamed:@"noSelectImage"] forState:UIControlStateNormal];
    [rightButon setImage:[UIImage imageNamed:@"selectImage"] forState:UIControlStateSelected];
    [rightButon addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButon];
    if([_selectImages containsObject:currentImage]) rightButon.selected = YES;
}
- (void)rightClick{
    
    if([_selectImages containsObject:currentImage]){
        [_selectImages removeObject:currentImage];
        rightButon.selected = NO;
    }else{
        if(_selectImages.count>= self.limitCount){
            [HUDProgress showErrorWithStatus:[NSString stringWithFormat:@"最多选择%li张",(long)self.limitCount]];
            return;
        }
         [_selectImages addObject:currentImage];
        rightButon.selected = YES;
    }
    [self.delegate selectImages:_selectImages];
    if(self.selelctImageCallBack)self.selelctImageCallBack(_selectImages);
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
- (AlbumPreviewViewModel *)viewModel{
    if(_viewModel == nil){
        _viewModel = [[AlbumPreviewViewModel alloc] initWithDataArray:self.photoArray andPageController:_photoPageViewController atIndex:self.atIndex];
        _viewModel.delegate = self;
    }
    return _viewModel;
}
- (SelectResultViewModel *)resultViewModel{
    if(_resultViewModel == nil){
        _resultViewModel = [[SelectResultViewModel alloc] init];
        _resultViewModel.delegate = self;
        [_resultViewModel getPhotoSelectBar:self.selectBar];
    }
    return _resultViewModel;
}
- (PhotoSelectBar *)selectBar{
    if(_selectBar == nil){
        _selectBar = [[PhotoSelectBar alloc] initWithFrame:CGRectMake(0, kDeviceHeight-44, kDeviceWidth, 44)];
        _selectBar.backgroundColor = [UIColor whiteColor];
        _selectBar.delegate = _resultViewModel;
        [self.view addSubview:_selectBar];
        [_selectBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self.view);
            make.height.equalTo(@44);
        }];
    }
    return _selectBar;
}
#pragma mark - AlbumPreviewViewModelDelegate
- (void)currentImage:(PHAsset *)imageData{
    currentImage = imageData;
    if([_selectImages containsObject:imageData]){
       rightButon.selected = YES;
    }else{
        rightButon.selected = NO;
    }
}
#pragma mark - SelectResultViewModelDelegate
- (void)selectConfirm:(NSArray *)photos{
    if(self.selelctImageConfirm)self.selelctImageConfirm(photos);
    [self dismissViewControllerAnimated:YES completion:nil];
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
