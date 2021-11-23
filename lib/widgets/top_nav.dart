import 'package:flutter/material.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/helpers/responsivness.dart';

import 'custom_text.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
      leading: !ResponsiveWidget.isSmallScreen(context)
          ? Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 14),
                  child: Image.asset(
                    "assets/icons/logo.png",
                    width: 28,
                  ),
                )
              ],
            )
          : IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                key.currentState!.openDrawer();
              },
            ),
      elevation: 0,
      title: Row(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Visibility(
              child: CustomText(
                  text: "Dash",
                  color: surface(2),
                  size: 20,
                  weight: FontWeight.bold)),
          Expanded(child: Container()),
          IconButton(
            icon: Icon(
              Icons.settings,
              color: textOnSurface.withOpacity(.7),
            ),
            onPressed: () {},
          ),
          Stack(
            children: [
              IconButton(
                  icon: Icon(Icons.notifications,
                      color: textOnSurface.withOpacity(.7)),
                  onPressed: () {}),
              Positioned(
                  top: 7,
                  right: 7,
                  child: Container(
                    width: 12,
                    height: 12,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: background,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: surface(2), width: 2)),
                  ))
            ],
          ),
          Container(
            width: 1,
            height: 22,
            color: surface(2),
          ),
          const SizedBox(
            width: 24,
          ),
          CustomText(
            text: "Federico Galvagni",
            color: surface(2),
          ),
          const SizedBox(
            width: 16,
          ),
          Container(
              decoration: BoxDecoration(
                  color: surface(2), borderRadius: BorderRadius.circular(30)),
              child: Container(
                  padding: const EdgeInsets.all(2),
                  margin: const EdgeInsets.all(2),
                  child: CircleAvatar(
                    backgroundColor: surface(2),
                    child: Icon(
                      Icons.person_outline,
                      color: highEmphasis(textOnSurface),
                    ),
                  )))
        ],
      ),
      iconTheme: IconThemeData(color: textOnSurface),
      backgroundColor: surface(2),
    );
