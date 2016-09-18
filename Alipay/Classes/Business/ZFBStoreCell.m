//
//  ZFBStoreCell.m
//  0908-支付宝口碑
//
//  Created by  chenhanmao on 9/8/16.
//  Copyright © 2016  chenhanmao. All rights reserved.
//

#import "ZFBStoreCell.h"
#import "ZFBStarLevel.h"

@interface ZFBStoreCell()
/**
 *  评星等级
 */
@property (weak, nonatomic) IBOutlet ZFBStarLevel *starLevelView;
/**
 *  商家头像
 */
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
/**
 *  店名
 */
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
/**
 *  人均消费
 */
@property (weak, nonatomic) IBOutlet UILabel *avgLabel;
/**
 *  距离
 */
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
/**
 *  优惠信息
 */
@property (weak, nonatomic) IBOutlet UILabel *discountLabel;
/**
 *  折扣
 */
@property (weak, nonatomic) IBOutlet UILabel *offNumLabel;


@end
@implementation ZFBStoreCell

//重写store的setter方法
-(void)setStore:(ZFBBusinessStore *)store{
    
    _iconView.image = [UIImage imageNamed: store.icon];
    _nameLabel.text = store.name;
    _avgLabel.text = [NSString stringWithFormat:@"人均%zd元",store.averagePrice];
    _distanceLabel.text = [NSString stringWithFormat:@"距离%zdm",store.distance];
    _discountLabel.text = store.discount;
    _offNumLabel.text = [NSString stringWithFormat:@"%.1lf",store.offNum];
    _starLevelView.starLevel = store.level;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

@end
