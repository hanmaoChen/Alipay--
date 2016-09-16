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

static NSString *rid = @"functionList";
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
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _functionList.count;
    
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ZFBFunctionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:rid forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    
    cell.model = _functionList[indexPath.item];
    
    return cell;
    
}

#pragma mark - 搭建界面
- (void)setupUI{
//    创建UIcollectionview
    
    ZFBFunctionListLayout *flowLayout = [[ZFBFunctionListLayout alloc]init];
    UICollectionView *cv = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:flowLayout];
    
    cv.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    
    [cv registerClass:[ZFBFunctionCell class] forCellWithReuseIdentifier:rid];
    
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
