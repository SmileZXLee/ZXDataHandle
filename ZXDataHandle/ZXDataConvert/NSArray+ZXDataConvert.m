//
//  NSArray+ZXDataConvert.m
//  ZXDataHandle
//
//  Created by 李兆祥 on 2019/1/27.
//  Copyright © 2019 李兆祥. All rights reserved.
//  GitHub:https://github.com/SmileZXLee/ZXDataHandle

#import "NSArray+ZXDataConvert.h"
#import "ZXDataHandleLog.h"
@implementation NSArray (ZXDataConvert)
-(NSString *)zx_arrToJsonStr{
    NSData *jsonData = [self zx_arrToJSONData];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

-(NSString *)zx_arrToJsonStrWithOptions:(NSJSONWritingOptions)options{
    NSData *jsonData = [self zx_arrToJSONDataWithOptions:options];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

-(NSData *)zx_arrToJSONDataWithOptions:(NSJSONWritingOptions)options{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:options
                                                         error:&error];
    if ([jsonData length] > 0 && error == nil){
        return jsonData;
    }else{
        ZXDataHandleLog(@"数组%@无法转化为Json字符串--error:%@",self,error);
        return nil;
    }
}

-(NSData *)zx_arrToJSONData{
    return [self zx_arrToJSONDataWithOptions:NSJSONWritingPrettyPrinted];
}
@end
