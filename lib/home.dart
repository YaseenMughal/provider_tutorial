import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider_tutorial/screens/count_screen.dart';
import 'package:provider_tutorial/screens/favourite_screen.dart';
import 'package:provider_tutorial/screens/slider_screen.dart';
import 'package:provider_tutorial/screens/theme_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("Provider Tutorial"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Welcome To Provider Tutuorial",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(height: 35),
              button(context, CountScreen(), "Go to Count"),
              SizedBox(height: 20),
              button(context, FavouriteScreen(), "Go to Favourite"),
              SizedBox(height: 20),
              button(context, SliderScreen(), "Go to Slider"),
              SizedBox(height: 20),
              button(context, ThemeScreen(), "Go to ThemeMode"),
            ],
          ),
        ),
      ),
    );
  }
}

button(BuildContext context, onpressed, text) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => onpressed));
    },
    child: Container(
      height: 80.0,
      width: double.infinity,
      color: Colors.teal[300],
      child: Center(
          child: Text(
        text,
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
      )),
    ),
  );
}
