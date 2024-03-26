package com.example.batterylevel

import android.bluetooth.BluetoothAdapter
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "samples.flutter.dev/battery").setMethodCallHandler{
                call, result ->
            if(call.method == "getBatteryLevel") {
                val batteryLevel = getBatteryLevel();
                if(batteryLevel != -1){
                    result.success(batteryLevel);
                }else{
                    result.error("UNAVAIL","Battery level unavail",null);
                }
            }else if(call.method == "getBluetoothState"){
                val blueStatus = getBlueStatus();
                if(blueStatus != "not supported"){
                    result.success(blueStatus);
                }else{
                    result.error("UNAVAIL","not supported",null);
                }
            }
            else {
                result.notImplemented()
            }
        }
    }

    private fun getBatteryLevel(): Int{
        var batteryLevel = -1
        batteryLevel = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            val batteryManager = getSystemService(BATTERY_SERVICE) as BatteryManager
            batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
        } else {
            val intent = ContextWrapper(applicationContext).registerReceiver(
                null,
                IntentFilter(Intent.ACTION_BATTERY_CHANGED)
            )
            intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 /
                    intent!!.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
        }
        return  batteryLevel;
    }
    private fun getBlueStatus(): String{
        var bAdapter: BluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
        var batteryLevel = "no"
        if(bAdapter == null){
            batteryLevel = "not supported"
        }else{
            batteryLevel = bAdapter.isEnabled.toString()
        }
        return  batteryLevel;
    }

}
