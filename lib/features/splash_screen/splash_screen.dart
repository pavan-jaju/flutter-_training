import 'package:e_comm_app/features/_common/app_state.dart';
import 'package:e_comm_app/features/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Get.find<AppState>().initializeData();
    //.then((value) => Get.off(LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("E-Comm App", style: Get.textTheme.headline3),
              SizedBox(height: 16),
              CircularProgressIndicator(),
            ],
          ),
          // child: ElevatedButton(
          //   child: Text("Hello"),
          //   onPressed: () async {
          //     await Get.find<ProductRepo>().fetchProducts();
          //
          //     // debugPrint("going to login");
          //     // await Navigator.pushReplacement(
          //     //     context, MaterialPageRoute(builder: (_) => LoginPage()));
          //     // debugPrint("returned form  login");
          //
          //     // debugPrint("going to forgot pass");
          //     // dynamic res = await Navigator.of(context)
          //     //     .push(MaterialPageRoute(builder: (_) => ForgotPassword()));
          //     // if (res == true) {
          //     //   debugPrint("success");
          //     // } else {
          //     //   debugPrint("failed");
          //     // }
          //   },
          // ),
        ),
      ),
    );
  }
}
