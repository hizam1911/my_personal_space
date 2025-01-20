import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
        child: Scaffold(
          appBar: AppBar(title: Text("Home Screen"), automaticallyImplyLeading: false,),
          body: Column(
            children: [
              Text('HELLO WELCOME TO MY PERSONAL SPACE'),
              Text('THIS WEB APP IS STILL IN DEV.. STAY TUNED!!!'),
            ],
          ),
        )
    );
  }
}
