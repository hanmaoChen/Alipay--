//
//  ZFBBusinessStore.m
//  0908-支付宝口碑
//
//  Created by  chenhanmao on 9/8/16.
//  Copyright © 2016  chenhanmao. All rights reserved.
//

#import "ZFBBusinessStore.h"

@implementation ZFBBusinessStore

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
//        KVC赋值
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)businessWithDict:(NSDictionary *)dict{
    
    return [[self alloc]initWithDict:dict];
    
}

//重写description，方便后期调试
- (NSString *)description
{
    NSArray *keys = @[@"icon",@"discount",@"averagePrice",@"distance",@"offNum",@"level",@"name"];
    return [self dictionaryWithValuesForKeys:keys].description;
}
@end
