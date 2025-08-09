import 'package:flutter/material.dart';

class appbarofapp extends StatefulWidget {
  const appbarofapp({super.key});

  @override
  State<appbarofapp> createState() => _appbarofappState();
}

class _appbarofappState extends State<appbarofapp> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //search box
        Expanded(
          child: Container(
            margin: EdgeInsets.fromLTRB(15, 1, 1, 1),
            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: SearchBar(
              leading: Icon(Icons.search),
              hintText: 'Search',

              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
        ),
        SizedBox(width: 20),
        //profile id
        Container(
          padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: CircleAvatar(
            backgroundColor: Colors.deepOrangeAccent,
            child: Icon(Icons.person, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
