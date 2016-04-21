//
//  ViewController.m
//  CommentaryModule
//
//  Created by Chausson on 16/4/19.
//  Copyright © 2016年 Chausson. All rights reserved.
//
#import "CHCommentaryController.h"
#import "CHCommentaryViewModel.h"
#import "ViewController.h"
#import "CHCommentaryCell.h"
#import "LoginViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)push:(UIButton *)sender {
    CHCommentaryViewModel *viewModel = [[CHCommentaryViewModel alloc] initWithToken:@"8rc3%2BVwxuDpgiOEW%2Fe37%2FMAQjeHM6HFb6K3cNEpmVHQ1Gfvx8YI%2BpkAzov2ysr9ExKdh3MRoPFqlBoRqEqucSSDLPsTP%2FyAr1BHoRG%2BvDO5XBUtGzSvIGBjfEiim%2Fy97peUK8KsIYKi%2FJmNhAS4QtQ%3D%3D" ListUrl:@"http://p2pguide.sudaotech.com/platform/app/comment/list" sendCommentUrl:@"http://p2pguide.sudaotech.com/platform/app/comment" identifier:@"28"];
    viewModel.isSignIn = NO;
    LoginViewController *loginVC = [LoginViewController new];
    CHCommentaryController *controller = [[CHCommentaryController alloc]initWithViewModel:viewModel withLoginVC:loginVC];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
