import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:github_app/Models/userModel.dart';

class UserSearch extends StatefulWidget {
  UserSearch({Key? key}) : super(key: key);

  @override
  State<UserSearch> createState() => _UserSearchState();
}

class _UserSearchState extends State<UserSearch> {
  Dio? dio;
  bool isLoading = false;
  bool isSearching = false;
  UserModel? user;

  @override
  void initState() {
    super.initState();
    BaseOptions options = BaseOptions(baseUrl: 'https://api.github.com/');
    dio = Dio(options);
    getUser('yagizdo');
  }

  Future<void> getUser(String name) async {
    print('get çalıştı');
    setState(() {
      isLoading = true;
    });
    final response = await dio?.get('users/$name');
    if (response?.statusCode == 200) {
      user = UserModel.fromJson(response?.data);
      print('data geldi');
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isSearching
          ? AppBar(
              // The search area here
              backgroundColor: Colors.black,
              title: Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            setState(() {
                              isSearching = false;
                            });
                          },
                        ),
                        hintText: 'Search...',
                        border: InputBorder.none),
                  ),
                ),
              ))
          : AppBar(
              backgroundColor: Colors.black,
              title: const Text('test'),
              actions: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          isSearching = true;
                        });
                      },
                      icon: const Icon(Icons.search))
                ]),
      body: isLoading == true
          ? CircularProgressIndicator()
          : Text(
              'Username : ${user?.name}',
              style: TextStyle(fontSize: 25),
            ),
    );
  }
}
