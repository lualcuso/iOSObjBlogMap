//
//  EntryViewController.m
//  iOS ObjC Applicant Coding Challenge
//
//  Created by Luis Cubillo on 12/28/19.
//  Copyright © 2019 Luis Cubillo. All rights reserved.
//

#import "EntryViewController.h"

@interface EntryViewController ()

@end

@implementation EntryViewController

@synthesize blogWebView = _blogWebView;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *newUrl = [NSURL URLWithString:_entryURL];
    
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:newUrl];
    NSLog(@"%@",  _entryURL);
    [_blogWebView loadRequest:requestObj];
}

- (void)webView:(WKWebView *)webView didFailLoadWithError:(NSError *)error {
   NSLog(@"Error : %@",error);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
