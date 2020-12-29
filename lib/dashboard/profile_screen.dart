import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 80),
            Stack(
              children: [
                SvgPicture.asset(
                  'assets/circle-credient.svg',
                  width: 150,
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  right: 10,
                  bottom: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(500),
                    child: Image.network(
                      'https://images.pexels.com/photos/5528969/pexels-photo-5528969.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
                      width: 130,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        ProfileCommonText(
                          text: 'Bhupendra Patel',
                        ),
                        Spacer(),
                        Icon(
                          CupertinoIcons.pencil,
                          size: 20,
                          color: Color(0xFF7A49E7),
                        )
                      ],
                    ),
                  ),
                  divider(),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ProfileCommonText(
                      text: 'bhupendra@gmail.com',
                    ),
                  ),
                  divider(),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ProfileCommonText(
                      text: '+91 12345 67890',
                    ),
                  ),
                  divider(),
                  Center(
                    child: Text(
                      'Change Password',
                      style: TextStyle(
                        color: Color(0xFF7A49E7),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Center(
                    child: FlatButton(
                      onPressed: null,
                      child: Text(
                        "Sign out",
                        style: TextStyle(color: Color(0xFFFD3028)),
                      ),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Color(0xFFFD3028),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget divider() {
    return Divider(
      thickness: 1,
      color: Colors.grey[300],
      height: 30,
    );
  }
}

class ProfileCommonText extends StatelessWidget {
  final String text;
  const ProfileCommonText({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Color(0xFF050505),
        fontSize: 14,
      ),
    );
  }
}
