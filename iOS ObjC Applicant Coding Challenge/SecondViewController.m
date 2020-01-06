//
//  SecondViewController.m
//  iOS ObjC Applicant Coding Challenge
//
//  Created by Luis Cubillo on 12/22/19.
//  Copyright © 2019 Luis Cubillo. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    [locationManager requestWhenInUseAuthorization];

    [locationManager startUpdatingLocation];
    _searchText.placeholder = @"Search Places";
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"Error: %@",error.description);
}

- (IBAction)searchPlaces:(id)sender {
    NSLog(@"Send: %@", _searchText.text);
    
    if ([_mapView.annotations count] > 0) {
        [_mapView removeAnnotations:_mapView.annotations];
    }
    
    __block int annotationCounter = 0;
    
    MKLocalSearchRequest *request =
                [[MKLocalSearchRequest alloc] init];
        request.naturalLanguageQuery = _searchText.text;
        request.region = _mapView.region;
        
        MKLocalSearch *search =
             [[MKLocalSearch alloc]initWithRequest:request];

        [search startWithCompletionHandler:^(MKLocalSearchResponse
             *response, NSError *error) {
            if (response.mapItems.count == 0) {
                
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"No Matches" message:@"There are no matches for your search" preferredStyle:UIAlertControllerStyleAlert ];
                UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                               handler:^(UIAlertAction * action) {}];

                [alert addAction:defaultAction];
                [self presentViewController:alert animated:YES completion:nil];
            }
               
           else
               NSLog(@"Elements: %lu", (unsigned long)response.mapItems.count);
               for (MKMapItem *item in response.mapItems)
               {
                   if (annotationCounter < 6) {
                       MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
                       [annotation setCoordinate: item.placemark.coordinate];
                       [annotation setTitle:item.name];
                       [self->_mapView addAnnotation:annotation];
                   }
                   
                   annotationCounter += 1;
                }
        }];
}
@end
