//
//  FirstViewController.m
//  iOS ObjC Applicant Coding Challenge
//
//  Created by Luis Cubillo on 12/22/19.
//  Copyright © 2019 Luis Cubillo. All rights reserved.
//

#import "FirstViewController.h"
#import "BlogCustomCellTableViewCell.h"
#import "EntryViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController {
    NSArray *blogEntries;
}

@synthesize myTableView = _myTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [[NSURL alloc]initWithString:@"https://www.beenverified.com/articles/index.ios.json"];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];

    NSError *error = nil;

    if (!error) {
        NSURLSessionDataTask *downloadTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            if (!error) {
                NSHTTPURLResponse *httpResp = (NSHTTPURLResponse*) response;
                if (httpResp.statusCode == 200) {
                    NSDictionary* json = [NSJSONSerialization
                                          JSONObjectWithData:data
                                          options:kNilOptions
                                          error:&error];

                    self->blogEntries = [json valueForKey:@"articles"];
                    if (self->blogEntries) {
                        [self->_myTableView reloadData];
                    }
                }
            }
        }];
        [downloadTask resume];
    }
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    BlogCustomCellTableViewCell *cell = (BlogCustomCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"blogEntryCell"];

    if (cell == nil) {
        cell = [[BlogCustomCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"blogEntryCell"];
    }

    NSDictionary *cellElement = [self->blogEntries objectAtIndex:indexPath.row];

    cell.titleLabel.text = cellElement[@"title"];
    cell.descriptionLabel.text = cellElement[@"description"]? cellElement[@"description"] : @"No description available";
    cell.authorLabel.text = cellElement[@"author"]? cellElement[@"author"] : @"No author available";
    cell.dateLabel.text = cellElement[@"article_date"]? cellElement[@"article_date"] : @"No date available";
    cell.thumbnailImageView.image = nil;

    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat: @"%@/%@", @"https://bv-content.beenverified.com/fit-in/60x/filters:autojpg()/", cellElement[@"image"]]];

    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            UIImage *image = [UIImage imageWithData:data];
            if (image) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    BlogCustomCellTableViewCell *updateCell = (BlogCustomCellTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
                    updateCell.thumbnailImageView.image = image;
                    updateCell.thumbnailImageView.frame = CGRectMake(0 ,0, 60, 60);
                });
            }
        }
    }];

    [task resume];
    
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%lu", (unsigned long)[blogEntries count]);
    return [blogEntries count] < 1 || ![blogEntries count] ? 50 :  [blogEntries count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *path = [self.myTableView indexPathForSelectedRow];
    NSDictionary *selectedItem = self->blogEntries[path.item];
    // Get reference to the destination view controller
    EntryViewController *vc = segue.destinationViewController;
    NSString *url = selectedItem[@"link"];
    vc.entryURL = url;
//    NSArray *values = [ selectedItem[@"link"] allValues];
    NSLog(@"%@",  url);

}

@end

