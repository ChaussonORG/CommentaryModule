//
//  LoginViewController.m
//  CommentaryModule
//
//  Created by 郭金涛 on 16/4/21.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    self.view.backgroundColor = [UIColor redColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:(UIBarButtonItemStylePlain) target:self action:@selector(popViewController)];
    // Do any additional setup after loading the view.
}
- (void)popViewController
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
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
