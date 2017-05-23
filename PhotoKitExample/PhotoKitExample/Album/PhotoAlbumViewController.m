//
//  PhotoAlbumViewController.m
//  XiaoKaWan
//
//  Created by apple_Eric on 7/11/16.
//  Copyright © 2016 不匠科技. All rights reserved.
//

#import "PhotoAlbumViewController.h"
#import "PhotoPreviewViewController.h"
#import "SelectResultViewModel.h"
#import "AlertController.h"
#import <AVFoundation/AVFoundation.h>
#import <Masonry.h>
#define spaceWitdh  5.0
#define space
#define kDeviceWidth  [UIScreen mainScreen].bounds.size.width
#define kDeviceHeight [UIScreen mainScreen].bounds.size.height
@interface PhotoAlbumViewController ()<SelectResultViewModelDelegate,PhotoAlbumPreviewDelegate>
@property(nonatomic,strong) UICollectionView *collectionView;
@property(nonatomic,strong) PhotoAlbumViewModel *viewModel;
@property(nonatomic,strong) PhotoSelectBar *selectBar;
@property(nonatomic,strong) SelectResultViewModel *resultViewModel;
@property(nonatomic,weak) id<PhotoAlbumViewModelDelegate>albumDelegate;
@end

@implementation PhotoAlbumViewController
- (instancetype)init{
    if(self = [super init]){
        _limitCount = 9;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self leftButtonWithTitle:@"返回"];
//    PHAuthorizationStatus  status = [PHPhotoLibrary authorizationStatus];
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if(status == PHAuthorizationStatusDenied){
                    AlertController *alertVc = [[AlertController alloc] initWithTitle:@"开启访问相册" message:nil preferredStyle:UIAlertControllerStyleAlert];
                    [alertVc addActionWithTitle:@"设置" handler:^{
                        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                        if ([[UIApplication sharedApplication] canOpenURL:url]) {
                            [[UIApplication sharedApplication] openURL:url];
                        }
                    }];
                    [alertVc addActionWithTitle:@"取消" handler:^{
                        [self dismissViewControllerAnimated:NO completion:nil];
                    }];
                    
                    [self presentViewController:alertVc animated:YES completion:nil];
                }
                
                [self collectionView];
                self.albumDelegate = self.resultViewModel;
            });
    }];
   
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
- (void)leftClick{
    [self.navigationController popViewControllerAnimated:YES];
}
- (UICollectionView*)collectionView{
//    if(_collectionView == nil){
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        CGFloat itmeWidth = (kDeviceWidth-(spaceWitdh * 5.0))/4.0;
        flowLayout.itemSize = CGSizeMake(itmeWidth, itmeWidth);
        flowLayout.minimumLineSpacing = spaceWitdh;
        flowLayout.minimumInteritemSpacing = spaceWitdh;
        flowLayout.sectionInset = UIEdgeInsetsMake(spaceWitdh, spaceWitdh, spaceWitdh+44, spaceWitdh);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight-48) collectionViewLayout:flowLayout];
        [self.view addSubview:_collectionView];
        _collectionView.delegate = self.viewModel;
        _collectionView.dataSource= self.viewModel;
        _collectionView.backgroundColor = [UIColor whiteColor];
//    }
    return _collectionView;
}
- (PhotoAlbumViewModel *)viewModel{
    if(_viewModel == nil){
        _viewModel = [[PhotoAlbumViewModel alloc] initWihCollectionView:_collectionView];
        _viewModel.delegate = self.resultViewModel;
        _viewModel.previewDeleage = self;
    }
     _viewModel.limitCount = self.limitCount;
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
#pragma mark - SelectResultViewModelDelegate
- (void)selectConfirm:(NSArray *)photos{
    if(self.seleltImages)self.seleltImages(photos);
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
   
}
#pragma mark -PhotoAlbumPreviewDelegate
- (void)selectFromTakePhotol{
    if(self.takePhoto)self.takePhoto();
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)selectImages:(PHFetchResult *)images atIndex:(NSInteger)index andSelectImages:(NSMutableArray *)selectImages{
    PhotoPreviewViewController *previewCon = [[PhotoPreviewViewController alloc] init];
    previewCon.selectImages = selectImages;
    previewCon.photoArray = images;
    previewCon.atIndex = index;
    previewCon.limitCount = self.limitCount;
    [self.navigationController pushViewController:previewCon animated:YES];
    __weak typeof(self) weakSelf = self;
    previewCon.selelctImageConfirm = self.seleltImages;
    previewCon.selelctImageCallBack = ^(NSMutableArray *images){
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.viewModel.selectImages = images;
//        [strongSelf.collectionView reloadData];
        [strongSelf.albumDelegate selectImages:images];
    };
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
