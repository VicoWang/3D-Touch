//
//  ThirdViewController.m
//  3D touch
//
//  Created by 王昆 on 15/10/14.
//  Copyright © 2015年 wangkun. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()
@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSArray <id <UIPreviewActionItem>> *)previewActionItems {
    UIPreviewAction *p1 = [UIPreviewAction actionWithTitle:@"点我!"style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
        NSLog(@"点击了点我!");
    }];
    UIPreviewAction *p2 = [UIPreviewAction actionWithTitle:@"别点我!" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
        NSLog(@"点击了别点我!");
    }];
    NSArray *actions = @[p1,p2];
    return actions;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
