// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/util/side_nav_item.dart';

class SideNav extends StatelessWidget {
  final List userData;
  const SideNav({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    var navItem = [
      ['images/home.png', 'Dashboard'],
      ['images/signal.png', 'Analytics'],
      ['images/message.png', 'Messages'],
      ['images/collection.png', 'Collection'],
      ['images/user.png', 'Users'],
    ];

    return Container(
      padding: EdgeInsets.all(20),
      color: Color(0xFF250b5a),
      child: Column(
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 33,
                  backgroundColor: Color(0xFF050A18),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/sec.jpg'),
                    radius: 28,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userData[0]['name'],
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      userData[0]['occupation'],
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: navItem.length,
            itemBuilder: (context, index) {
              return SideNavItem(
                icon: navItem[index][0],
                title: navItem[index][1],
              );
            },
          ),
          SizedBox(
            height: 30,
          ),
          const Divider(
            height: 0.5,
            thickness: 0.2,
            endIndent: 0,
            color: Color.fromARGB(80, 255, 255, 255),
          )
        ],
      ),
    );
  }
}
