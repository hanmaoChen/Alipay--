//
//  ZFBNavigationController.m
//  Alipay
//
//  Created by  chenhanmao on 16/9/15.
//  Copyright © 2016年  chenhanmao. All rights reserved.
//

#import "ZFBNavigationController.h"
#import "HMAdditions.h"
@interface ZFBNavigationController ()

@end

@implementation ZFBNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//让状态栏变亮
- (UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;
}

#pragma mark - 设置导航栏信息
- (void)setupUI{
    
//    导航栏颜色
    self.navigationBar.barTintColor = [UIColor hm_colorWithHex:0x3a3a3a];
//    取消半透明效果
    self.navigationBar.translucent = NO;
    
    
//    取消导航栏分隔线
//    1、设置shadowImage图像为空
    self.navigationBar.shadowImage = [[UIImage alloc]init];
//    2、设置背景图像为空
    [self.navigationBar setBackgroundImage:[[UIImage alloc]init]forBarMetrics:UIBarMetricsDefault];
    
//    设置导航栏字体颜色
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};

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
