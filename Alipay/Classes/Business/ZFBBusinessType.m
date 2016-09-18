//
//  ZFBBusinessType.m
//  口碑代码创建
//
//  Created by  chenhanmao on 16/9/17.
//  Copyright © 2016年  chenhanmao. All rights reserved.
//

#import "ZFBBusinessType.h"

@implementation ZFBBusinessType
-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self =[super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype) businessWithDict:(NSDictionary *)dict{
    
    return [[self alloc]initWithDict:dict];
}

- (NSString *)description
{
    NSArray *keys = @[@"name",@"icon"];
    return [self dictionaryWithValuesForKeys:keys].description;
}

@end
