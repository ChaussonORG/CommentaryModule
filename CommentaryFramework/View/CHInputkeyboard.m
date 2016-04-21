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


CGFloat keyboardHeight;
@implementation CHInputkeyboard

#pragma mark init

- (instancetype)initWithOwner:(UIViewController <UITextViewDelegate, CHCommentarySendDelegate>*)controller{
    
    CGSize size = controller.view.frame.size;
   
    self = [super initWithFrame:CGRectMake(0, SCREENHEIGHT - 50*kHeightFactor-64, size.width, 50*kHeightFactor)];
    NSLog(@"%f",SCREENHEIGHT - 50*kHeightFactor);
    if (self) {
        
        [self prepareForLayout];
        self.textView.delegate = self;
        self.backgroundColor = [UIColor redColor];
        obj = controller;
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
        [controller.view addGestureRecognizer:tapGestureRecognizer];
        
        
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(handleKeyboardShow:)
                                                     name:UIKeyboardWillShowNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(handleKeyboardHide:)
                                                     name:UIKeyboardWillHideNotification
                                                   object:nil];
        
    }
    return self;
}

- (void)prepareForLayout{
    
    _textView = [[UITextView alloc]initWithFrame:CGRectMake(10*kWidthFactor, 5*kHeightFactor, SCREENWITH - 105*kWidthFactor, 40*kHeightFactor)];
    
    _sendBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _sendBtn.frame = CGRectMake(SCREENWITH - 90*kWidthFactor, 5*kHeightFactor, 80*kWidthFactor, 40*kHeightFactor);
    [_sendBtn setTitle:@"send" forState:UIControlStateNormal];
    _sendBtn.backgroundColor = [UIColor orangeColor];
    [_sendBtn addTarget:self action:@selector(pressSendBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:self.textView];
    [self addSubview:self.sendBtn];
}

#pragma mark textViewDelegate

- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
  
    return YES;
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    [textView resignFirstResponder];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    if ([text isEqualToString:@"\n"]) {
        
        return NO;
    }
    
    return YES;
}


#pragma mark -hanlder

- (void)handleKeyboardShow:(NSNotification *) note{
    //     键盘的frame
    NSDictionary *userInfo = [note userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    int height = keyboardRect.size.height;
    keyboardHeight = height;
    CGRect rect = CGRectMake(0, SCREENHEIGHT - 50*kHeightFactor-64, [UIScreen mainScreen].bounds.size.width, 50*kHeightFactor);
    rect.origin.y = rect.origin.y - keyboardHeight;
    self.frame = rect;
    
}


- (void)handleKeyboardHide:(NSNotification *) note{
    
    [UIView animateWithDuration:.5 animations:^{
        CGRect rect = self.frame;
        rect = CGRectMake(0, SCREENHEIGHT - 50*kHeightFactor-64, SCREENWITH, 50*kHeightFactor);
        self.frame = rect;
        
    } completion:^(BOOL finished) {
        
    }];
}

- (void)pressSendBtnAction:(UIButton *)button{
    
    [_textView resignFirstResponder];
    
    if (![self.textView.text isEqualToString:@""]) {
        [obj pressSendBtn:_textView.text];
    }
    
    self.textView.text = @"";
    
}


#pragma mark Gesture

- (void)keyboardHide:(UITapGestureRecognizer*)tap{
    [_textView resignFirstResponder];
}




- (void)dealloc{
   
    [[NSNotificationCenter defaultCenter] removeObserver:self];
  
}
@end
