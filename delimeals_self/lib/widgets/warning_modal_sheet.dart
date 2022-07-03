import 'package:flutter/material.dart';

class WarningSheet extends StatelessWidget {
  int buttonChoose = 0;
  final Function removeItem;
  final String title;
  final String warningText;
  WarningSheet({
    Key? key,
    required this.removeItem,
    required this.title,
    required this.warningText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 42, 39, 39),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            warningText,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.red),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  buttonChoose = 1;
                },
                child: const Text("No,Cancel"),
              ),
              const SizedBox(
                height: 20,
                child: VerticalDivider(
                  color: Colors.red,
                  thickness: 2,
                  indent: null,
                  endIndent: null,
                  width: 20,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    removeItem(title);
                    Navigator.of(context).pop();
                    buttonChoose = 2;
                  },
                  child: const Text("Yes,Remove"))
            ],
          )
        ],
      ),
    );
  }
}
