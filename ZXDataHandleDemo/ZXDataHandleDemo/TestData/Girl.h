//
//  Girl.h
//  ZXDataHandleDemo
//
//  Created by 李兆祥 on 2019/1/27.
//  Copyright © 2019 李兆祥. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface Girl : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *sex;
@property (nonatomic, copy) NSString *sign;
@property (nonatomic, copy) NSString *score;
@property (nonatomic, strong) NSNumber *hasMoney;
@property (nonatomic, copy) NSString *hasClothes;
@property (nonatomic, strong) id data;
@end
