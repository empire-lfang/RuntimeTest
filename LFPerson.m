//
//  LFPerson.m
//  LFRunTimeTest
//
//  Created by daoxiu on 16/7/15.
//  Copyright © 2016年 aowokeji. All rights reserved.
//

#import "LFPerson.h"

@interface LFPerson ()
@property(nonatomic,copy)NSString *name;
@end
@implementation LFPerson
+(void)run{
    NSLog(@"run....");
}
+(void)study{
    NSLog(@"study....");
}
-(void)eat{
    NSLog(@"eat.....");

}
-(void)work{
    NSLog(@"work....");

}
@end
