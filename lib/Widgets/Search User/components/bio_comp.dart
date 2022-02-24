import 'package:flutter/material.dart';

import '../../../Models/userModel.dart';

class BioComp extends StatelessWidget {
  BioComp({Key? key, required this.user}) : super(key: key);
  UserModel? user;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Text(
        user?.bio,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
