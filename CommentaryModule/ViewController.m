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
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)push:(UIButton *)sender {
    CHCommentaryViewModel *viewModel = [[CHCommentaryViewModel alloc]init];
    CHCommentaryController *controller = [[CHCommentaryController alloc]initWithViewModel:viewModel];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
