//
//  ViewController.m
//  3D touch
//
//  Created by 王昆 on 15/10/9.
//  Copyright © 2015年 wangkun. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "ForthTableViewController.h"

@interface ViewController ()


@end

@implementation ViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    ForthTableViewController *VC = [[ForthTableViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}
@end
