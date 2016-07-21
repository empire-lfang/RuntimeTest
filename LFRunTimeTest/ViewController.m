//
//  ViewController.m
//  LFRunTimeTest
//
//  Created by daoxiu on 16/7/15.
//  Copyright © 2016年 aowokeji. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "LFPerson.h"
#import "LFPerson+extend.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //交换类方法：
    [LFPerson run];
    [LFPerson study];
    Method method1 = class_getClassMethod([LFPerson class], @selector(run));
    Method method2 = class_getClassMethod([LFPerson class], @selector(study));
    method_exchangeImplementations(method1, method2);
    [LFPerson run];
    [LFPerson study];
    
    //实例化对象方法：
    LFPerson *person = [[LFPerson alloc]init];
    [person work];
    [person eat];
    Method method3 = class_getInstanceMethod([LFPerson class], @selector(work));
    Method methon4 = class_getInstanceMethod([LFPerson class], @selector(eat));
    method_exchangeImplementations(method3, methon4);
    [person work];
    [person eat];
    
    
    //为分类添加属性
    person.nickname = @"Tom";
    NSLog(@"%@",person.nickname);
    
    
    //获取类的所有成员变量的名称和类型
    unsigned int outCount = 0;
    Ivar *ivars  = class_copyIvarList([LFPerson class],&outCount );
    for (int i = 0; i< outCount; i++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        const char *type = ivar_getTypeEncoding(ivar);
        NSLog(@"%s,%s",name,type);
    }
    free(ivars);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
