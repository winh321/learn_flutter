In dart


class _HomeState extends State<Home> {
  String data = "Click";

  var channel = MethodChannel("GETT");
  getData() async {
    data = await channel.invokeMethod("getData");
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: getData,
        child: Text(data),
      ),
    );
  }
}

In kotlin

package com.example.xxx.exx
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val channelName = "GETT"
    override fun configureFlutterEngine(flutterEngine : FlutterEngine){
        super.configureFlutterEngine(flutterEngine)

        var channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger,channelName)
        channel.setMethodCallHandler{ call,result->
            if (call.method == "getData"){
                result.success("Love");
            }
        }
    }
}
