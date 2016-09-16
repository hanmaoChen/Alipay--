//
//  ZFBFunctionCell.m
//  Alipay
//
//  Created by  chenhanmao on 16/9/16.
//  Copyright © 2016年  chenhanmao. All rights reserved.
//

#import "ZFBFunctionCell.h"
#import "HMAdditions.h"
#import "Masonry.h"

@interface ZFBFunctionCell()

@property(weak,nonatomic)UIButton *fuctionButton;
@end

@implementation ZFBFunctionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}


- (void)setModel:(ZFBFunctionModel *)model{
    
    _model = model;
    
    NSAttributedString *att = [NSAttributedString hm_imageTextWithImage:[UIImage imageNamed:model.icon] imageWH:25 title:model.name fontSize:13 titleColor:[UIColor hm_colorWithHex:0x2e2e2e] spacing:8];
    [self.fuctionButton setAttributedTitle:att forState:UIControlStateNormal];
    
}

#pragma mark - 搭建界面
- (void)setupUI{
//    创建UIButton
    UIButton *btn = [[UIButton alloc]init];
    [self addSubview:btn];
    
//    图文混排
    NSAttributedString *att = [NSAttributedString hm_imageTextWithImage:[UIImage imageNamed:@"09999976"] imageWH:25 title:@"生活缴费" fontSize:13 titleColor:[UIColor hm_colorWithHex:0x2e2e2e] spacing:8];
    [btn setAttributedTitle:att forState:UIControlStateNormal];
//    允许多行
    btn.titleLabel.numberOfLines = 0;
//    文字居中
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    
//    设置自动布局
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self);
    }];
    
    self.fuctionButton = btn;
    
    
    
}

@end
