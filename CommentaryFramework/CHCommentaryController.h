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
#import "CHInputkeyboard.h"
@interface CHCommentaryController : UIViewController<UITableViewDelegate, UITableViewDataSource>
+ (instancetype )new  __unavailable;
- (instancetype )init __unavailable;
- (instancetype )initWithViewModel:(CHCommentaryViewModel *)viewModel;

@property (nonatomic, strong)CHCommentaryViewModel *viewModel;

@property (nonatomic, strong)CHCommentaryTableView *tableView;

@property (nonatomic, strong)CHInputkeyboard *keyBofardView;

@end
