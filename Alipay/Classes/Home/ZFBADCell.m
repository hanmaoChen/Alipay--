//
//  ZFBADCell.m
//  Alipay
//
//  Created by  chenhanmao on 16/9/17.
//  Copyright © 2016年  chenhanmao. All rights reserved.
//

#import "ZFBADCell.h"
#import "CHMSlideView.h"
#import "Masonry.h"
@implementation ZFBADCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)awakeFromNib{
    [super awakeFromNib];
    [self setupUI];
}

#pragma mark - 加载数据
- (NSArray *)loadImageUrlData{
    
    int count = 5;
    NSMutableArray *arrM = [NSMutableArray array];
    
    for (int i = 0; i<count; i++) {
        NSString *imgName = [NSString stringWithFormat:@"Home_Scroll_0%d.jpg",i+1];
        NSURL *url = [[NSBundle mainBundle] URLForResource:imgName withExtension:nil];
        
        [arrM addObject:url];
    }
    
    return arrM;
}

#pragma mark - 搭建界面
- (void)setupUI{
    CHMSlideView *sv = [[CHMSlideView alloc]init];
    [self.contentView addSubview:sv];
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self.contentView);
    }];
    [self.contentView layoutIfNeeded];
    sv.imgUrlList = [self loadImageUrlData];
}

@end
