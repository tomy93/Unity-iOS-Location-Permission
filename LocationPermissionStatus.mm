#import <CoreLocation/CoreLocation.h>

extern "C" {
    int _getLocationPermissionStatus() {
        int authorizationStatus = -1;
        if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
            authorizationStatus = 0; // Not determined
        } else if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusRestricted || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied) {
            authorizationStatus = 1; // Denied or restricted
        } else if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways) {
            authorizationStatus = 2; // Authorized
        }
        return authorizationStatus;
    }

    
    // Method to access iOS settings
    void _accessIOSSettings() {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:@{} completionHandler:nil];
    }
    
}
