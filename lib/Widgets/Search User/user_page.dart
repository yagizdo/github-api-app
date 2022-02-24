import 'package:flutter/material.dart';
import 'package:github_app/Models/userModel.dart';
import 'package:github_app/Widgets/Search%20User/components/profile_comp.dart';

import 'components/bio_comp.dart';

class UserPage extends StatelessWidget {
  UserPage({Key? key, required this.user}) : super(key: key);
  UserModel? user;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20),
      width: size.height / 1,
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserProfileComp(
            user: user,
          ),
          BioComp(
            user: user,
          ),
        ],
      ),
    );
  }
}
