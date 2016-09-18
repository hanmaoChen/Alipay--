//
//  CHMSlideCell.m
//  无限图片轮播
//
//  Created by  chenhanmao on 16/9/17.
//  Copyright © 2016年  chenhanmao. All rights reserved.
//

#import "CHMSlideCell.h"

@implementation CHMSlideCell{
    UIImageView *_imageView;
}

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


/**
 重写setImgUrl的方法
 */
-(void)setImgUrl:(NSURL *)imgUrl{
    
    _imgUrl = imgUrl;
    
//    加载图片
    NSData *imgDate = [NSData dataWithContentsOfURL:imgUrl];
    UIImage *img = [UIImage imageWithData:imgDate];
    
    _imageView.image = img;
    
}

#pragma mark - 搭建界面
- (void)setupUI{
    
    UIImageView *iv = [[UIImageView alloc]initWithFrame:self.contentView.bounds];
    
    [self.contentView addSubview:iv];
    
     _imageView = iv;
    
}
@end
