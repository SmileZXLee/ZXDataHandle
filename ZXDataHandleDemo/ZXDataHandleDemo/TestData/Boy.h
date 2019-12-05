//
//  Boy.h
//  ZXDataHandleDemo
//
//  Created by 李兆祥 on 2019/1/27.
//  Copyright © 2019 李兆祥. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Dog;
@class Cat;
@interface Boy : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *sex;
@property (nonatomic, copy) NSString *sign;
@property (nonatomic, copy) NSString *score;
@property (nonatomic, strong) NSNumber *hasMoney;
@property (nonatomic, strong) Dog *myDog;
@property (nonatomic, strong) Cat *myCat;
@property (nonatomic, strong) NSArray *arrayTest;
@end
