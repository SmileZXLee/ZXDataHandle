//
//  ZXArchived.h
//  ZXDataHandle
//
//  Created by 李兆祥 on 2019/1/28.
//  Copyright © 2019 李兆祥. All rights reserved.
//  继承这个类即可直接将自定义的对象归档存储

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#define ZXClassArchivedImplementation \
-(void)encodeWithCoder:(NSCoder *)enCoder{\
u_int count;\
objc_property_t *properties  = class_copyPropertyList([self class],&count);\
for(int i = 0;i < count;i++){\
    const char *propertyNameChar = property_getName(properties[i]);\
    NSString *propertyNameStr = [NSString stringWithUTF8String: propertyNameChar];\
    if([enCoder respondsToSelector:@selector(encodeObject:forKey:)]){\
        id obj = [self valueForKeyPath:propertyNameStr];\
        if([obj respondsToSelector:@selector(encodeWithCoder:)]){\
            [enCoder encodeObject:obj forKey:propertyNameStr];\
        }\
        \
    }\
\
}\
free(properties);\
\
}\
-(id)initWithCoder:(NSCoder *)decoder{\
    if(self = [super init]){\
        u_int count;\
        objc_property_t *properties  = class_copyPropertyList([self class],&count);\
        for(int i = 0;i < count;i++){\
            const char *propertyNameChar = property_getName(properties[i]);\
            NSString *propertyNameStr = [NSString stringWithUTF8String: propertyNameChar];\
            if([decoder respondsToSelector:@selector(decodeObjectForKey:)]){\
                id obj = [decoder decodeObjectForKey:propertyNameStr];\
                if([obj respondsToSelector:@selector(initWithCoder:)]){\
                    [self setValue:obj forKeyPath:propertyNameStr];\
                }\
            }\
        }\
        free(properties);\
    }\
    return  self;\
}

NS_ASSUME_NONNULL_BEGIN

@interface ZXClassArchived : NSObject <NSCoding>
-(void)encodeWithCoder:(NSCoder *)enCoder;
-(id)initWithCoder:(NSCoder *)decoder;
@end

NS_ASSUME_NONNULL_END
