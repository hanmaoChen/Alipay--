//
//  ZFBBusinessCell.m
//  口碑代码创建
//
//  Created by  chenhanmao on 9/13/16.
//  Copyright © 2016  chenhanmao. All rights reserved.
//

#import "ZFBBusinessCell.h"
#import "HMAdditions.h"
#import "Masonry.h"
@interface ZFBBusinessCell()

@property(weak,nonatomic)UIImageView *iconView;
@property(weak,nonatomic)UILabel *label;

@end

@implementation ZFBBusinessCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}


-(void)setBusiness:(ZFBBusinessType *)business{
    _business = business;
    
    _iconView.image = [UIImage imageNamed:business.icon];
    _label.text = business.name;
}

/**
 选中变灰
 */
- (void)setHighlighted:(BOOL)highlighted{
    if (highlighted) {
        self.backgroundColor = [UIColor colorWithWhite:0.5 alpha:1];
    }else{
        self.backgroundColor = [UIColor colorWithWhite:1 alpha:1];
    }
}

#pragma mark - 搭建界面
- (void)setupUI{
    
    
    UIImageView *iconView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bus"]];
    [self.contentView addSubview:iconView];
    
    UILabel *label = [UILabel hm_labelWithText:@"物流" fontSize:13 color:[UIColor blackColor]];
                    
    
    [self.contentView addSubview:label];
    
//    约束
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.centerX.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(35, 35));
        
    }];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView).offset(-4);
    }];
    
    _iconView = iconView;
    _label = label;
}

@end
