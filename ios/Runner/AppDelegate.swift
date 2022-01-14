import UIKit
import Flutter
// google maps
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    // google maps API
    GMSServices.provideAPIKey("AIzaSyAlzti07hdnYG8OBN0RKRFbBTB-9QtL8gE")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
