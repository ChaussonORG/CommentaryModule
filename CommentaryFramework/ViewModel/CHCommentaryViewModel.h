//
//  CHCommentaryViewModel.h
//  CommentaryModule
//
//  Created by Chausson on 16/4/19.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CHCommentaryCellVM.h"
@interface CHCommentaryViewModel : NSObject
@property (nonatomic, copy ) NSString *identifier;
@property (nonatomic, strong) NSMutableArray <CHCommentaryCellVM *> *cellViewModel;
- (void)requestData;
- (void)requestFooterData;
@property (nonatomic, strong)NSString *isFinish;
- (void)sendText:(NSString *)text;
@end
