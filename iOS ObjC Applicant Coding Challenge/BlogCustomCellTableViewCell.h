//
//  BlogCustomCellTableViewCell.h
//  iOS ObjC Applicant Coding Challenge
//
//  Created by Luis Cubillo on 12/22/19.
//  Copyright © 2019 Luis Cubillo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BlogCustomCellTableViewCell : UITableViewCell    
    @property (nonatomic, weak) IBOutlet UILabel *titleLabel;
    @property (nonatomic, weak) IBOutlet UILabel *descriptionLabel;
    @property (nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;
    @property (weak, nonatomic) IBOutlet UILabel *authorLabel;
    @property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@end

NS_ASSUME_NONNULL_END
