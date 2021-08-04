import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'package:cinemagic22/blocs/featured_bloc.dart';
import 'package:cinemagic22/blocs/latest_articles_bloc.dart';
import 'package:cinemagic22/blocs/popular_articles_bloc.dart';
import 'package:cinemagic22/blocs/tab_index_bloc.dart';
import 'package:cinemagic22/config/wp_config.dart';
import 'package:cinemagic22/pages/notifications.dart';
import 'package:cinemagic22/pages/search.dart';
import 'package:cinemagic22/utils/next_screen.dart';
import 'package:cinemagic22/widgets/drawer.dart';
import 'package:cinemagic22/widgets/tab_medium.dart';
import '../config/config.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {


  late TabController _tabController ;
  final scaffoldKey = GlobalKey<ScaffoldState>();

    List<Tab> _tabs = [
    Tab(
      text: "explore".tr(),
    ),
    Tab(
      text: WpConfig.selectedCategories['1'][1],
    ),
    Tab(
      text: WpConfig.selectedCategories['2'][1],
    ),
    Tab(
      text: WpConfig.selectedCategories['3'][1],
    ),
    Tab(
      text: WpConfig.selectedCategories['4'][1],
    ),
  ];


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, initialIndex: 0, vsync: this);
    _tabController.addListener(() { 
      context.read<TabIndexBloc>().setTabIndex(_tabController.index);
    });
    Future.delayed(Duration(milliseconds: 0)).then((value) {
      context.read<FeaturedBloc>().fetchData();
      context.read<PopularArticlesBloc>().fetchData();
      context.read<LatestArticlesBloc>().fetchData();
    });
  }


  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  static const colorizeColors = [
    Colors.amberAccent,
    Colors.blue,
    Colors.purpleAccent,
    Colors.red,
  ];

  

  

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(


        drawer: CustomDrawer(),
        key: scaffoldKey,
        body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            new SliverAppBar(

              automaticallyImplyLeading: false,
              centerTitle: false,
              titleSpacing: 0,
              title: AnimatedTextKit(animatedTexts: [
                ColorizeAnimatedText("CINEMAGICKH", textStyle: TextStyle(
                  fontFamily: "Romnea",
                  fontSize: 23
                ) ,
                    colors: colorizeColors),
                ]


              ),
              leading: IconButton(
                icon: FaIcon(FontAwesomeIcons.bars,size: 25,), onPressed: () {  scaffoldKey.currentState!.openDrawer(); },

                ),


              elevation: 1,
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.search,
                    size: 22,
                  ),
                  onPressed: () {
                    nextScreen(context, SearchPage());
                  },
                ),

                IconButton(
                padding: EdgeInsets.all(0),
                constraints: BoxConstraints(),
                icon: Icon(
                  Icons.doorbell,
                  size: 20,
                ),
                onPressed: () => nextScreen(context, Notifications()),
              ),
                SizedBox(
                  width: 10,
                )
              ],
              pinned: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              bottom: TabBar(
                labelStyle: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Theme.of(context).primaryColor,
                unselectedLabelColor: Colors.grey, //niceish grey
                isScrollable: true,
                // indicator: MD2Indicator(
                //   indicatorHeight: 3,
                //   indicatorColor: Theme.of(context).primaryColor,
                //   indicatorSize: MD2IndicatorSize.normal,
                // ),
                tabs: _tabs,
              ),
            ),
          ];
        }, 
        
        body: Builder(
          builder: (BuildContext context) {
            final innerScrollController = PrimaryScrollController.of(context);
            return TabMedium(
              sc: innerScrollController!,
              tc: _tabController,
              scaffoldKey: scaffoldKey,
            );
          },
        )
      ),
      );
  }

  @override
  bool get wantKeepAlive => true;
}

class MD2Indicator {

}

