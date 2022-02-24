import 'package:flutter/material.dart';
import 'package:github_app/Models/userModel.dart';

class InfoComp extends StatelessWidget {
  InfoComp({Key? key, required this.user}) : super(key: key);

  UserModel? user;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
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
          Row(),
          Row(),
        ],
      ),
    );
  }
}
