//
//  ZXDataConvert.m
//  ZXDataHandleDemo
//
//  Created by 李兆祥 on 2019/1/27.
//  Copyright © 2019 李兆祥. All rights reserved.
//  GitHub:https://github.com/SmileZXLee/ZXDataHandle

#import "ZXDataConvert.h"
#import "ZXDecimalNumberTool.h"
#import "ZXDataType.h"
@implementation ZXDataConvert
+ (instancetype)shareInstance{
    static ZXDataConvert * s_instance_dj_singleton = nil ;
    if (s_instance_dj_singleton == nil) {
        s_instance_dj_singleton = [[ZXDataConvert alloc] init];
    }
    return (ZXDataConvert *)s_instance_dj_singleton;
}
- (NSMutableDictionary *)allPropertyDic{
    if(_allPropertyDic){
        _allPropertyDic = [NSMutableDictionary dictionary];
    }
    return _allPropertyDic;
}

+ (id)handleValueToMatchModelPropertyTypeWithValue:(id)value type:(NSString *)proType{
    if([proType hasPrefix:@"T@\"NSString\""]){
        return [NSString stringWithFormat:@"%@",value];
    }
    if([value isKindOfClass:[NSString class]]){
        BOOL isNumberType = [ZXDataType isNumberType:value];
        if(isNumberType){
            if(![proType hasPrefix:@"T@"]){
                if([proType hasPrefix:@"TB"]||
                   [proType hasPrefix:@"Tc"]||
                   [proType hasPrefix:@"Tl"]||
                   [proType hasPrefix:@"Tq"]||
                   [proType hasPrefix:@"TC"]||
                   [proType hasPrefix:@"TI"]||
                   [proType hasPrefix:@"TS"]||
                   [proType hasPrefix:@"TL"]||
                   [proType hasPrefix:@"TQ"]||
                   [proType hasPrefix:@"Tf"]||
                   [proType hasPrefix:@"Td"]){
                   return [ZXDecimalNumberTool zx_decimalNumberWithStr:value];
                }
            }
        }
    }
    return value;
}

@end
