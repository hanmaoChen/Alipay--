//
//  ZFBFriendsCell.m
//  Alipay
//
//  Created by  chenhanmao on 16/9/18.
//  Copyright © 2016年  chenhanmao. All rights reserved.
//

#import "ZFBFriendsCell.h"
#import "Masonry.h"
@interface ZFBFriendsCell()

@property(weak,nonatomic)UIImageView *iconView;
@property(weak,nonatomic)UILabel *nameLabel;
@property(weak,nonatomic)UILabel *detailLabel;
@property(weak,nonatomic)UILabel *timeLabel;

@end

@implementation ZFBFriendsCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupUI];
}

#pragma mark - 重写friends的setter方法
-(void)setFriends:(ZFBFriendsModel *)friends{
    
    _friends = friends;
    
    _iconView.image = [UIImage imageNamed:friends.icon];
    _nameLabel.text = friends.name;
    _detailLabel.text = friends.detail;
    _timeLabel.text = friends.time;
    
    if (self.detailLabel.text.length == 0 ) {
        [_nameLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(self.contentView);
        }];
//        附加按钮
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else{
        
        [_nameLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(_iconView);
            make.left.equalTo(_iconView.mas_right).offset(8);
        }];
        self.accessoryType = UITableViewCellAccessoryNone;

    }
    
    
}

#pragma mark - 搭建界面
- (void)setupUI{
//    创建控件
    UIImageView *iconView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"APC_timeLineIcon"]];
    [self.contentView addSubview:iconView];
    
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.text = @"生活圈";
    nameLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:nameLabel];
    
    UILabel *detailLabel = [[UILabel alloc]init];
    detailLabel.text = @"没有";
    detailLabel.font = [UIFont systemFontOfSize:11];
    [self.contentView addSubview:detailLabel];
    
    UILabel *timeLabel = [[UILabel alloc]init];
    timeLabel.text = @"今天";
    timeLabel.font = [UIFont systemFontOfSize:11];
    [self.contentView addSubview:timeLabel];
    

    CGSize iconSize = CGSizeMake(40, 40);
    NSInteger leftMargin = 8;
//    NSInteger topMargin = 10;
//    自动布局
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentView).offset(leftMargin);
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(iconSize);
    }];
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(iconView.mas_right).offset(leftMargin);
        make.top.equalTo(iconView);
    }];
    
    [detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(nameLabel);
        make.top.equalTo(nameLabel.mas_bottom).offset(leftMargin);
    }];
    
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.contentView).offset(leftMargin);
        make.right.equalTo(self.contentView).offset(-leftMargin);
    }];
    
//    记录控件
    _iconView = iconView;
    _nameLabel = nameLabel;
    _detailLabel = detailLabel;
    _timeLabel = timeLabel;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
