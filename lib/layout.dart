import 'package:flutter/material.dart';
import 'package:interface_example1/widgets/large_screen.dart';
import 'package:interface_example1/widgets/side_menu.dart';
import 'package:interface_example1/widgets/small_screen.dart';
import 'package:interface_example1/widgets/top_nav.dart';
import 'helpers/responsivness.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  SiteLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: topNavigationBar(context, scaffoldKey),
      drawer: const Drawer(child: SideMenu()),
      body: const ResponsiveWidget(
        largeScreen: LargeScreen(),
        smallScreen: SmallScreen(),
        mediumScreen: LargeScreen(),
        customScreen: LargeScreen(),
      ),
    );
  }
}
