//
//  PFViewController.m
//  PFLivePlayer
//
//  Created by apple_Eric on 30/10/2016.
//  Copyright © 2016 bujiang. All rights reserved.
//

#import "SPViewController.h"
#import <Masonry.h>
@interface SPViewController ()
@property(nonatomic) UITableViewStyle tableStyle;
@end

@implementation SPViewController
- (instancetype)initWithTableStyle:(UITableViewStyle)style
{
    self = [super init];
    _tableStyle = style;
    return self;
}
- (void)rightButtonWithTitle:(NSString *)title{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(rightClick)];
}
- (void)rightButtonWithIconfont:(NSString *)title{
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 50)];
    button.titleLabel.font = [UIFont fontWithName:@"iconfont" size:29];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    // [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 30, 0, 0)];
    [button addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (void)rightClick{

}
- (void)leftButtonWithIconfont:(NSString *)title{
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
    //    button.backgroundColor = [UIColor redColor];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button.titleLabel.font = [UIFont fontWithName:@"iconfont" size:29];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    // [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 30, 0, 0)];
    [button addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (void)leftButtonWithTitle:(NSString *)title{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(leftClick)];
}
- (void)leftClick{

}
#pragma mark - add Table
- (UITableView*)tableView{
    if(_tableView == nil){
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:_tableStyle];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
           make.edges.equalTo(self.view);
        }];
        
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
   
//    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
//    [[UIViewController preferredStatusBarStyle] ]
//    [[UIApplication sharedApplication] pre]
    // self.navigationController.navigationBar.translucent = NO;
    // Do any additional setup after loading the view.
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //    [BJRBITool UmengPageMobBeginWithStr:NSStringFromClass([self class])];
   
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
   
}
- (void)neetLoginNoti:(NSNotification *)noti{
    
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)dealloc{
   
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
