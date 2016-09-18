//
//  ZFBStarLevel.m
//  0908-支付宝口碑
//
//  Created by  chenhanmao on 9/8/16.
//  Copyright © 2016  chenhanmao. All rights reserved.
//

#import "ZFBStarLevel.h"

@implementation ZFBStarLevel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
//代码创建时调用
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    return self;
}

//xib或sb创建时调用
-(void)awakeFromNib{
    [super awakeFromNib];
    [self setupUI];
}


-(void)setStarLevel:(float)starLevel{
    
    _starLevel = starLevel;
//    重置为空心，cell的复用bug
    for (UIImageView *iv in self.subviews) {
        iv.image = [UIImage imageNamed:@"empty_star"];
    }
//    全星的个数
    NSInteger fullStarCount = starLevel;
    
    for (NSInteger i = 0; i<fullStarCount; i++) {
        UIImageView *iv = self.subviews[i];
        iv.image = [UIImage imageNamed:@"full_star"];
    }
//    是否有半星
    if (starLevel-fullStarCount>0) {
        UIImageView *iv = self.subviews[fullStarCount];
        iv.image = [UIImage imageNamed:@"half_star"];
    }
}


#pragma mark - 搭建星星界面
-(void)setupUI{
    NSUInteger count = 5;
    for (NSUInteger i = 0; i<count; i++) {
        UIImageView *iv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"empty_star"]];

        iv.frame = CGRectOffset(iv.bounds, i*iv.bounds.size.width, 0);
        [self addSubview:iv];
        
    }
    
    
}
@end
