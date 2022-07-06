import 'package:flutter/material.dart';

class FiltersWidget extends StatefulWidget {
  final Map<String, bool> availableFilters;
  final Function applyFilters;
  const FiltersWidget(
      {Key? key, required this.availableFilters, required this.applyFilters})
      : super(key: key);

  @override
  State<FiltersWidget> createState() => _FiltersWidgetState();
}

class _FiltersWidgetState extends State<FiltersWidget> {
  @override
  Widget build(BuildContext context) {
    final List<String> avialableTypes = [];
    for (final ele in widget.availableFilters.entries) {
      avialableTypes.add(ele.key);
    }

    return Container(
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 350,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return SwitchListTile(
                  value: widget.availableFilters[avialableTypes[index]]!,
                  onChanged: (newValue) {
                    setState(() {
                      widget.availableFilters[avialableTypes[index]] = newValue;
                    });
                  },
                  title: Text(
                    avialableTypes[index].toUpperCase(),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                );
              },
              itemCount: avialableTypes.length,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              widget.applyFilters();
              Navigator.of(context).pop();
            },
            child: const Text("Apply Filters"),
          ),
        ],
      ),
    );
  }
}
