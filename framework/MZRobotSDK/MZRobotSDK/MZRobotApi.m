//
//  MZRobotApi.m
//  MZRobotSDK
//
//  Created by Alex William on 2018/8/14.
//  Copyright © 2018年 MoziTechnology. All rights reserved.
//

#import "MZRobotApi.h"

@implementation MZRobotApi

+ (void)showLogWithTag:(NSInteger)tag {
    
    switch (tag) {
        case 0:
            NSLog(@"我就在深圳");
            break;
        case 1:
            NSLog(@"我就在贵阳");
            break;
        case 2:
            NSLog(@"我就在背景");
            break;
        case 3:
            NSLog(@"我就在广州");
            break;
        case 4:
            NSLog(@"我就在上海");
            break;
            
        default:
            
            NSLog(@"我就在中国");
            break;
    }
}

@end
