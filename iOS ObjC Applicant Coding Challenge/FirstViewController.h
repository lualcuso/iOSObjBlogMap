//
//  FirstViewController.h
//  iOS ObjC Applicant Coding Challenge
//
//  Created by Luis Cubillo on 12/22/19.
//  Copyright © 2019 Luis Cubillo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
    @property (nonatomic, weak) IBOutlet UITableView *myTableView;

@end

