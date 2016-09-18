//
//  ZFBMomentModel.m
//  ZFB生活圈
//
//  Created by  chenhanmao on 9/9/16.
//  Copyright © 2016  chenhanmao. All rights reserved.
//

#import "ZFBMomentModel.h"

@implementation ZFBMomentModel

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self =[super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)momentWithDict:(NSDictionary *)dict{
    
    return [[self alloc]initWithDict:dict];
}

- (NSString *)description
{
    NSArray *keys = @[@"icon",@"name",@"content",@"picture",@"time"];
    return [self dictionaryWithValuesForKeys:keys].description;
}



@end
