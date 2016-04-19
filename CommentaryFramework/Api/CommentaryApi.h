//
//  CommentaryApi.h
//  CommentaryModule
//
//  Created by 郭金涛 on 16/4/19.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "CHNetRequest.h"
#import "CommentaryModel.h"

@interface CommentaryApi : CHNetRequest
@property (assign ,nonatomic) NSInteger index;
- (NSArray <CommentaryModelItems *>*)getItems;

@end
