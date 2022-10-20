// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/pages/account_edit.dart';
import 'package:todo_app/util/profile_tiles.dart';

class Profile extends StatefulWidget {
  final List userData;
  const Profile({super.key, required this.userData});

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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AccountEdit(type: 'edit'),
                      ),
                    );
                  },
                  child: Text(
                    'Tap to edit',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  widget.userData[0]['name'],
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
                  widget.userData[0]['email'],
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w300,
                    fontSize: 13,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  widget.userData[0]['occupation'],
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w300,
                    fontSize: 13,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  widget.userData[0]['phone'],
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w300,
                    fontSize: 13,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                const Divider(
                  height: 0.5,
                  thickness: 0.5,
                  endIndent: 0,
                  color: Color.fromARGB(80, 255, 255, 255),
                )
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
            SizedBox(
              height: 35,
            ),
          ],
        ),
      ),
    );
  }
}
