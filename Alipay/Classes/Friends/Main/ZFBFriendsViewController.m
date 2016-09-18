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

@interface ZFBFriendsViewController ()<UITableViewDataSource>

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




#pragma mark - dataSource方法的实现

/**
 组
 */
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 2;
    return _friedsList.count;
}
/**
 行
 */
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    if (section == 0) {
//        return 1;
//    }
//    return 3;
    NSArray *sectionData = _friedsList[section];
    return sectionData.count;
}

/**
 cell
 */
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
    [self.view addSubview:tv];
    
//    自动布局
    [tv mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self.view);
    }];
}


@end
