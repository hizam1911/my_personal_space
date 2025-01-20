import 'package:flutter/material.dart';
import 'package:my_personal_space/pages/home_screen.dart';
import 'package:my_personal_space/pages/login_screen.dart';
import 'package:my_personal_space/pages/register_screen.dart';
import 'package:my_personal_space/pages/splash_screen.dart';
import 'package:hive/hive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    _createAdminAccount();
    super.initState();
  }

  Future<void> _createAdminAccount() async {
    final adminBox = await Hive.openBox<Map>('admin');

    // Check if the admin account already exists
    if (!adminBox.containsKey('credentials')) {
      // Create admin account with username and password both as 'dbadmin'
      await adminBox.put('credentials', {'username': 'dbadmin', 'password': 'dbadmin'});
      print('Admin account created.');
    } else {
      print('Admin account already exists.');
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Personal Space',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(), // '/'
        LoginScreen.routeName: (context) => LoginScreen(), // '/login'
        RegisterScreen.routeName: (context) => const RegisterScreen(), // '/register'
        HomeScreen.routeName: (context) => const HomeScreen(), // '/home'
      },
    );
  }
}
