import 'package:cinemagic22/blocs/user_bloc.dart';
import 'package:cinemagic22/pages/welcome.dart';
import 'package:cinemagic22/utils/next_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cinemagic22/blocs/user_bloc.dart';
import 'package:cinemagic22/pages/home.dart';
import 'package:cinemagic22/pages/welcome.dart';
import 'package:cinemagic22/utils/next_screen.dart';
import '../config/config.dart';
import 'home.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  
  Future _afterSplash() async {
    final UserBloc ub = context.read<UserBloc>();
    Future.delayed(Duration(milliseconds: 1500)).then((value) {
      ub.isSignedIn == true || ub.guestUser == true
          ? _gotoHomePage()
          : _gotoWelcomePage();
    });
  }

  void _gotoHomePage() {
    nextScreenReplace(context, HomePage());
  }

  void _gotoWelcomePage() {
    nextScreenReplace(context, WelcomePage());
  }

  @override
  void initState() {
    _afterSplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(
          height: 300,
          width: 300,
          image: AssetImage("assets/images/logo.png"),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}