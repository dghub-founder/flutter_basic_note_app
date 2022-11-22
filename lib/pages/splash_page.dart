import 'package:flutter/material.dart';
import 'package:note/components/config/images.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacementNamed('/home');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(imageLogo, width: 100, height: 100)),
            SizedBox(
              height: 10,
            ),
            Text(
              'Note app',
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
          ],
        ),
      ),
    ));
  }
}
