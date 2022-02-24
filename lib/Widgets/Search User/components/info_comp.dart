import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_app/Models/userModel.dart';

class InfoComp extends StatelessWidget {
  InfoComp({Key? key, required this.user}) : super(key: key);

  UserModel? user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        child: Column(
          children: [
            // Company and Location Section
            Row(
              children: [
                // Company
                const Icon(
                  Icons.apartment,
                  color: Colors.white38,
                  size: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 30),
                  child: Text(
                    user?.company,
                    style: const TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),

                // Location
                const Icon(
                  Icons.location_on_outlined,
                  color: Colors.white38,
                  size: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    user?.location,
                    style: const TextStyle(color: Colors.grey, fontSize: 17),
                  ),
                ),
              ],
            ),
            // Blog Section
            Padding(
              padding: const EdgeInsets.only(top: 11.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.link,
                    color: Colors.white38,
                    size: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      user?.blog,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),

            // Twitter Section
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'lib/Icons/twittericon.svg',
                    color: Colors.white38,
                    width: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      '@${user?.twitterUsername}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),

            // Followers and Following Section
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  // Company
                  const Icon(
                    Icons.person_outline_sharp,
                    color: Colors.white38,
                    size: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      '${user?.followers}',
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                  Text(
                    ' followers  .  ',
                    style: const TextStyle(color: Colors.grey, fontSize: 17),
                  ),
                  Text(
                    '${user?.following}',
                    style: const TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  Text(
                    ' following',
                    style: const TextStyle(color: Colors.grey, fontSize: 17),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
