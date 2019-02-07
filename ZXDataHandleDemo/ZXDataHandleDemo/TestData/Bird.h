//
//  Bird.h
//  ZXDataHandleDemo
//
//  Created by 李兆祥 on 2019/1/27.
//  Copyright © 2019 李兆祥. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Bird : NSObject
@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *likeToDo;
@property (nonatomic, strong) NSMutableArray *boys;
@end

NS_ASSUME_NONNULL_END
