//
//  ZXClassPrint.m
//  ZXDataHandleDemo
//
//  Created by 李兆祥 on 2019/1/27.
//  Copyright © 2019 李兆祥. All rights reserved.
//

#import "ZXClassPrint.h"

@implementation ZXClassPrint
- (NSString *)description {
    return [self zx_toJsonStr];
}

@end
