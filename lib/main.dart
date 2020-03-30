import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:http/http.dart';

void main() => runApp(MyApp());

String kakaoUrl = 'http://10.0.2.2:3000/web';

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
