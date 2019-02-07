//
//  Bird.m
//  ZXDataHandleDemo
//
//  Created by 李兆祥 on 2019/1/27.
//  Copyright © 2019 李兆祥. All rights reserved.
//

#import "Bird.h"

@implementation Bird
+(NSDictionary *)zx_inArrModelName{
    return @{@"boys" : @"Boy"};
}
+(NSDictionary *)zx_replaceProName{
    return @{@"uid" : @"id"};
}
+(NSString *)zx_replaceProName121:(NSString *)proName{
    return [proName strToUnderLine];
}

-(void)setUid:(NSString *)uid{
    uid = @"1234";
    _uid = uid;
}
@end
