//
//  main.m
//  iOS ObjC Applicant Coding Challenge
//
//  Created by Luis Cubillo on 12/22/19.
//  Copyright © 2019 Luis Cubillo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
            