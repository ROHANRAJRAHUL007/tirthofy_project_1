import 'package:flutter/material.dart';
import 'package:tirthofy_code_1/features/service/widgets/all_icons.dart';
import 'package:tirthofy_code_1/features/service/widgets/all_pages_button.dart';
import 'package:tirthofy_code_1/features/service/widgets/circle_avatar.dart';

class Servicebutton extends StatefulWidget {
  const Servicebutton({super.key});

  @override
  State<Servicebutton> createState() => _ServicebuttonState();
}

class _ServicebuttonState extends State<Servicebutton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: GridView.builder(
        padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: icons.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              if (index == icons.length - 1) {
                showModalBottomSheet(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  builder: (BuildContext context) {
                    return Column(
                      children: [
                        const SizedBox(height: 10),
                        //
                        const Text('More option'),
                        const SizedBox(height: 10),
                        Expanded(
                          child: GridView.builder(
                            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  mainAxisSpacing: 55,
                                  crossAxisSpacing: 55,
                                ),
                            itemCount: 8,
                            itemBuilder: (BuildContext context, int moreindex) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          morepages[moreindex],
                                    ),
                                  );
                                },
                                child: SizedBox(
                                  height: 5,
                                  width: 5,
                                  child: CustomCircleAvatar(
                                    //   radius: 1,
                                    icon: iconsbBottomSheet[moreindex],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => pages[index]),
                );
              }
            },
            child: Container(
              color: const Color.fromARGB(0, 255, 255, 255),
              child: Row(
                children: [
                  //
                  CustomCircleAvatar(icon: icons[index]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
