import 'package:flutter/material.dart';
import 'package:news/screens/home_screen.dart';
import '../const.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key, required this.onCategoryCliced})
      : super(key: key);
  final Function onCategoryCliced;

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250,
          color: Const.PRIMARY_COLOR,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                  setState(() {});
                },
                child: const Row(
                  children: [
                    Icon(
                      Icons.list,
                      size: 25,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      "Categories",
                      style: TextStyle(color: Colors.black, fontSize: 21),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Icon(
                    Icons.settings,
                    size: 25,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    "Settings",
                    style: TextStyle(color: Colors.black, fontSize: 21),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
