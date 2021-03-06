import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:github_app/Models/userModel.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

import '../Utils/debouncer.dart';
import '../Widgets/Search User/sorry_widget.dart';
import '../Widgets/Search User/user_page.dart';

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
  final _debouncer = Debouncer(milliseconds: 500);
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    BaseOptions options = BaseOptions(baseUrl: 'https://api.github.com/');
    dio = Dio(options);
  }

  Future<void> getUser(String name) async {
    print('get çalıştı');
    setState(() {
      isLoading = true;
    });
    try {
      final response = await dio?.get('users/$name');
      dio?.options.headers["user-agent"] = "request";
      if (response?.statusCode == 200) {
        user = UserModel.fromJson(response?.data);
        print('data geldi');
        print('data ${user?.name}');
      }
      setState(() {
        isLoading = false;
        errorMessage = null;
      });
    } on DioError catch (e) {
      setState(() {
        errorMessage = e.response?.statusMessage;
        isLoading = false;
      });
      print('Error Message ${e.response?.statusMessage}');
      print(e.response?.headers);
      print(e.response?.requestOptions);
    }
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
                      onChanged: (word) {
                        if (word != '') {
                          _debouncer.run(() => (getUser(word)));
                          print('kelime $word');
                        }
                      },
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              setState(() {
                                isSearching = false;
                                isLoading = false;
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
                title: const Text('Search User'),
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
            ? Container(
                alignment: Alignment.center,
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 300,
                      height: 300,
                      child: LiquidCircularProgressIndicator(
                        value: 0.7,
                        center: Text(
                          'Loading..',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        backgroundColor: Colors.white,
                      ),
                    )
                  ],
                ),
              )
            : errorMessage != null || user?.name == null
                ? SorryWidget()
                : UserPage(
                    user: user,
                  ));
  }
}
