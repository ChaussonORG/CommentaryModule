//
//  CHCommentaryController.h
//  CommentaryModule
//
//  Created by Chausson on 16/4/19.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHCommentaryViewModel.h"
#import "CHCommentaryTableView.h"
#import "CHCommentaryCell.h"
@interface CHCommentaryController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)CHCommentaryViewModel *viewModel;

@property (nonatomic, strong)CHCommentaryTableView *tableView;
@end
