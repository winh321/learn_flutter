In dart
  
var channel = MethodChannel("babadevs");
  showToast(){
    channel.invokeMethod("showToast",{"message":"Message From Dart"});
  }

In kotlin

package com.example.xxx.exx
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val channelName = "babadevs"
    override fun configureFlutterEngine(flutterEngine : FlutterEngine){
        super.configureFlutterEngine(flutterEngine)

        var channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger,channelName)
        channel.setMethodCallHandler{ call,result->
            var args = call.arguments as Map<String,String>
            if (call.method == "showToast"){
                Toast.makeText(this,args["message"],Toast.LENGTH_LONG).show();
            }
        }
    }
}
