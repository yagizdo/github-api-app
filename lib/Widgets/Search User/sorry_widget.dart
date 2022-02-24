import 'package:flutter/material.dart';

class SorryWidget extends StatelessWidget {
  const SorryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          alignment: Alignment.center,
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.only(top: 250),
            child: Column(
              children: const [
                Text(
                  'Sorry!',
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
                Text(
                  'User not found!',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )
              ],
            ),
          )),
    );
  }
}
