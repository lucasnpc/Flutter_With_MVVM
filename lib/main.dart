import 'package:api_example/ui/Home/HomePage.dart';
import 'package:api_example/ui/Home/HomePageViewModel.dart';
import 'package:api_example/ui/Login/LoginPage.dart';
import 'package:api_example/ui/Login/store/LoginResultStore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoginResultStore>.value(
          value: LoginResultStore(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomePageViewModel(),
          child: HomePage(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
      ),
    );
  }
}
