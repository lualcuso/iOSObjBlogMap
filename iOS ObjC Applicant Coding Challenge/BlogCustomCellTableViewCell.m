//
//  BlogCustomCellTableViewCell.m
//  iOS ObjC Applicant Coding Challenge
//
//  Created by Luis Cubillo on 12/22/19.
//  Copyright © 2019 Luis Cubillo. All rights reserved.
//

#import "BlogCustomCellTableViewCell.h"

@implementation BlogCustomCellTableViewCell

@synthesize titleLabel = _titleLabel;
@synthesize descriptionLabel = _descriptionLabel;
@synthesize thumbnailImageView = _thumbnailImageView;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
