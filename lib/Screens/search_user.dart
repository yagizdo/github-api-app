import 'package:flutter/material.dart';

class UserSearch extends StatefulWidget {
  UserSearch({Key? key}) : super(key: key);

  @override
  State<UserSearch> createState() => _UserSearchState();
}

class _UserSearchState extends State<UserSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('test'), actions: []),
    );
  }
}
