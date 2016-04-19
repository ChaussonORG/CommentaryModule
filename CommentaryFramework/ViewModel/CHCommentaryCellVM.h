//
//  CHCommentaryCellVM.h
//  CommentaryModule
//
//  Created by Chausson on 16/4/19.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHCommentaryCellVM : NSObject
@property (copy, nonatomic, readonly)NSString *name;

@property (copy, nonatomic, readonly)NSString *imageUrl;

@property (copy ,nonatomic, readonly) NSString *time;

@property (copy, nonatomic, readonly)NSString *content;

@property (assign, nonatomic, readonly)NSInteger praiseNum;

@property (assign, nonatomic, readonly)BOOL isVIP;
@end
