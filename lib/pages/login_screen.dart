import 'package:flutter/material.dart';
import 'package:my_personal_space/services/authentication_service.dart';
import 'package:my_personal_space/widgets/username_tec.dart';
import 'package:my_personal_space/widgets/password_tec.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';
  LoginScreen({super.key});

  final formKey = GlobalKey<FormState>();
  TextEditingController usernameTEC = TextEditingController();
  TextEditingController passwordTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PopScope(
        child: Scaffold(
          appBar: AppBar(title: Text("Login Screen"), automaticallyImplyLeading: false,),
          body: Column(
            children: [
              Text("Welcome to My Personal Space!"),
              const SizedBox(height: 20,),
              Icon(Icons.people),
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      UsernameTEC(usernameTEC: usernameTEC,),
                      PasswordTEC(passwordTEC: passwordTEC,),
                      ElevatedButton(
                          onPressed: () async {
                            bool valid = formKey.currentState!.validate();
                            if (valid) {
                              bool loggedIn = await AuthenticationService().login(usernameTEC.text, passwordTEC.text);
                              if (loggedIn) {
                                Navigator.pushReplacementNamed(context, '/home');
                              }
                            }
                          },
                          child: Text("Submit")
                      ),
                    ],
                  )
              ),
            ],
          ),
        ),
    );
  }
}
