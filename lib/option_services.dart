import 'package:flutter/material.dart';

class OptionServices extends StatefulWidget {
  const OptionServices({super.key});

  @override
  State<OptionServices> createState() => _OptionServicesState();
}

class _OptionServicesState extends State<OptionServices> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:
          //
          [
            Row(
              children: [
                Column(
                  children: [
                    //1st container
                    Container(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Container(
                            // color: Colors.deepOrange,
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(251, 151, 0, 0.5),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(251, 151, 0, 0.5),
                            ),
                            height: 70,
                            width: 70,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 30),
                //2nd
                Column(
                  children: [
                    Container(
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(251, 151, 0, 0.5),
                            ),
                            //   color: const Color.fromARGB(255, 2, 45, 0),
                            height: 70,
                            width: 70,
                          ),
                          SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(251, 151, 0, 0.5),
                            ),
                            //color: const Color.fromARGB(255, 81, 255, 7),
                            height: 70,
                            width: 70,
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ],
                ),
                //2nd
                SizedBox(width: 30),
                Column(
                  children: [
                    Container(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(251, 151, 0, 0.5),
                            ),
                            // color: const Color.fromARGB(255, 64, 90, 63),
                            height: 70,
                            width: 70,
                          ),
                          SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/icons8-car-24.png',
                                ),
                              ),
                              color: const Color.fromRGBO(251, 151, 0, 0.5),
                            ),
                            //color: const Color.fromARGB(255, 254, 254, 52),
                            height: 70,
                            width: 70,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //3rd
                SizedBox(width: 30),
                Column(
                  children: [
                    Container(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(251, 151, 0, 0.5),
                            ),
                            //  color: const Color.fromARGB(255, 77, 67, 78),
                            height: 70,
                            width: 70,
                          ),
                          SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(251, 151, 0, 0.5),
                            ),
                            //color: const Color.fromARGB(255, 214, 7, 255),
                            height: 70,
                            width: 70,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
    );
  }
}
