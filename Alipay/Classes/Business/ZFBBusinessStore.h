//
//  ZFBBusinessStore.h
//  0908-支付宝口碑
//
//  Created by  chenhanmao on 9/8/16.
//  Copyright © 2016  chenhanmao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZFBBusinessStore : NSObject
/**
 *  商家头像
 */
@property(nonatomic,copy)NSString *icon;
/**
 *  优惠信息
 */
@property(nonatomic,copy)NSString *discount;
/**
 *  人均消费
 */
@property(nonatomic,assign)NSInteger averagePrice;
/**
 *  距离
 */
@property(nonatomic,assign)NSInteger distance;
/**
 *  折扣
 */
@property(nonatomic,assign)float offNum;
/**
 *  平方等级
 */
@property(nonatomic,assign)float level;
/**
 *  店名
 */
@property(nonatomic,copy)NSString *name;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)businessWithDict:(NSDictionary *)dict;
@end
