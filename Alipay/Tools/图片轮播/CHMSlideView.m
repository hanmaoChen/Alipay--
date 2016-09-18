//
//  CHMSlideView.m
//  无限图片轮播
//
//  Created by  chenhanmao on 16/9/17.
//  Copyright © 2016年  chenhanmao. All rights reserved.
//

#import "CHMSlideView.h"
#import "CHMSlideCell.h"
#import "CHMSlideLayout.h"
#import "Masonry.h"
static NSString *rid = @"slide";

#define Section_Count 500

#define Mid_Section_Index Section_Count / 2

@interface CHMSlideView()<UICollectionViewDataSource,UICollectionViewDelegate>

@property(weak,nonatomic)UICollectionView *collectionView;

@end

@implementation CHMSlideView{
    
    NSTimer *_timer;
    NSTimeInterval _timeDuration;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void) awakeFromNib{
    [super awakeFromNib];
    [self setupUI];
}

#pragma mark - 重写setImgUrlList的方法
-(void)setImgUrlList:(NSArray *)imgUrlList{
    _imgUrlList = imgUrlList;
    
    //    重新加载数据
    [_collectionView reloadData];
    
//    让图片滚到中间组
    NSIndexPath *idxPath = [NSIndexPath indexPathForItem:0 inSection:Mid_Section_Index];
    
    [_collectionView scrollToItemAtIndexPath:idxPath atScrollPosition:UICollectionViewScrollPositionNone animated:NO];

//    时间间隔
    _timeDuration = 2;
//    设置计时器
    _timer = [NSTimer timerWithTimeInterval:_timeDuration target:self selector:@selector(nextOne) userInfo:nil repeats:YES];
//    添加计时器
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}


#pragma mark - 自动滚动的方法
- (void)nextOne{
//    获取当前cell的indexPath
    NSIndexPath *idxPath = [self.collectionView indexPathsForVisibleItems].lastObject;
    
    NSInteger item = idxPath.item+1;
    NSInteger section = idxPath.section;
//    判断是否为一组中的最后一张
//    最后一张时，让item为0，section加一
        if (idxPath.item == _imgUrlList.count-1) {
        item = 0;
        section++;
    }
//    赋值到新的indexpath
    NSIndexPath *newIdxPath = [NSIndexPath indexPathForItem:item inSection:section];
    
//    让cell滚动到新的indexpath
    [self.collectionView scrollToItemAtIndexPath:newIdxPath atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
}

-(void)removeFromSuperview{
    [super removeFromSuperview];
//    销毁时钟
    [_timer invalidate];
}

#pragma mark - collectionView的delegate方法
//开始拖动时，暂定计时器
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    _timer.fireDate = [NSDate distantFuture];
}
//结束拖动方法时，开启计时器
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    _timer.fireDate = [NSDate dateWithTimeIntervalSinceNow:_timeDuration];
}


/**
 滚动完成时，判断是否为最后一组或第一组
 */
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//    取出当前位置
    NSIndexPath *idxPath = [self.collectionView indexPathsForVisibleItems].lastObject;
    
//    判断是否滚到了最后一组或第一组
    if (idxPath.section == Section_Count-1 || idxPath.section == 0) {
        
        NSInteger section = Mid_Section_Index;
        NSInteger item = idxPath.item;
        
        NSIndexPath *newIdxPath = [NSIndexPath indexPathForItem:item inSection:section];
        //    偷偷滚回中间
        [self.collectionView scrollToItemAtIndexPath:newIdxPath atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    }
}

/**
 动画滚动完成时,判断是否为最后一张
 */
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
//    直接调用滚动完成是的方法
    [self scrollViewDidEndDecelerating:scrollView];
}

#pragma mark - datasource方法的实现

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return Section_Count;
}
//行
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
//    return 5;
    return _imgUrlList.count;
}
//cell
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CHMSlideCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:rid forIndexPath:indexPath];
    
    cell.imgUrl = _imgUrlList[indexPath.item];
    
    return cell;
    
}

#pragma mark - 搭建界面
- (void)setupUI{
    CHMSlideLayout *layout = [[CHMSlideLayout alloc]init];
    UICollectionView *cv = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    
    cv.dataSource = self;
    cv.delegate = self;
    
    [cv registerClass:[CHMSlideCell class] forCellWithReuseIdentifier:rid];
    
    [self addSubview:cv];
    
//    自动布局
    [cv mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self);
    }];
    _collectionView = cv;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
