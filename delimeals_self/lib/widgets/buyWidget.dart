import '../data/dummy_data.dart';
import '../effects/Effects.dart';
import '../models/ordered_items_modal.dart';
import 'package:flutter/material.dart';

class BuyModalSheet extends StatelessWidget {
  final PlacedOrder placedOrder;
  final Function extraThingsToDo;
  const BuyModalSheet(
      {Key? key, required this.placedOrder, required this.extraThingsToDo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final placedorderlist = placedOrder.listofItemsOrdered;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 42, 39, 39),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              const Divider(
                color: Colors.red,
                height: 15,
                thickness: 2,
                indent: 150,
                endIndent: 150,
              ),
              Container(
                height: 340,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(placedorderlist[index].title),
                      subtitle: Text(
                        "₹ ${placedorderlist[index].price.toStringAsFixed(2)}",
                        style: const TextStyle(color: Colors.grey),
                      ),
                      leading: CircleAvatar(
                        backgroundImage:
                            Image.network(placedorderlist[index].imageUrl)
                                .image,
                      ),
                      trailing: CircleAvatar(
                        child: Text(
                          "${placedorderlist[index].ratings}★",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                  itemCount: placedorderlist.length,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "Cancel",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                    child: VerticalDivider(
                      color: Colors.red,
                      thickness: 2,
                      indent: 0,
                      endIndent: 0,
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        final datacollector = DataCollector();
                        datacollector.addOrderToPreviousOrderList(placedOrder);
                        EffectsOnScreen.showToast(
                          "Order is Placed 🥳!! with id ${placedOrder.hashCode.toString()}",
                          context,
                        );
                        extraThingsToDo();
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "Buy Now",
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
