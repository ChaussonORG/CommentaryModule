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
    CGFloat viewY;
//    if (controller.navigationController.navigationBar && !controller.navigationController.navigationBar.translucent) {
//        
//        viewY = 0;
//    }
//    else{
//        viewY = 20;
//    }
    
//   CGRect rect = CGRectMake(0, viewY, controller.view.frame.size.width, controller.view.frame.size.height - 20);
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
