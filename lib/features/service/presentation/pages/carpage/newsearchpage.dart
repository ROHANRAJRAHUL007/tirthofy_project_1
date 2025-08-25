import 'package:flutter/material.dart';
// import 'package:uuid/uuid.dart';
// import 'package:http/http.dart' as http;

class Newsearchpage extends StatefulWidget {
  const Newsearchpage({super.key});

  @override
  State<Newsearchpage> createState() => _NewsearchpageState();
}

class _NewsearchpageState extends State<Newsearchpage> {
  final SearchController = TextEditingController();
  // var uuid = const Uuid();
  // List<dynamic> listOfLocation = [];

  // @override
  // void initState() {
  //   SearchController.addListener(() {
  //     _onchange();
  //   });
  //   super.initState();
  // }

  // _onchange() {
  //   placeSuggestions(SearchController.text);
  // }

  // void placeSuggestions(String input) async {
  //   const String apiKey = "AIzaSyB1ujHcNnWL6uNeBRllPCrfNNymZX6plG0";
  //   try {
  //     String basedUrl =
  //         "https://maps.googleapis.com/maps/api/place/autocomplete/json";
  //     // url and all the source code are in description
  //   } catch (e) {
  //     print(e.toString()); // <-- Error handling
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 100, 20, 0),
        child: Column(
          children: [
            //
            // TextField(
            //   decoration: InputDecoration(
            //     fillColor: const Color.fromARGB(255, 255, 255, 255),
            //     filled: true,
            //     contentPadding: EdgeInsets.symmetric(vertical: 0),
            //     hintText: "Pickup points",
            //     prefixIcon: Icon(Icons.search),
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(30),
            //     ),
            //   ),
            // ),
            // SizedBox(height: 25),
            //
            TextField(
              // controller: SearchController,
              onChanged: (value) {},
              decoration: InputDecoration(
                fillColor: const Color.fromARGB(255, 255, 255, 255),
                filled: true,
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                hintText: "where to go",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            Visibility(
              //  visible: SearchController.text.isEmpty ? true : false,
              child: Expanded(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Text('Location $index'),
                    );
                  },
                ),
              ),
            ),
            //my location
            Visibility(
              //  visible: SearchController.text.isEmpty ? true : false,
              child: Container(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.my_location),
                      SizedBox(width: 10),
                      Text("My location"),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
