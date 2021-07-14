import 'package:e_comm_app/features/forgot_password/forgot_password.dart';
import 'package:e_comm_app/features/home/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login here"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 25),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "your@email.com",
                labelText: "Email",
                prefix: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                  hintText: "your password...",
                  labelText: "Password",
                  prefix: Icon(Icons.vpn_key)),
              obscureText: true,
            ),
            SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => HomeScreen()));
                },
                child: Text("Login")),
            SizedBox(height: 16),
            MaterialButton(
              onPressed: () async {
                // Navigator.pop(context);

                // debugPrint("going to forgot pass");
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => ForgotPassword()));
                // if (res == true) {
                //   debugPrint("success");
                // } else {
                //   debugPrint("failed");
                // }
              },
              child: Text("Forgot Password?"),
            )
          ],
        ),
      ),
    );
  }
}
