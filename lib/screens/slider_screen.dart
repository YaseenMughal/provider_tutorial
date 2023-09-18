import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/provider/slider_provider.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<SliderProvider>(context);
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Tutorial"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<SliderProvier>(
            builder: (context, value, child) {
              return Slider(
                min: 0,
                max: 1,
                value: value.value,
                onChanged: (val) {
                  value.setValue(val);
                },
              );
            },
          ),
          Consumer<SliderProvier>(builder: (context, value, child) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(value.value)),
                    child: Center(
                        child: Text(
                      "Yaseen",
                      style: TextStyle(fontSize: 30),
                    )),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(value.value)),
                    child: Center(
                        child: Text(
                      "Ismail",
                      style: TextStyle(fontSize: 30),
                    )),
                  ),
                )
              ],
            );
          })
        ],
      ),
    );
  }
}
