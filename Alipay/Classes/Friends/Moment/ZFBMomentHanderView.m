//
//  ZFBMomentHanderView.m
//  ZFB生活圈
//
//  Created by  chenhanmao on 9/9/16.
//  Copyright © 2016  chenhanmao. All rights reserved.
//

#import "ZFBMomentHanderView.h"
#import "Masonry.h"
#import "HMAdditions.h"

@implementation ZFBMomentHanderView

//代码创建强制调用的方法
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    
    [self setupUI];
}

-(void)setupUI{
//    0.背景颜色方便调试
//    self.backgroundColor = [UIColor orangeColor];
    
//    1.添加控件

    //    1）现场标签
    UILabel *label = [UILabel hm_labelWithText:@"现场" fontSize:13 color:[UIColor grayColor]];
                      
    [self addSubview:label];

    //    2）大图
    UIImageView *igv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"default_nearby_scene"]];
    
    [self addSubview:igv];

    //    3）朋友动态标签
    UILabel *plabel = [UILabel hm_labelWithText:@"朋友动态" fontSize:13 color:[UIColor grayColor]];
    
    [self addSubview:plabel];
    
    
//    2.自动布局
//    现场
    CGFloat margin = 8;
    CGFloat tMargin = 16;
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self).offset(margin);
        make.top.equalTo(self).offset(tMargin);
    }];
//    大图
    [igv mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(label);
        make.right.equalTo(self).offset(-margin);
        make.top.equalTo(label.mas_bottom).offset(tMargin);
        make.height.mas_equalTo(98);
    }];
//    朋友动态
    [plabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(label);
        make.top.equalTo(igv.mas_bottom).offset(tMargin);
    }];
    
    
}
@end
