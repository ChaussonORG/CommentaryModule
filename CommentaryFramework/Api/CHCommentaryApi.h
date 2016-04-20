//
//  CommentaryApi.h
//  CommentaryModule
//
//  Created by 郭金涛 on 16/4/19.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "CHNetRequest.h"
#import "CHCommentaryModel.h"

@interface CHCommentaryApi : CHNetRequest
@property (assign ,nonatomic) NSInteger index;
- (NSArray <CHCommentaryModelItems *>*)getItems;

@end
