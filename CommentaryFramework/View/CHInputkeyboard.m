//
//  CHInputkeyboard.m
//  CommentaryModule
//
//  Created by Chausson on 16/4/19.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "CHInputkeyboard.h"
#define SCREENWITH   [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

#define kWidthFactor ([UIScreen mainScreen].bounds.size.width/375)
#define kHeightFactor ([UIScreen mainScreen].bounds.size.height/667)
@implementation CHInputkeyboard
- (void)handleKeyboardShow:(NSNotification *) note{
    NSDictionary *userInfo = note.userInfo;
    
    // 键盘的frame
    CGRect keyboardF = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    // 执行动画
    [UIView animateWithDuration:.5 animations:^{
        CGRect rect = self.frame;
        rect.origin.y = rect.origin.y - keyboardF.size.height;
        self.frame = rect;
    } completion:^(BOOL finished) {
    }];
}

- (void)handleKeyboardHide:(NSNotification *) note{
    [UIView animateWithDuration:.5 animations:^{
        CGRect rect = self.frame;
        rect.origin.y = SCREENHEIGHT - 50*kHeightFactor;
        self.frame = rect;

    } completion:^(BOOL finished) {
        self.textView.text = @"";
    }];
}
- (instancetype)initWithOwner:(UIViewController <UITextViewDelegate>*)controller Obj:(id<CHCommentarySendDelegate>)o {
    
    CGSize size = controller.view.frame.size;
    _textView.delegate = controller;
   
    self = [super initWithFrame:CGRectMake(0, SCREENHEIGHT - 50*kHeightFactor, size.width, 50)];
    if (self) {
        
        [self prepareForLayout];
        obj = o;
        
        [[NSNotificationCenter defaultCenter] addObserver:controller
                                                 selector:@selector(handleKeyboardShow:)
                                                     name:UIKeyboardWillShowNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:controller
                                                 selector:@selector(handleKeyboardHide:)
                                                     name:UIKeyboardWillHideNotification
                                                   object:nil];
        
    }
    return self;
}
- (void)prepareForLayout{
    
    _textView = [[UITextView alloc]initWithFrame:CGRectMake(10*kWidthFactor, 5*kHeightFactor, SCREENWITH - 100*kWidthFactor, 40*kHeightFactor)];
    
    _sendBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _sendBtn.frame = CGRectMake(SCREENWITH - 85*kWidthFactor, 5*kHeightFactor, 80*kWidthFactor, 40*kHeightFactor);
    [_sendBtn setTitle:@"send" forState:UIControlStateNormal];
    [_sendBtn addTarget:self action:@selector(pressSendBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:self.textView];
    [self addSubview:self.sendBtn];
}

- (void)pressSendBtnAction:(UIButton *)button{
    
    [obj pressSendBtn:_textView.text];

}
@end
