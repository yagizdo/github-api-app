import 'package:flutter/material.dart';

import '../../../Models/userModel.dart';

class BioComp extends StatelessWidget {
  BioComp({Key? key, required this.user}) : super(key: key);
  UserModel? user;
  @override
  Widget build(BuildContext context) {
    return Text(
      user?.bio,
      style: TextStyle(color: Colors.white, fontSize: 20),
    );
  }
}
