import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:cinemagic22/blocs/user_bloc.dart';
import 'package:cinemagic22/config/config.dart';
import 'package:cinemagic22/pages/done.dart';
import 'package:cinemagic22/pages/login.dart';
import 'package:cinemagic22/pages/create_account.dart';
import 'package:cinemagic22/utils/next_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:cinemagic22/widgets/language.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../config/config.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {


  void _onSkipPressed() async {
    final UserBloc ub = Provider.of<UserBloc>(context, listen: false);
    await ub.loginAsGuestUser().then((_) {
      nextScreen(context, DonePage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            elevation: 0,
            actions: [
              TextButton(
                style: ButtonStyle(),
                child: Text(
                  'skip',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ).tr(),
                onPressed: () => _onSkipPressed(),
              ),
              IconButton(
                alignment: Alignment.center,
                padding: EdgeInsets.all(0),
                iconSize: 18,
                icon: FaIcon(FontAwesomeIcons.globeAsia),
                onPressed: () {
                  nextScreenPopup(context, LanguagePopup());
                },
              ),
            ],
          ),
        ),
        body: Container(

          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: AssetImage("assets/images/logo.png"),
                        height: 230,
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              AnimatedTextKit(
                                animatedTexts: [
                                  ColorizeAnimatedText("Cinemagickh".tr(), textStyle: TextStyle(
                                    fontSize: 40,
                                    fontFamily: "Romnea"
                                  ), colors: [
                                    Colors.greenAccent,
                                    Colors.pinkAccent
                                  ]),
                                  ColorizeAnimatedText("NEWS_APP".tr(), textStyle: TextStyle(
                                    fontSize: 40,
                                      fontFamily: "Romnea"
                                  ), colors: [
                                    Colors.pinkAccent,
                                    Colors.blue
                                  ])
                                ],

                              )

                            ],

                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 35, right: 35, top: 30),
                            child: DefaultTextStyle(
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color:
                                  Theme.of(context).colorScheme.secondary), child: AnimatedTextKit(
                              animatedTexts: [
                                TyperAnimatedText('First we want to tell you this app is create for movielover in Cambodia. to make them easy to fine any news or promotions about movie or cinema. ',),
                              ],

                            ),
                            )


                            )
                        ],
                      ),
                    ],
                  )
              ),

              Spacer(),

              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      width: MediaQuery.of(context).size.width * 0.80,
                      height: 45,
                      
                      child: TextButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(

                            borderRadius: BorderRadius.circular(30)
                          )),
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Theme.of(context).primaryColor),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "login to continue",
                              style: TextStyle(
                                  letterSpacing: -0.7,
                                  wordSpacing: 1,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ).tr(),
                            SizedBox(
                              width: 15,
                            ),
                        FaIcon(FontAwesomeIcons.arrowRight,
                              color: Colors.white,
                            )
                          ],
                        ),
                        onPressed: () => nextScreen(context, LoginPage()),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "don't have an account?",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.secondary),
                        ).tr(),
                        TextButton(
                          child: Text(
                            'create',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.primary),
                          ).tr(),
                          onPressed: () =>
                              nextScreen(context, CreateAccountPage()),
                        )
                      ],
                    )
                  ],
                ),
              ),


            ],
          ),
        )
    );
  }
}

