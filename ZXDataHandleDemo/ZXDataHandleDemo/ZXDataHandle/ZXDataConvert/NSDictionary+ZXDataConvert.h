//
//  NSDictionary+ZXDataConvert.h
//  ZXDataHandle
//
//  Created by 李兆祥 on 2019/1/27.
//  Copyright © 2019 李兆祥. All rights reserved.
//  GitHub:https://github.com/SmileZXLee/ZXDataHandle

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (ZXDataConvert)
///字典转json字符串
-(NSString *)zx_dicToJsonStr;
///字典转json字符串
-(NSString *)zx_dicToJsonStrWithOptions:(NSJSONWritingOptions)options;
///字典转jsonData
-(NSData *)zx_dicToJSONData;
///字典转jsonData
-(NSData *)zx_dicToJSONDataWithOptions:(NSJSONWritingOptions)options;
@end

NS_ASSUME_NONNULL_END
