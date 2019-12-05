//
//  Apple.h
//  ZXDataHandleDemo
//
//  Created by 李兆祥 on 2019/1/29.
//  Copyright © 2019 李兆祥. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZXClassArchived.h"
NS_ASSUME_NONNULL_BEGIN

@interface Apple : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *dec;
@property (nonatomic, assign) double soldMoney;

@property (nonatomic, copy) NSString *testAdd;

@property (nonatomic, copy) void (^testBlock)(void);
@end

NS_ASSUME_NONNULL_END
