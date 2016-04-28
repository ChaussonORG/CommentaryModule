//
//  ViewController.m
//  CommentaryModule
//
//  Created by Chausson on 16/4/19.
//  Copyright © 2016年 Chausson. All rights reserved.
//
#import "CHCommentaryController.h"
#import "CHCommentaryViewModel.h"
#import "CHViewController.h"
#import "CHCommentaryCell.h"
#import "CHLoginViewController.h"
#import <ReactiveCocoa.h>

#define TOKEN @"8rc3%2BVwxuDpgiOEW%2Fe37%2FMAQjeHM6HFb6K3cNEpmVHQ1Gfvx8YI%2BpkAzov2ysr9ExKdh3MRoPFqlBoRqEqucSSDLPsTP%2FyAr1BHoRG%2BvDO5XBUtGzSvIGBjfEiim%2Fy97peUK8KsIYKi%2FJmNhAS4QtQ%3D%3D"

#define LISTURL @"http://p2pguide.sudaotech.com/platform/app/comment/list"

#define COMMENTURL @"http://p2pguide.sudaotech.com/platform/app/comment"

#define IDENTIFIER @"28"
@interface CHViewController ()<CHCommentarySendDelegate>

@end

@implementation CHViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)push:(UIButton *)sender {
    CHCommentaryViewModel *viewModel = [[CHCommentaryViewModel alloc] initWithToken: TOKEN ListUrl: LISTURL sendCommentUrl: COMMENTURL identifier: IDENTIFIER];
    viewModel.isSignIn = YES;
    CHLoginViewController *loginVC = [CHLoginViewController new];
    CHCommentaryController *controller = [[CHCommentaryController alloc]initWithViewModel:viewModel];
    @weakify(controller)
    [controller setBeforeSendMessageBlock:^{
        if (!viewModel.isSignIn) {
            @strongify(controller)
            [controller presentViewController:loginVC animated:YES completion:^{
                
            }];
        }
   
    }];
    

    [self.navigationController pushViewController:controller animated:YES];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
