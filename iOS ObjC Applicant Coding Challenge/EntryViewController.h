//
//  EntryViewController.h
//  iOS ObjC Applicant Coding Challenge
//
//  Created by Luis Cubillo on 12/28/19.
//  Copyright © 2019 Luis Cubillo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EntryViewController : UIViewController
@property (nonatomic, weak) IBOutlet WKWebView *blogWebView;
@property (nonatomic, weak) NSString *entryURL;
@end

NS_ASSUME_NONNULL_END
