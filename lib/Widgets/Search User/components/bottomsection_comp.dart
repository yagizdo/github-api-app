import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_app/Models/userModel.dart';

class BottomSection extends StatelessWidget {
  BottomSection({Key? key, required this.user}) : super(key: key);

  UserModel? user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        children: [
          SvgPicture.asset(
            'lib/Icons/repoicon.svg',
            color: Colors.amber,
            width: 40,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              'Repositories',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 150.0),
            child: Text(
              '${user?.publicRepos}',
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 15,
            ),
          )
        ],
      ),
    );
  }
}
