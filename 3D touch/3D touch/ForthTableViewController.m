//
//  ForthTableViewController.m
//  3D touch
//
//  Created by 王昆 on 15/10/29.
//  Copyright © 2015年 wangkun. All rights reserved.
//

#import "ForthTableViewController.h"
#import "ThirdViewController.h"

//接受代理
@interface ForthTableViewController () <UIViewControllerPreviewingDelegate>
@end

@implementation ForthTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //判断是否支持3D Touch，如果支持则需要注册一下
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        [self registerForPreviewingWithDelegate:self sourceView:self.view];
    }
}

#pragma mark - UIViewControllerPreviewingDelegate
//Peek手势触发的方法
- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:location];
    UITableViewCell *cell  = [self.tableView cellForRowAtIndexPath:indexPath];
    previewingContext.sourceRect = cell.frame;
    ThirdViewController *childVC = [[ThirdViewController alloc] init];
    UILabel *label      = [[UILabel alloc]init];
    label.text          = cell.textLabel.text;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor     = [UIColor redColor];
    childVC.view        = label;
    childVC.view.backgroundColor = [UIColor whiteColor];
    childVC.preferredContentSize = CGSizeMake(0.0f,400.0f);
    
    return childVC;
}

//Pop手势触发的方法
- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
    [self showViewController:viewControllerToCommit sender:self];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *str = @"cee";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Peek and Pop %ld",indexPath.row];
    return cell;
}
@end
