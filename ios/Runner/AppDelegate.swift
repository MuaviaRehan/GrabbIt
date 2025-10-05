import Flutter
import UIKit

import Flutter_local_notifications

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

FlutterLocalNotificationsPlugin.setPluginRegistrationCallback{(registry) in
GeneratedPluginRegistrant.Registrant.register(with: registry)}

    GeneratedPluginRegistrant.register(with: self)
    if #available(iOS 10.0,*){
UNUserNotificationCenter,current().Delegate =self as ? UNUserNotificationCenterDelegate
    }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
