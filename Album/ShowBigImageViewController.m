//
//  ShowBigImageViewController.m
//  XiaoKaWan
//
//  Created by apple_Eric on 7/12/16.
//  Copyright © 2016 不匠科技. All rights reserved.
//

#import "ShowBigImageViewController.h"
#import <UIImageView+WebCache.h>
@interface ShowBigImageViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *scrollvew;
@property(nonatomic,strong)UIImageView *imageView;
@end

@implementation ShowBigImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self scrollvew];
    if(self.asset != nil){
        [self setImageWithPHAsset:self.asset];
    }else if(self.image != nil){
        [self setImageWithImage:self.image];
    }else{
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:self.imageUrl] placeholderImage:nil];
    }
    self.imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
    tap.numberOfTapsRequired = 2;
    [_imageView addGestureRecognizer:tap];
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
- (void)setImageWithPHAsset:(PHAsset *)asset{
    self.automaticallyAdjustsScrollViewInsets = NO;
    PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
    options.resizeMode = PHImageRequestOptionsResizeModeNone;
    options.synchronous = NO;
    options.networkAccessAllowed = YES;
    CGSize targetSize = CGSizeMake(asset.pixelWidth, asset.pixelHeight);
        //PHImageManagerMaximumSize 原图参数
        [[PHImageManager defaultManager] requestImageForAsset:asset targetSize:targetSize contentMode:PHImageContentModeDefault options:options resultHandler:^(UIImage *result, NSDictionary *info) {
           self.imageView.image = result;
        }];
}
- (void)setImageWithImage:(UIImage *)image{
    self.imageView.image = image;
}
- (void)doubleTap:(UITapGestureRecognizer *)gesture{
    [_scrollvew setZoomScale:2 animated:YES];
}
- (UIScrollView *)scrollvew{
    if(_scrollvew == nil){
        _scrollvew = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        _scrollvew.delegate = self;
        _scrollvew.maximumZoomScale = 2;
        _scrollvew.minimumZoomScale = 1.0;
        _scrollvew.showsHorizontalScrollIndicator = NO;
        _scrollvew.showsVerticalScrollIndicator = NO;
        _scrollvew.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self.view addSubview:_scrollvew];
    }
    return _scrollvew;
}

- (UIImageView *)imageView{
    if(_imageView == nil){
        _imageView = [[UIImageView alloc] initWithFrame:_scrollvew.bounds];
        _imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.backgroundColor = [UIColor clearColor];
        [_scrollvew addSubview:_imageView];
        
    }
    return _imageView;
}
#pragma marl - UIScrollViewDelegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
//    [_scrollvew setZoomScale:3 animated:YES];
    return _imageView;
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
