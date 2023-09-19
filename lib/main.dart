import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/home.dart';
import 'package:provider_tutorial/provider/auth_provider.dart';
import 'package:provider_tutorial/provider/count_provider.dart';
import 'package:provider_tutorial/provider/favourite_provider.dart';
import 'package:provider_tutorial/provider/slider_provider.dart';
import 'package:provider_tutorial/provider/themeMode_provider.dart';
import 'package:provider_tutorial/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountProvider()),
          ChangeNotifierProvider(create: (_) => SliderProvier()),
          ChangeNotifierProvider(create: (_) => FavouriteProvider()),
          ChangeNotifierProvider(create: (_) => ThemeChangeProvider()),
          ChangeNotifierProvider(create: (_) => AuthProvider())
        ],
        child: Builder(
          builder: (BuildContext context) {
            final themeChanger = Provider.of<ThemeChangeProvider>(context);
            return MaterialApp(
              themeMode: themeChanger.themeMode,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  primarySwatch: Colors.teal,
                  appBarTheme: AppBarTheme(color: Colors.teal),
                  iconTheme: IconThemeData(color: Colors.red)),
              darkTheme: ThemeData(
                  brightness: Brightness.dark,
                  primarySwatch: Colors.teal,
                  appBarTheme: AppBarTheme(color: Colors.red),
                  iconTheme: IconThemeData(color: Colors.orange)),
              home: HomeScreen(),
            );
          },
        ));
  }
}
