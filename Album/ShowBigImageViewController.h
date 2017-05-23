//
//  ShowBigImageViewController.h
//  XiaoKaWan
//
//  Created by apple_Eric on 7/12/16.
//  Copyright © 2016 不匠科技. All rights reserved.
//

#import "SPViewController.h"
#import <Photos/Photos.h>
@interface ShowBigImageViewController : SPViewController
@property(nonatomic) NSInteger index;
@property(nonatomic,strong) PHAsset *asset;// 参数1（任选1）
@property(nonatomic,strong) UIImage *image;// 参数2 任选1）
@property(nonatomic,copy) NSString *imageUrl;
@end
