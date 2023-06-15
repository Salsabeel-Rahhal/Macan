import 'package:flutter/material.dart';

import '../../controller/user_controller.dart';
import '../../data/model/user_model.dart';

class profile extends StatefulWidget {
  profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  String? token;
  final _keyForm = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  // bool visible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<User>(
        future: UserController().getUser(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.error,
                  size: 100,
                  color: Colors.red,
                ),
                Text("An error occured, please tru later")
              ],
            ));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return Form(
            key: _keyForm,
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  toolbarHeight: 10,
                ),
                const Center(
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Text(
                          'Edit Profile',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ))),
                const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/person.png'),
                    backgroundColor: Color.fromRGBO(143, 148, 251, .6)),
                Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Name',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        Container(
                            width: 350,
                            height: 40,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ))),
                            child: Row(children: [
                              Expanded(
                                  child: TextButton(
                                      onPressed: () {
                                        // Navigator.of(context).pushReplacement(
                                        //     MaterialPageRoute(builder: (context) =>
                                        //         EditNameFormPage()));
                                      },
                                      child: Text(
                                        '${snapshot.data!.userName}',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            height: 1.4,
                                            color: Colors.black),
                                      ))),
                              const Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.grey,
                                size: 40.0,
                              )
                            ]))
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        Container(
                            width: 350,
                            height: 40,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ))),
                            child: Row(children: [
                              Expanded(
                                  child: TextButton(
                                      onPressed: () {
                                        // Navigator.of(context).pushReplacement(
                                        //     MaterialPageRoute(builder: (context) =>
                                        //         EditEmailFormPage()));
                                      },
                                      child: Text(
                                        '${snapshot.data!.email}',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            height: 1.4,
                                            color: Colors.black),
                                      ))),
                              const Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.grey,
                                size: 40.0,
                              )
                            ]))
                      ],
                    )),
                // buildUserInfoDisplay(user.email, 'Email', EditEmailFormPage()),
              ],
            ),
          );
        },
      ),
    );
  }
}
