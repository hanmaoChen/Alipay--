//
//  ZFBHomeViewController.m
//  Alipay
//
//  Created by  chenhanmao on 16/9/15.
//  Copyright © 2016年  chenhanmao. All rights reserved.
//

#import "ZFBHomeViewController.h"
#import "ZFBCommonFunctionView.h"
#import "HMAdditions.h"
#import "Masonry.h"
#import "ZFBFunctionListView.h"
@interface ZFBHomeViewController ()

@end

@implementation ZFBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//
- (void)setupUI{
    
//    1、创建常用功能视图
    ZFBCommonFunctionView *vTop = [[ZFBCommonFunctionView alloc]init];
    vTop.backgroundColor = [UIColor hm_colorWithHex:0x3a3a3a];
    
//    给常用功能视图传递数据
    vTop.functionList = [NSArray hm_objectListWithPlistName:@"homeCommonFunctions.plist" clsName:@"ZFBFunctionModel"];
//
    [self.view addSubview:vTop];
    
    
//    2、创建功能视图列表
    ZFBFunctionListView *vBottom = [[ZFBFunctionListView alloc]init];
    vBottom.backgroundColor = [UIColor whiteColor];
    
    vBottom.functionList = [NSArray hm_objectListWithPlistName:@"homeAllFunctions.plist" clsName:@"ZFBFunctionModel"];
    
    [self.view addSubview:vBottom];
    
//    自动布局
//    1)常用功能
    [vTop mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.mas_topLayoutGuide);//要参照头部的辅助布局来定位（如果有导航栏则以导航栏底部开始布局，如果没有则以状态栏底部布局）
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(115);
        
    }];
//    2）功能列表
    [vBottom mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(vTop.mas_bottom);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.mas_bottomLayoutGuide);
    }];
    
    
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
