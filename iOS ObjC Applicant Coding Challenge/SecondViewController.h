//
//  SecondViewController.h
//  iOS ObjC Applicant Coding Challenge
//
//  Created by Luis Cubillo on 12/22/19.
//  Copyright © 2019 Luis Cubillo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/Mapkit.h>
#import <CoreLocation/CoreLocation.h>

@interface SecondViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate> {
    CLLocationManager *locationManager;
}
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UITextField *searchText;
- (IBAction)searchPlaces:(id)sender;



@end

