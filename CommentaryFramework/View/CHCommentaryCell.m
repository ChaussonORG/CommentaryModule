//
//  CHCommentaryCell.m
//  CommentaryModule
//
//  Created by Chausson on 16/4/19.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "CHCommentaryCell.h"
#define NAMEFONTSIZE 15
#define TIMEFONTSIZE 10
#define CONTENTFONTSIZE 16
#define PRAISENUMFONTSIZE 15
@implementation CHCommentaryCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self prepareLayout];
        
    }
    return self;
    
}

- (void)prepareLayout{
    
    
    _nameBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _nameBtn.frame = CGRectMake(215*kWidthFactor, 10*kHeightFactor, 100, 18*kHeightFactor);
    _nameBtn.titleLabel.font = [UIFont systemFontOfSize:NAMEFONTSIZE*kWidthFactor];
    _nameBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    
    
    _imageBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _imageBtn.frame = CGRectMake(10*kWidthFactor, 10*kHeightFactor, 200*kWidthFactor, 200*kHeightFactor);
    _imageBtn.layer.cornerRadius = 200*kHeightFactor/2;
    
    
    _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(215*kWidthFactor, 30*kHeightFactor, 150*kWidthFactor, 12*kHeightFactor)];
    _timeLabel.font = [UIFont systemFontOfSize:TIMEFONTSIZE*kWidthFactor];
    _timeLabel.textColor = [UIColor grayColor];
    _timeLabel.textAlignment = NSTextAlignmentLeft;
    
    
    _contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(215*kWidthFactor, 50*kHeightFactor, 100, 100)];
    NSLog(@"******%f %f",_contentLabel.frame.size.height,_contentLabel.frame.size.width);
    _contentLabel.font = [UIFont systemFontOfSize:CONTENTFONTSIZE*kWidthFactor];
    _contentLabel.numberOfLines = 0;
    _contentLabel.lineBreakMode = NSLineBreakByWordWrapping|NSLineBreakByTruncatingTail;
//    [_contentLabel sizeToFit];
    
    
    _praiseBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [_praiseBtn setImage:[UIImage imageNamed:@"Normal"] forState:UIControlStateNormal];
    [_praiseBtn setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateSelected];
    
    
    _vipSymbolBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [_vipSymbolBtn setImage:[UIImage imageNamed:@"crown"] forState:UIControlStateNormal];
    _vipSymbolBtn.frame = CGRectMake(100, 10*kHeightFactor, 15, 15);

    
    [self.contentView addSubview:self.nameBtn];
    [self.contentView addSubview:self.imageBtn];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.praiseBtn];
    [self.contentView addSubview:self.vipSymbolBtn];
}

+ (CGSize)calculateStringLength:(NSString *)str{
    
    CGSize size;
    
    
    
    NSAttributedString* atrString = [[NSAttributedString alloc] initWithString:str];
    
    
    
    NSRange range = NSMakeRange(0, atrString.length);
    
    
    
    NSDictionary* dic = [atrString attributesAtIndex:0 effectiveRange:&range];
    
    
    
    size = [str boundingRectWithSize:CGSizeMake(SCREENWITH - 10*kWidthFactor, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    

    
    
    return  size;
}
@end
