//
//  ZFBFriendsViewController.m
//  Alipay
//
//  Created by  chenhanmao on 16/9/18.
//  Copyright © 2016年  chenhanmao. All rights reserved.
//

#import "ZFBFriendsViewController.h"
#import "Masonry.h"
#import "ZFBFriendsModel.h"
#import "HMAdditions.h"
#import "ZFBFriendsCell.h"

static NSString *fRid = @"friend";

@interface ZFBFriendsViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ZFBFriendsViewController{
    
    NSArray *_friedsList;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self loadFriendsData];
    
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableView delegate方法（选中cell调用的方法）

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    视觉优化，选中慢慢变淡
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    选中跳转到对于的控制器中
    NSArray *sectionData = _friedsList[indexPath.section];
    NSString *className = [sectionData[indexPath.row] pushVCName];
    
    Class cls = NSClassFromString(className);
    
    UIViewController *vc = [[cls alloc]init];
    
//    添加颜色可以解决跳转卡顿问题
    vc.view.backgroundColor = [UIColor blackColor];
    
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - dataSource方法的实现

// 组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return _friedsList.count;
}

// 行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    NSArray *sectionData = _friedsList[section];
    return sectionData.count;
}

// cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZFBFriendsCell *cell = [tableView dequeueReusableCellWithIdentifier:fRid forIndexPath:indexPath];
    NSArray *friend = _friedsList[indexPath.section];
    cell.friends = friend[indexPath.row];
    return cell;
}


#pragma mark - 加载数据
- (void)loadFriendsData{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"friendsFunction" withExtension:@"plist"];
    NSArray *arr = [NSArray arrayWithContentsOfURL:url];
    
    NSMutableArray *sectionArrM = [NSMutableArray array];
    
    for (NSArray *a in arr) {
        NSMutableArray *rowArrM = [NSMutableArray array];
        for (NSDictionary *dict in a) {
            ZFBFriendsModel *model = [ZFBFriendsModel hm_objectWithDict:dict];
            [rowArrM addObject:model];
        }
        [sectionArrM addObject:rowArrM];
    }
    _friedsList = sectionArrM.copy;
}

#pragma mark -  搭建界面
- (void)setupUI{
    
    UITableView *tv = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    [tv registerClass:[ZFBFriendsCell class] forCellReuseIdentifier:fRid];
    tv.rowHeight = 57;
    tv.dataSource = self;
    tv.delegate = self;
    [self.view addSubview:tv];
  
    //    切换子类控制器时隐藏bar导航栏
    self.hidesBottomBarWhenPushed = YES;
    
//    自动布局
    [tv mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self.view);
    }];
}

@end
