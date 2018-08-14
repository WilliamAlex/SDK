//
//  ViewController.m
//  demo
//
//  Created by Alex William on 2018/8/14.
//  Copyright © 2018年 MoziTechnology. All rights reserved.
//

#import "ViewController.h"

#import <MZRobotSDK/MZRobotSDK.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [MZRobotApi showLogWithTag:0];
}

@end
