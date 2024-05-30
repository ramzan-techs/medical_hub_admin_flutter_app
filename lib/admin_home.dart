import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:mh_admin_panel/approved_dcotors.dart';
import 'package:mh_admin_panel/constants.dart';
import 'package:mh_admin_panel/declined_doctors.dart';
import 'package:mh_admin_panel/login_screen.dart';
import 'package:mh_admin_panel/main.dart';
import 'package:mh_admin_panel/pending_doctors.dart';

class AdminHomeNav extends StatefulWidget {
  const AdminHomeNav({super.key});

  @override
  State<AdminHomeNav> createState() => _AdminHomeNavState();
}

class _AdminHomeNavState extends State<AdminHomeNav> {
  int _selectedIndex = 0;
  final List<Widget> _screensList = [
    const PendingDoctors(),
    const ApprovedDoctors(),
    const DeclinedDoctors(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            SizedBox(
              width: mq.width,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Constants().secondaryColor,
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 10,
                  right: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: mq.width * 0.6,
                          child: const Text(
                            "Hello Admin",
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ),
                        ),
                        const Text(
                          "Hava a good day!",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Logout"),
                                  content:
                                      const Text('Are you sure to logout?'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      const LoginScreen()));
                                        },
                                        child: const Text("Yes")),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("No"))
                                  ],
                                );
                              });
                        },
                        child: const Icon(
                          Icons.logout,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
            ),

            // screens

            Expanded(child: _screensList[_selectedIndex])
          ],
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              boxShadow: [
                BoxShadow(
                    blurRadius: 10, color: Color.fromARGB(118, 48, 207, 96))
              ]),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 20),
            child: GNav(
                selectedIndex: _selectedIndex,
                textSize: 30,
                color: Constants().secondaryTextColor,
                rippleColor:
                    Colors.white, // tab button ripple color when pressed
                hoverColor: const Color.fromARGB(
                    255, 42, 218, 68), // tab button hover color
                haptic: false, // haptic feedback
                tabBorderRadius: 30,
                tabBackgroundColor: Colors.white,
                tabActiveBorder: Border.all(color: Colors.green),

                // tabActiveBorder: Border.all(color: ),
                // tab button border
                // tab button shadow
                curve: Curves.easeOutExpo, // tab animation curves
                duration:
                    const Duration(milliseconds: 400), // tab animation duration
                gap: 8, // the tab button gap between icon and text

                activeColor: Colors.green, // selected icon and text color
                iconSize: 30, // tab button icon size
                // selected tab background color
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                  log(_selectedIndex.toString());
                }, // navigation bar padding
                tabs: const [
                  GButton(
                    icon: Icons.pending,
                    text: 'Pending',
                  ),
                  GButton(
                    icon: Icons.check_circle_outline,
                    text: 'Approved',
                  ),
                  GButton(
                    icon: Icons.info_outline,
                    text: 'Declined',
                  ),
                ]),
          ),
        ));
  }
}
