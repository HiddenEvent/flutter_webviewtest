import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:http/http.dart';

void main() => runApp(MyApp());
//안드로이드에서는 localhost를 사용하지 않는다.. 이렇게 한다..
String kakaoUrl = 'http://10.0.2.2:3000/web';
//참고 할 자료!!
//String _localhost() {
//  if (Platform.isAndroid)
//    return 'http://10.0.2.2:3000';
//  else // for iOS simulator
//    return 'http://localhost:3000';
//}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (_) => WebviewScaffold(
              withLocalUrl: true,
              url: kakaoUrl,
              withJavascript: true,
              javascriptChannels: Set.from([
                JavascriptChannel(
                    name: 'jams',
                    onMessageReceived: (JavascriptMessage result) {
                      print("message ${result.message}");
                    }),
              ]),
            ),
      },
    );
  }
}
