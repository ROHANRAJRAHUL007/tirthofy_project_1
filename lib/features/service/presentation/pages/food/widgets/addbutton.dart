import 'package:flutter/material.dart';

class AddButton extends StatefulWidget {
  const AddButton({super.key});

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return count == 0
        ? ElevatedButton(
            onPressed: () => setState(() => count = 1),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.pink),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "ADD",
                  style: TextStyle(
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("Customize", style: TextStyle(color: Colors.black54)),
              ],
            ),
          )
        : Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              border: Border.all(color: Colors.pink),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove, color: Colors.pink),
                  onPressed: () => setState(() {
                    if (count > 1)
                      count--;
                    else
                      count = 0; // reset back to ADD
                  }),
                ),
                Text(
                  "$count",
                  style: const TextStyle(
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add, color: Colors.pink),
                  onPressed: () => setState(() => count++),
                ),
              ],
            ),
          );
  }
}
