//
//  CHCommentaryTableView.h
//  CommentaryModule
//
//  Created by Chausson on 16/4/19.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHCommentaryTableView : UITableView
- (instancetype)initWithOwner:(UIViewController <UITableViewDelegate,UITableViewDataSource>*)controller;
@end
