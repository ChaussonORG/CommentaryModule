//
//  CHCommentaryCell.h
//  CommentaryModule
//
//  Created by Chausson on 16/4/19.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHCommentaryCell : UITableViewCell

@property(nonatomic,strong)UIButton *nameBtn;

@property(nonatomic,strong)UIButton *imageBtn;

@property(nonatomic,strong)UILabel *timeLabel;

@property(nonatomic,strong)UILabel *contentLabel;

@property(nonatomic,strong)UIButton *praiseBtn;

@property(nonatomic,strong)UIButton *vipSymbolBtn;

+ (CGSize)calculateStringLength:(NSString *)str;

- (void)setCellWithModel:(CHCommentaryCellVM*)model;
@end