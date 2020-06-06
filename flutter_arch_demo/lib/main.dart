import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterarchdemo/common/Routes.dart';
import 'package:flutterarchdemo/view/splash_page.dart';
import 'package:flutterarchdemo/viewmodel/theme_viewmodel.dart';
import 'package:provider/provider.dart';
import 'base/http/http.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{

//  @override
//  void initState() async {
//    super.initState();
//    Http.getInstance().get("http://www.baidu.com", {}, success: (dynamic json){
//      print(jsonEncode(json).toString());
//    }, fail: (reason, code){
//      print(reason);
//    }, after: (){});
//  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeViewModel>(
      create: (_) => ThemeViewModel(),
      child: Builder(
        builder: (context)=>MaterialApp(
          onGenerateRoute: (setting) {
            return Routes.findRoutes(setting);
          },
          theme: Provider.of<ThemeViewModel>(context, listen: true).themeData,
          home: SplashPage(),
        ),
      ),
    );
  }
}


