import 'package:flutter/material.dart';
import 'package:mood_matic/widgets/textfield.dart';

import '../../../models/usermodel.dart';
import '../../../services/auth.dart';
import '../../../widgets/button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserModel? user;
  TextEditingController text = TextEditingController();

  @override
  void initState() {
    Auth().getUserDetails().then((value) {
      user = value;
    }).whenComplete(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: false,
        title: Text(
          'Welcome ${user?.username}',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notification_add,
                color: Colors.white,
              )),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 300,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: const Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(Icons.search),
                      SizedBox(width: 10),
                      Text('Search',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                /* Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/filter.png',
                          width: 20, height: 20, color: Colors.black),
                      Text('Filter',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/sort.png',
                          width: 20, height: 20, color: Colors.black),
                      Text('Sort',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ), */
              ],
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TextInput(
              hintText: 'Enter your mood',
              controller: text,
            ),
          ),
          const SizedBox(
            height: 11,
          ),
          Button(
            title: "Analyze",
            onPressed: () async {},
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            isLoading: false,
          ),
        ],
      ),
    );
  }
}
