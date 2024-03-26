import UIKit
import Flutter
import CoreBluetooth

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate,CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
    }
    
    private var centralManager: CBCentralManager!
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
      let batteryChannel = FlutterMethodChannel(name: "samples.flutter.dev/battery",
                                                    binaryMessenger: controller.binaryMessenger)
      
      batteryChannel.setMethodCallHandler({
        [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
        // This method is invoked on the UI thread.
          if (call.method == "getBatteryLevel"){
              self?.receiveBatteryLevel(result: result)
          }else if(call.method == "getBluetoothState"){
              self?.bluetoothLevel(result: result)
          }else{
              result(FlutterMethodNotImplemented)
              return
          }
    
      })
    centralManager = CBCentralManager(delegate: self, queue: nil,options: [CBCentralManagerOptionShowPowerAlertKey: false])
    GeneratedPluginRegistrant.register(withRegistry: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    private func receiveBatteryLevel(result: FlutterResult) {
      let device = UIDevice.current
      device.isBatteryMonitoringEnabled = true
      if device.batteryState == UIDevice.BatteryState.unknown {
        result(FlutterError(code: "UNAVAILABLE",
                            message: "Battery level not available.",
                            details: nil))
      } else {
        result(Int(device.batteryLevel * 100))
      }
    }
    private func bluetoothLevel(result: FlutterResult) {
        if(self.centralManager.state == .poweredOn) {
                   result("Yes");
                 } else {
                   result("No");
                 }
    }
}
