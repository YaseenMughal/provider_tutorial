import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ValueNotifyListenerScreen extends StatelessWidget {
  ValueNotifyListenerScreen({super.key});

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> _toggle = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Tutorial"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ValueListenableBuilder(
                valueListenable: _toggle,
                builder: (context, value, child) {
                  return TextFormField(
                    style: TextStyle(fontSize: 20.0),
                    obscureText: _toggle.value,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      suffixIcon: InkWell(
                        onTap: () {
                          _toggle.value = !_toggle.value;
                        },
                        child: Icon(_toggle.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility),
                      ),
                      hintText: "PROVIDER TUTORIAL",
                      border: OutlineInputBorder(),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              ValueListenableBuilder(
                valueListenable: _counter,
                builder: (context, value, child) {
                  return Text(
                    _counter.value.toString(),
                    style: TextStyle(fontSize: 50.0),
                  );
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
