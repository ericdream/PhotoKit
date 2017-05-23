//
//  PFViewController.h
//  PFLivePlayer
//
//  Created by apple_Eric on 30/10/2016.
//  Copyright © 2016 bujiang. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface SPViewController : UIViewController
- (instancetype)initWithTableStyle:(UITableViewStyle)style;
@property(nonatomic,strong) UITableView *tableView;
- (void)rightButtonWithIconfont:(NSString *)title;
- (void)rightButtonWithTitle:(NSString *)title;

- (void)rightClick;

/**
 left button

 @param title title description
 */
- (void)leftButtonWithIconfont:(NSString *)title;
- (void)leftButtonWithTitle:(NSString *)title;
- (void)leftClick;




@end
