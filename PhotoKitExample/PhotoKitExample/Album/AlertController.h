//
//  AlertController.h
//  XiaoKaWan
//
//  Created by apple_Eric on 7/30/16.
//  Copyright © 2016 不匠科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlertController : UIAlertController
/**
 *  默认格式
 *
 *  @param title          title description
 *  @param message        message description
 *  @param preferredStyle preferredStyle description
 *  @param titles         titles description
 *  @param index          index description
 *
 *  @return return value description
 */
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle withTitles:(NSArray<NSString *>*)titles handler:(void(^)(NSInteger index))index;
/**
 *  自定义 特定格式
 *
 *  @param title          title description
 *  @param message        message description
 *  @param preferredStyle preferredStyle description
 *
 *  @return return value description
 */
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle;
/**
 *  自定义添加action
 *
 *  @param title   title description
 *  @param handler handler description
 */
- (void)addActionWithTitle:(NSString *)title handler:(void(^)())handler;
- (void)addDestructiveActionWithTitle:(NSString *)title handler:(void(^)())handler;
- (void)addCancleActionHandlerWithTitle:(NSString *)title andHandler:(void(^)())handler;
- (void)addCancleActionHandler:(void(^)())handler;
- (void)showWith:(UIViewController *)controller;
@end
