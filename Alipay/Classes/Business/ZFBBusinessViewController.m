//
//  ZFBBusinessController.m
//  0908-支付宝口碑
//
//  Created by  chenhanmao on 9/8/16.
//  Copyright © 2016  chenhanmao. All rights reserved.
//

#import "ZFBBusinessViewController.h"
#import "ZFBBusinessStore.h"
#import "ZFBStoreCell.h"
#import "Masonry.h"
#import "ZFBBusinessTypeView.h"
#import "ZFBBusinessType.h"

static NSString *rid = @"cellId";
@interface ZFBBusinessViewController ()<UITableViewDataSource>

@property(weak,nonatomic)UITableView *tableView;

@end

@implementation ZFBBusinessViewController{
    NSArray <ZFBBusinessStore *> *_storeList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self setupClassUI];
    [self setupUI];
//    加载数据
    [self loadStoreDate];
//    设置表头
    [self setTableHander];
//    设置表尾
    [self setTableFooter];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//设置组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return _storeList.count;
    return 3;
}

//设置行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _storeList.count;
}

//设置cell的属性
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZFBStoreCell *cell = [tableView dequeueReusableCellWithIdentifier:rid forIndexPath:indexPath];
    
//    传值
    cell.store = _storeList[indexPath.row];
    
    return cell;
}

#pragma mark - 设置表头
-(void)setTableHander{
   
//    读取xib文件
    UINib *nib = [UINib nibWithNibName:@"ZFBHanderView" bundle:nil];
    UIView *hander = [nib instantiateWithOwner:nil options:nil].lastObject;
    
//    设置表头属性
    CGFloat oldWidth = hander.frame.size.width;
    CGFloat oldHigth = hander.frame.size.height;
    CGFloat newWidth = self.view.bounds.size.width;
    CGFloat newHigth = oldHigth*newWidth/oldWidth;
    
    hander.frame = CGRectMake(0, 0, 0, newHigth);
    
    self.tableView.tableHeaderView = hander;
}


# pragma mark - 设置表尾
-(void)setTableFooter{
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    btn.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
//    设置文字样式
    [btn setTitle:@"加载更多" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    self.tableView.tableFooterView = btn;
    
}

# pragma mark - 导入数据
/**
 导入商店数据
 */
-(void)loadStoreDate{
    
    NSURL *url = [[NSBundle mainBundle]URLForResource:@"business" withExtension:@"plist"];
    NSArray *arr = [NSArray arrayWithContentsOfURL:url];
    NSMutableArray *arrM = [NSMutableArray array];
    for (NSDictionary *dict in arr) {
        ZFBBusinessStore *store = [ZFBBusinessStore businessWithDict:dict];
        [arrM addObject:store];
    }
    _storeList = arrM;
}

///**
// 导入口碑分类信息
// */
//-(NSArray *)loadClassBusinessData{
//    
//    NSURL *url = [[NSBundle mainBundle] URLForResource:@"businessType" withExtension:@"plist"];
//    NSArray *arr = [NSArray arrayWithContentsOfURL:url];
//    NSMutableArray *arrM = [NSMutableArray array];
//    for (NSDictionary *dict in arr) {
//        ZFBBusinessType *model = [ZFBBusinessType businessWithDict:dict];
//        [arrM addObject:model];
//    }
//    return arrM;
//}

//#pragma mark - 搭建分类界面
//- (void)setupClassUI{
//    ZFBBusinessTypeView *bt = [[ZFBBusinessTypeView alloc]init];
//    
//    bt.backgroundColor = [UIColor grayColor];
//    [self.view addSubview:bt];
//    bt.businessList = [self loadClassBusinessData];
//    //    约束
//    [bt mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.left.right.equalTo(self.view);
//        make.top.equalTo(self.view);
//        make.height.mas_equalTo(130);
//        
//    }];
//    
//}
#pragma mark - 搭建界面
- (void)setupUI{
    
//    创建tableView
    UITableView *tv = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    tv.rowHeight = 110;
    
    tv.dataSource = self;
    //    读取xib文件
    UINib *nib = [UINib nibWithNibName:@"BusinessStore" bundle:nil];
    
    [tv registerNib:nib forCellReuseIdentifier:rid];
    
    [self.view addSubview:tv];
    _tableView = tv;
    
//   tableView的约束
    [tv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];

}
@end
