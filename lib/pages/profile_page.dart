// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/util/profile_tiles.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var settingsItem = [
    [
      'Login Details',
      'User name, Password',
      'MdiIcons.account',
    ],
    ['Help', 'FAQs, Helpdesk'],
    ['Legal Information', 'Terms & Conditions, Privacy Policy'],
    ['Face ID verification', 'Enabled'],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF050A18),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFF250b5a),
                        borderRadius: BorderRadius.circular(80),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 0, 0, 0),
                            blurRadius: 10.0,
                            spreadRadius: 2,
                            offset: Offset(
                              2,
                              2,
                            ),
                          )
                        ],
                      ),
                      padding: EdgeInsets.all(12.0),
                      child: Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Container(
                  width: 170,
                  height: 170,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/sec.jpg'),
                    ),
                    color: Color(0xFF250b5a),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Adenuga Adewumi Efe',
                  style: GoogleFonts.bebasNeue(
                    fontWeight: FontWeight.w600,
                    fontSize: 27,
                    letterSpacing: 2,
                    wordSpacing: 4,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Type to edit',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),

            ProfileTile(
              desc: settingsItem[0][1],
              name: settingsItem[0][0],
              icon: Icons.person,
            ),

            ProfileTile(
              name: settingsItem[1][0],
              desc: settingsItem[1][1],
              icon: Icons.headset_mic,
            ),

            ProfileTile(
              name: settingsItem[2][0],
              desc: settingsItem[2][1],
              icon: Icons.file_copy,
            ),

            ProfileTile(
              name: settingsItem[3][0],
              desc: settingsItem[3][1],
              icon: Icons.co_present_rounded,
            ),

            // ListView.builder(
            //   itemCount: settingsItem.length,
            //   physics: NeverScrollableScrollPhysics(),
            //   itemBuilder: (context, index) {
            //     return ProfileTile(
            //       name: settingsItem[index][0],
            //       desc: settingsItem[index][1],
            //       icon: settingsItem[index][2],
            //     );
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
