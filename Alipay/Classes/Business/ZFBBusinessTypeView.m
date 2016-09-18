//
//  ZFBBusinessType.m
//  口碑代码创建
//
//  Created by  chenhanmao on 9/12/16.
//  Copyright © 2016  chenhanmao. All rights reserved.
//

#import "ZFBBusinessTypeView.h"
#import "Masonry.h"
#import "ZFBBusinessCell.h"
#import "ZFBbusinessLayout.h"


static NSString *rid = @"cellId";
@interface ZFBBusinessTypeView()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(weak,nonatomic)UIPageControl *pageControl;
@end


@implementation ZFBBusinessTypeView{
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setupUI];
}

#pragma mark - delegate方法的实现
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat offsetX = scrollView.contentOffset.x;
    CGFloat width = scrollView.bounds.size.width;
    
    //    修改分页指示器的当前图标
    _pageControl.currentPage = offsetX/width+0.5;
}

# pragma mark - datasource方法实现
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.businessList.count;

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ZFBBusinessCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:rid forIndexPath:indexPath];
    cell.business = _businessList[indexPath.row];
    return cell;
}

/**
 导入口碑分类信息
 */
#pragma mark - 导入口碑分类信息
-(NSArray *)loadClassBusinessData{
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"businessType" withExtension:@"plist"];
    NSArray *arr = [NSArray arrayWithContentsOfURL:url];
    NSMutableArray *arrM = [NSMutableArray array];
    for (NSDictionary *dict in arr) {
        ZFBBusinessType *model = [ZFBBusinessType businessWithDict:dict];
        [arrM addObject:model];
    }
    return arrM;
}

# pragma mark - 搭建界面
- (void)setupUI{
    
    ZFBbusinessLayout *flowLayout = [[ZFBbusinessLayout alloc]init];
    UICollectionView *cv = [[UICollectionView alloc]initWithFrame: CGRectZero collectionViewLayout:flowLayout];
   
    [self addSubview:cv];
    
    cv.backgroundColor = [UIColor whiteColor];
    
    cv.showsVerticalScrollIndicator = NO;
    cv.showsHorizontalScrollIndicator = NO;
    
    cv.pagingEnabled = YES;
    
    [cv registerClass:[ZFBBusinessCell class] forCellWithReuseIdentifier:rid];
    
    cv.dataSource = self;
    cv.delegate = self;
    [cv mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self);
    }];
    
    //    添加页码显示器
    UIPageControl *pgc = [[UIPageControl alloc]init];
    
    pgc.numberOfPages = 2;
    pgc.currentPage = 0;
    pgc.currentPageIndicatorTintColor = [UIColor colorWithWhite:0.2 alpha:1];
    pgc.pageIndicatorTintColor = [UIColor colorWithWhite:0.8 alpha:1];
    //    记录控件
    _pageControl = pgc;
    
    [self addSubview:pgc];
    //    添加约束
    //    collection
    [cv mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self);
    }];
    
    //    分页显示器
    [pgc mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.bottom.equalTo(self);
    }];

    self.businessList = [self loadClassBusinessData];
}


@end
