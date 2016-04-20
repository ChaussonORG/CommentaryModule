//
//  CHCommentaryTableView.m
//  CommentaryModule
//
//  Created by Chausson on 16/4/19.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "CHCommentaryTableView.h"

@implementation CHCommentaryTableView
- (instancetype)initWithOwner:(UIViewController <UITableViewDelegate,UITableViewDataSource>*)controller{
    CGRect rect = controller.view.frame;
    self.delegate = controller;
    self.dataSource = controller;
    self = [super initWithFrame:rect style:UITableViewStylePlain];
       NSLog(@"rect=%@",NSStringFromCGRect(rect));
    if (self) {
        
    }
    return self;
}
@end
