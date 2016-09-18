//
//  ZFBMomentCell.m
//  ZFB生活圈
//
//  Created by  chenhanmao on 9/9/16.
//  Copyright © 2016  chenhanmao. All rights reserved.
//  @"icon",@"name",@"content",@"picture",@"time"

#import "ZFBMomentCell.h"
#import "Masonry.h"
#import "HMAdditions.h"
@interface ZFBMomentCell()
/**
 *  头像
 */
@property(weak,nonatomic)UIImageView *iconView;
/**
 *  名字
 */
@property(weak,nonatomic)UILabel *nameLabel;
/**
 *  内容
 */
@property(weak,nonatomic)UILabel *contentLabel;
/**
 *  图片
 */
@property(weak,nonatomic)UIImageView *pictureView;
/**
 *  发布时间
 */
@property(weak,nonatomic)UILabel *timeLabel;


@end

@implementation ZFBMomentCell

//重写model的setter方法
-(void)setModel:(ZFBMomentModel *)model{
    _model = model;
    
    _iconView.image = [UIImage imageNamed:model.icon];
    _nameLabel.text = model.name;
    _contentLabel.text = model.content;
    _pictureView.image = [UIImage imageNamed:model.picture];
    _timeLabel.text = model.time;
    
//    等比例显示图片
    UIImage *picture = [UIImage imageNamed:model.picture];
    
    CGFloat pHeight = 150;
//    更新视图比例
    CGFloat pWidth = picture.size.width*pHeight/picture.size.height;
    
    [_pictureView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(pWidth, pHeight));
    }];
}
//初始化时强制调用的方法
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
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


-(void)setupUI{
    
//    self.backgroundColor = [UIColor yellowColor];
    
    // 1. 添加控件
    UIImage *image = [UIImage imageNamed:@"user02_icon"];
    UIImageView *iv = [[UIImageView alloc] initWithImage:image];
    
    // 注意，往 cell 上添加控件一定添加到 contentView 上
    [self.contentView addSubview:iv];
    
    // 姓名
    UILabel *lName = [UILabel hm_labelWithText:@"小灰灰" fontSize:14 color:[UIColor blueColor]];

    [self.contentView addSubview:lName];
    
    // 内容
    UILabel *lContent = [UILabel hm_labelWithText:@"噢噢噢噢" fontSize:14 color:[UIColor blackColor]];

    // 让 label 支持多行！
    // - frame 开发，同时需要足够的空间！
    // - 自动布局，指定左右约束
    lContent.numberOfLines = 0;
    [self.contentView addSubview:lContent];
    
    // 照片
    UIImage *imPicture = [UIImage imageNamed:@"img_0247"];
    UIImageView *ivPicture = [[UIImageView alloc] initWithImage:imPicture];
    
    [self.contentView addSubview:ivPicture];
    
    // 时间
    UILabel *lTime = [UILabel hm_labelWithText:@"去年的今天" fontSize:12 color:[UIColor blackColor]];
    
    [self.contentView addSubview:lTime];
    
    // 删除按钮
    UIButton *bRemove = [[UIButton alloc] init];
    
    [bRemove setTitle:@"删除" forState:UIControlStateNormal];
    [bRemove setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [bRemove setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    bRemove.titleLabel.font = lTime.font;
    
    [self.contentView addSubview:bRemove];
    
    // 操作按钮
    UIButton *bAcction = [[UIButton alloc] init];
    
    UIImage *imAction = [UIImage imageNamed:@"more"];
    [bAcction setImage:imAction forState:UIControlStateNormal];
    
    [self.contentView addSubview:bAcction];
    
//     增加分隔线
    UIView *vSep = [[UIView alloc] init];
    
    vSep.backgroundColor = [UIColor blackColor];
    
    [self.contentView addSubview:vSep];
    
    // 2. 自动布局
    CGFloat margin = 8;
    CGSize iconSize = CGSizeMake(35, 35);
    CGSize pictureSize = CGSizeMake(100, 100);
//    头像
    [iv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(margin);
        make.left.equalTo(self.contentView).offset(margin);
        make.size.mas_equalTo(iconSize);
    }];
//    名字
    [lName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(iv);
        make.left.equalTo(iv.mas_right).offset(margin);
    }];
//    内容
    [lContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lName.mas_bottom).offset(margin);
        make.left.equalTo(lName);
        make.right.equalTo(self.contentView).offset(-margin);
    }];
//    图片
    [ivPicture mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lContent.mas_bottom).offset(margin);
        make.left.equalTo(lContent);
        make.size.mas_equalTo(pictureSize);
        
    }];
//    时间
    [lTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ivPicture.mas_bottom).offset(margin);
        make.left.equalTo(ivPicture);
    }];
//    隐藏
    [bRemove mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lTime.mas_right).offset(margin);
        make.baseline.equalTo(lTime);
    }];
//    评论
    [bAcction mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-margin);
        make.centerY.equalTo(bRemove);
        make.bottom.equalTo(self.contentView).offset(-margin);
    }];
    
//    分割线
    [vSep mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.bottom.equalTo(self.contentView);
        // 画了一条 `一个` 像素点高的视图
        make.height.mas_equalTo(1 / [UIScreen mainScreen].scale);
    }];
    
    
    // 3. 记录控件
    _iconView = iv;
    _nameLabel = lName;
    _contentLabel = lContent;
    _pictureView = ivPicture;
    _timeLabel = lTime;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
