//
//  CHInputkeyboard.h
//  CommentaryModule
//
//  Created by Chausson on 16/4/19.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CHCommentarySendDelegate <NSObject>

- (void)pressSendBtn:(NSString *)text;

@end

@interface CHInputkeyboard : UIView
{
    id<CHCommentarySendDelegate>obj;
}

@property(nonatomic,strong)UITextView *textView;

@property(nonatomic,strong)UIButton *sendBtn;

- (instancetype)initWithObj:(id<CHCommentarySendDelegate>)o;

@end
