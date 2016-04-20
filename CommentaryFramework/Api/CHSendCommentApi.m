//
//  CHSendCommentApi.m
//  CommentaryModule
//
//  Created by 郭金涛 on 16/4/20.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "CHSendCommentApi.h"

@implementation CHSendCommentApi
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(NSString *)customUrl
{
    return @"http://p2pguide.sudaotech.com/platform/app/comment";
}
- (CHRequestMethod)requestMethod
{
    return CHRequestMethodPost;
}
- (NSDictionary *)requestParameter
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:[NSString stringWithFormat:@"28"] forKey:@"parent"];
    [params setObject:self.content forKey:@"content"];
    return params;
}
- (NSDictionary *)requestHeaderFieldValueDictionary
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    NSString *token = [NSString stringWithFormat:@"_MCH_AT=%@", @"8rc3%2BVwxuDpgiOEW%2Fe37%2FMAQjeHM6HFb6K3cNEpmVHQ1Gfvx8YI%2BpkAzov2ysr9ExKdh3MRoPFqlBoRqEqucSSDLPsTP%2FyAr1BHoRG%2BvDO5XBUtGzSvIGBjfEiim%2Fy97peUK8KsIYKi%2FJmNhAS4QtQ%3D%3D"];
    [dic setObject:token forKey:@"cookie"];
    return dic;
}
@end
