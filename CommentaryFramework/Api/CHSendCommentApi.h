//
//  CHSendCommentApi.h
//  CommentaryModule
//
//  Created by 郭金涛 on 16/4/20.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import <CHNetworking/CHNetworking.h>

@interface CHSendCommentApi : CHNetRequest
@property (nonatomic, assign)int parent;
@property (nonatomic, strong)NSString *content;
@end
