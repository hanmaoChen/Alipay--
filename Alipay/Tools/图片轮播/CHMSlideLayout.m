//
//  CHMSlideLayout.m
//  无限图片轮播
//
//  Created by  chenhanmao on 16/9/17.
//  Copyright © 2016年  chenhanmao. All rights reserved.
//

#import "CHMSlideLayout.h"

@implementation CHMSlideLayout


- (void)prepareLayout{
    [super prepareLayout];
    
//    尺寸
    self.itemSize = self.collectionView.bounds.size;
//    单元格行间隔
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
//    滚动方向
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//    滚动条
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
//    分页
    self.collectionView.pagingEnabled = YES;
//    弹簧效果
    self.collectionView.bounces = NO;
    
    
}

@end
