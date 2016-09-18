//
//  ZFBMomentViewController.m
//  ZFB生活圈
//
//  Created by  chenhanmao on 9/9/16.
//  Copyright © 2016  chenhanmao. All rights reserved.
//

#import "ZFBMomentViewController.h"
#import "ZFBMomentHanderView.h"
#import "ZFBMomentModel.h"
#import "ZFBMomentCell.h"
#import "Masonry.h"

static NSString *cellId = @"cellId";

@interface ZFBMomentViewController ()<UITableViewDataSource>

@end

@implementation ZFBMomentViewController{
//    数据中转
    NSArray <ZFBMomentModel*> *_momentList;
}

//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _momentList.count;
}

//设置cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZFBMomentCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
//    赋值
    cell.model = _momentList[indexPath.row];
    
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    加载数据
    [self loadPlistDota];
//    搭建界面
    [self setupUI];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 加载数据

-(void)loadPlistDota{
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"moment" withExtension:@"plist"];
    
    NSArray *arr = [NSArray arrayWithContentsOfURL:url];
    
    NSMutableArray *arrM = [NSMutableArray array];
    
    for (NSDictionary *dict in arr) {
        ZFBMomentModel *model = [ZFBMomentModel momentWithDict:dict];
        [arrM addObject:model];
    }
    
    _momentList = arrM;
}


#pragma mark - 搭建界面
-(void)setupUI{
    
//    创建UITableView
    UITableView *tv = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tv];
//    注册cell
    [tv registerClass:[ZFBMomentCell class] forCellReuseIdentifier:cellId];
//    数据源
    tv.dataSource = self;
//    预估行高
    tv.estimatedRowHeight = 180;
//    自动调整
    tv.rowHeight = UITableViewAutomaticDimension;
//    隐藏默认的分割线
    tv.separatorStyle = UITableViewCellSeparatorStyleNone;
    
//    设置表头
    ZFBMomentHanderView *hv = [[ZFBMomentHanderView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 180)];
    tv.tableHeaderView = hv;
    
//    自动布局
    [tv mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self.view);
    }];    
}


@end
