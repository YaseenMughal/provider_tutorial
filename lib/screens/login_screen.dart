import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/home.dart';
import 'package:provider_tutorial/provider/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController tfcemail = TextEditingController();

  TextEditingController tfcpassword = TextEditingController();

  bool _toggle = true;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
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
              TextFormField(
                controller: tfcemail,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail),
                    hintText: "Enter your Email Address",
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: tfcpassword,
                obscureText: _toggle,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          _toggle = !_toggle;
                        });
                      },
                      child: Icon(_toggle
                          ? Icons.visibility
                          : Icons.visibility_off_outlined),
                    ),
                    hintText: "Enter your Password",
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 35),
              InkWell(
                onTap: () {
                  authProvider.login(
                      tfcemail.text.toString(), tfcpassword.text.toString());
                },
                child: Container(
                  height: 60.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                      child: authProvider.loading
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              "LOGIN",
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
