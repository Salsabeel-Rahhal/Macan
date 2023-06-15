import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const MyHeaderDrawer(),
            myDrawerList(),
          ],
        ),
      ),
    ));
  }
}

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({super.key});

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple[700],
      width: 300,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/profile.jpg'),
              ),
            ),
          ),
          const Text(
            "User",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            "user email",
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

Widget myDrawerList() {
  return Container(
    width: 300,
    height: double.infinity,
    padding: const EdgeInsets.only(top: 15),
    child: ListView(
      children: const [ListTile()],
    ),
  );
}

Widget menuItem() {
  return Material(
    child: InkWell(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: const [
            Expanded(
                child: Icon(
              Icons.dashboard_outlined,
              size: 20,
              color: Colors.black,
            ))
          ],
        ),
      ),
    ),
    // padding: EdgeInsets.only(top: 15),
  );
}
