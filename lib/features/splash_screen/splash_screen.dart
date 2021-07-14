import 'package:e_comm_app/features/login/login_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Hello"),
          onPressed: () async {
            debugPrint("going to login");
            await Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => LoginPage()));
            debugPrint("returned form  login");

            // debugPrint("going to forgot pass");
            // dynamic res = await Navigator.of(context)
            //     .push(MaterialPageRoute(builder: (_) => ForgotPassword()));
            // if (res == true) {
            //   debugPrint("success");
            // } else {
            //   debugPrint("failed");
            // }
          },
        ),
      ),
    );
  }
}
