//
//  ZFBCommonFunctionView.m
//  Alipay
//
//  Created by  chenhanmao on 16/9/15.
//  Copyright © 2016年  chenhanmao. All rights reserved.
//

#import "ZFBCommonFunctionView.h"
#import "Masonry.h"
#import "HMAdditions.h"
#import "ZFBFunctionModel.h"

@implementation ZFBCommonFunctionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setFunctionList:(NSArray *)functionList{
    
    _functionList = functionList;
    
    for (int i = 0; i < functionList.count; i++) {
        
        //取出当前遍历到的button
        UIButton *btn = self.subviews[i];
        
        //取出数据数组里当前对应的数据
        ZFBFunctionModel *model = functionList[i];
        
        //创建上下图文混排的属性文本
        NSAttributedString *attrStr = [NSAttributedString hm_imageTextWithImage:[UIImage imageNamed:model.icon] imageWH:35 title:model.name fontSize:14 titleColor:[UIColor whiteColor] spacing:8];
        
        //把属性文本设置button
        [btn setAttributedTitle:attrStr forState:UIControlStateNormal];
    }
}

#pragma mark - 搭建界面
- (void)setupUI{
//    创建4个button
    UIButton *scan = [self getButtonWithTitle:@"扫一扫" imgName:@"home_scan"];
    [self addSubview:scan];
    
    UIButton *pay = [self getButtonWithTitle:@"扫一扫" imgName:@"home_scan"];
    [self addSubview:pay];
    
    UIButton *card = [self getButtonWithTitle:@"扫一扫" imgName:@"home_scan"];
    [self addSubview:card];
    
    UIButton *xiuxiu = [self getButtonWithTitle:@"扫一扫" imgName:@"home_scan"];
    [self addSubview:xiuxiu];
    
//    设置自动布局
    [self.subviews mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.bottom.equalTo(self);
        
    }];
    
    [scan mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self);
    }];
    
    [pay mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(scan.mas_right);
        make.width.equalTo(scan);
    }];
    
    [card mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(pay.mas_right);
        make.width.equalTo(pay);
    }];
    
    [xiuxiu mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(card.mas_right);
        make.right.equalTo(self);
        make.width.equalTo(card);
    }];
}


//创建button的方法
- (UIButton *)getButtonWithTitle:(NSString *)title imgName:(NSString *)imgName{
    UIButton *btn = [[UIButton alloc]init];
    
//    图文混排
    NSAttributedString *attStr = [NSAttributedString hm_imageTextWithImage:[UIImage imageNamed:imgName] imageWH:35 title:title fontSize:14 titleColor:[UIColor whiteColor] spacing:8];
    
//    设置文本属性
    [btn setAttributedTitle:attStr forState:UIControlStateNormal];
//   允许多行
    btn.titleLabel.numberOfLines = 0;
//    文字居中
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    return btn;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


@end
