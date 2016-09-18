//
//  ZFBBusinessType.h
//  口碑代码创建
//
//  Created by  chenhanmao on 16/9/17.
//  Copyright © 2016年  chenhanmao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZFBBusinessType : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *icon;

- (instancetype)initWithDict:(NSDictionary*) dict;
+ (instancetype)businessWithDict:(NSDictionary *)dict;
@end
