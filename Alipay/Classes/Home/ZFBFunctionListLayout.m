//
//  ZFBFunctionListLayout.m
//  Alipay
//
//  Created by  chenhanmao on 16/9/16.
//  Copyright © 2016年  chenhanmao. All rights reserved.
//

#import "ZFBFunctionListLayout.h"

@implementation ZFBFunctionListLayout

-(void)prepareLayout{
    
    [super prepareLayout];
    
    //列数
    int column = 4;
    
    //item的宽和高是相等
    //只要算出宽就行
    CGFloat itemWH = (self.collectionView.bounds.size.width - (column -1) * 1) / column;
    
    self.itemSize = CGSizeMake(itemWH, itemWH);
    
    
    //设置单元格间距
    self.minimumInteritemSpacing = 1;
    
    //设置行间距
    self.minimumLineSpacing = 1;
    
    //禁用滚动条
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    
//    遍历布局
    NSArray *arr = [super layoutAttributesForElementsInRect:rect];
    
//    修改布局
    for (UICollectionViewLayoutAttributes *arrt in arr) {
//        找到需要改的
        if (arrt.indexPath.section == 1) {
            CGRect frame = arrt.frame;
            frame.size.width = self.collectionView.bounds.size.width;
            
            arrt.frame = frame;
            break;//修改完后跳出循环
        }
    }
//    返回
    return arr;
}

@end
