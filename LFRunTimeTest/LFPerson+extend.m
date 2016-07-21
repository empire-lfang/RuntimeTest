//
//  LFPerson+extend.m
//  LFRunTimeTest
//
//  Created by daoxiu on 16/7/21.
//  Copyright © 2016年 aowokeji. All rights reserved.
//

#import "LFPerson+extend.h"
#import <objc/runtime.h>
@interface LFPerson  ()

@end
char nameKey;
@implementation LFPerson (extend)

-(void)setNickname:(NSString *)nickname{

    objc_setAssociatedObject(self, &nameKey, nickname, OBJC_ASSOCIATION_COPY_NONATOMIC);

}
-(NSString *)nickname{
    
    return objc_getAssociatedObject(self, &nameKey);
}
@end
