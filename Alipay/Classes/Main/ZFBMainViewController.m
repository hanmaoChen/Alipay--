//
//  ZFBMainViewController.m
//  Alipay
//
//  Created by  chenhanmao on 16/9/15.
//  Copyright © 2016年  chenhanmao. All rights reserved.
//

#import "ZFBMainViewController.h"
#import "ZFBNavigationController.h"

@interface ZFBMainViewController ()

@end

@implementation ZFBMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildViewControllers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


# pragma mark - 添加子控件
- (void)addChildViewControllers{
    NSMutableArray *children = [NSMutableArray array];
//    创建4个子控件
    [children addObject:[self viewControllerWithClsName:@"ZFBHomeViewController" title:@"支付宝" imgName:@"TabBar_HomeBar"]];
    [children addObject:[self viewControllerWithClsName:@"ZFBBusinessViewController" title:@"口碑" imgName:@"TabBar_Businesses"]];
    [children addObject:[self viewControllerWithClsName:@"ZFBFriendsViewController" title:@"朋友" imgName:@"TabBar_Friends"]];
    [children addObject:[self viewControllerWithClsName:@"ZFBMineViewController" title:@"我的" imgName:@"TabBar_Assets"]];
    
//    设置为子控件
    self.viewControllers = children.copy;
}

//创建viewController的方法
- (UIViewController *)viewControllerWithClsName:(NSString *)clsName title:(NSString *)title imgName:(NSString *)imgName{
//    1、创建控制器
    Class cls = NSClassFromString(clsName);
    UIViewController *vc = [[cls alloc]init];
    
//    2、添加图片
    vc.tabBarItem.image = [UIImage imageNamed:imgName];
    
    
    UIImage *imgSel = [UIImage imageNamed:[imgName stringByAppendingString:@"_Sel"]];
//    显示原本的颜色
    vc.tabBarItem.selectedImage = [imgSel imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
//    3、设置文字
    vc.title = title;
   
//    设置nav控制器
    ZFBNavigationController *nvc = [[ZFBNavigationController alloc]initWithRootViewController:vc];
    
    return nvc;
                                   
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
