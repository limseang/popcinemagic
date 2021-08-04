import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:cinemagic22/blocs/ads_bloc.dart';
import 'package:cinemagic22/blocs/category_bloc.dart';
import 'package:cinemagic22/blocs/notification_bloc.dart';
import 'package:cinemagic22/blocs/settings_bloc.dart';
import 'package:cinemagic22/blocs/user_bloc.dart';
import 'package:cinemagic22/config/ad_config.dart';
import 'package:cinemagic22/services/app_service.dart';
import 'package:cinemagic22/services/notification_service.dart';
import 'package:cinemagic22/tabs/profile_tab.dart';
import 'package:cinemagic22/tabs/search_tab.dart';
import 'package:cinemagic22/tabs/video_tab.dart';
import 'package:cinemagic22/utils/snacbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../tabs/bookmark_tab.dart';
import '../tabs/home_tab.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  int selectedIndex = 0;
  PageController? _pageController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final List<IconData> iconList = [
    FontAwesomeIcons.home,
    FontAwesomeIcons.youtube,
    FontAwesomeIcons.search,
    FontAwesomeIcons.heart,
    FontAwesomeIcons.user,
  ];



  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    AppService().checkInternet().then((hasInternet) {
      if (hasInternet!) {
        context.read<CategoryBloc>().fetchData();
      }else{
        openSnacbar(scaffoldKey, 'no internet'.tr());
      }
    });

    Future.delayed(Duration(milliseconds: 0)).then((_){
      NotificationService().initFirebasePushNotification(context)
      .then((_) => context.read<NotificationBloc>().checkSubscription())
      .then((_){
        context.read<SettingsBloc>().getPackageInfo();
        if (!context.read<UserBloc>().guestUser) {
          context.read<UserBloc>().getUserData();
        }
      });
    }).then((_){

      // if(AdConfig.isAdsEnabled){
      //   AdConfig().initAdmob().then((value) => context.read<AdsBloc>().initiateAds());
      // }
      
    });
    
  }

  

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      
    });
    _pageController!.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
  }


  Future _onWillPop () async{
    if(selectedIndex != 0){
      setState (()=> selectedIndex = 0);
      _pageController!.animateToPage(0, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
    }else{
      await SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop', true);
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async => await _onWillPop(),
          child: Scaffold(

              key: scaffoldKey,
              bottomNavigationBar: _bottonNavigationBar(context),
              body: PageView(
                physics: NeverScrollableScrollPhysics(),
                allowImplicitScrolling: false,
                controller: _pageController,
                children: <Widget>[
                  HomeTab(),
                  VideoTab(),
                  SearchTab(),
                  BookmarkTab(),
                  SettingPage()
                ],
              ),
            
          ),
    );
  }

  AnimatedBottomNavigationBar _bottonNavigationBar(BuildContext context) {
    return AnimatedBottomNavigationBar(
      icons: iconList,
      gapLocation: GapLocation.none,
      activeIndex: selectedIndex,
      iconSize: 22,
      backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      activeColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
      inactiveColor: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
      splashColor: Theme.of(context).primaryColor,
      onTap: (index) => onItemTapped(index),
    );
  }

}