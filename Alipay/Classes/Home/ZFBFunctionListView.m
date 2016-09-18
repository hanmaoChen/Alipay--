//
//  ZFBFunctionListView.m
//  Alipay
//
//  Created by  chenhanmao on 16/9/15.
//  Copyright © 2016年  chenhanmao. All rights reserved.
//

#import "ZFBFunctionListView.h"
#import "ZFBFunctionListLayout.h"
#import "HMAdditions.h"
#import "Masonry.h"
#import "ZFBFunctionCell.h"
#import "ZFBADCell.h"

#define Function_Section 3
#define Function_Count 12
static NSString *rid = @"functionList";
static NSString *adRid = @"adCell";

@interface ZFBFunctionListView()<UICollectionViewDataSource>

@end

@implementation ZFBFunctionListView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}


#pragma mark - UICollectionViewDataSource方法的实现
//组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return Function_Section;
}

//行
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0 ) {
        return Function_Count;
    }else if (section == 1){
        return 1;
    }else{
    return _functionList.count-Function_Count;
    }
}

//cell

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    中间广告cell
    if (indexPath.section == 1) {
        ZFBADCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:adRid forIndexPath:indexPath];
        return cell;
    }
//    功能列表cell
    ZFBFunctionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:rid forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    NSInteger item = indexPath.item;
    
    if (indexPath.section == 2){
        item += Function_Count;
    }
//    赋值
    cell.model = _functionList[item];
    return cell;
}

#pragma mark - 搭建界面
- (void)setupUI{
//    创建UIcollectionview
    
    ZFBFunctionListLayout *flowLayout = [[ZFBFunctionListLayout alloc]init];
    UICollectionView *cv = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:flowLayout];
    
    cv.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
//    注册cell
    [cv registerClass:[ZFBFunctionCell class] forCellWithReuseIdentifier:rid];
    [cv registerClass:[ZFBADCell class] forCellWithReuseIdentifier:adRid];
    
    cv.dataSource = self;
    
    [self addSubview:cv];
    
//    设置布局
    [cv mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self);
    }];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
