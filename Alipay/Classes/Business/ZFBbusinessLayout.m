//
//  ZFBbusinessLayout.m
//  口碑代码创建
//
//  Created by  chenhanmao on 9/12/16.
//  Copyright © 2016  chenhanmao. All rights reserved.
//

#import "ZFBbusinessLayout.h"
#import "Masonry.h"

@implementation ZFBbusinessLayout

- (void)prepareLayout{
    
    [super prepareLayout];
    
    CGFloat width = self.collectionView.bounds.size.width*0.25;
    CGFloat height = self.collectionView.bounds.size.height*0.5;
    
    self.itemSize = CGSizeMake(width, height);
    
    self.minimumLineSpacing = 0;
    
    self.minimumInteritemSpacing = 0;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    
    
}
@end
