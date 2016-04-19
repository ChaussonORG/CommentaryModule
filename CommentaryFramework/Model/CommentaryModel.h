//
//  CommentaryModel.h
//  CommentaryModule
//
//  Created by 郭金涛 on 16/4/19.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import <JSONModel/JSONModel.h>
@class CommentaryModelItems;
@protocol CommentaryModelItems <NSObject>

@end

@interface CommentaryModelItems :JSONModel
@property (copy ,nonatomic )NSString <Optional>*userName;

@property (copy, nonatomic)NSString <Optional>*photo;

@property (copy, nonatomic)NSString <Optional>*publicTime;

@property (copy, nonatomic)NSString <Optional>*content;

@property (assign, nonatomic)int createBy;
@end

@interface  CommentaryModelData:JSONModel
@property (nonatomic, strong)NSArray <Optional,CommentaryModelItems>*items;
@end

@interface CommentaryModel : JSONModel
@property (nonatomic, strong)CommentaryModelData <Optional>*data;
@property (assign ,nonatomic) int code;
@property (copy ,nonatomic) NSString <Optional>*message;
@end
