import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  final String category;
  final String title;
  final String catId;
  final String type;
  final double price;
  final int ratings;
  final String imageUrl;

  ItemTile({
    required this.catId,
    required this.category,
    required this.price,
    required this.type,
    required this.title,
    required this.ratings,
    required this.imageUrl,
  });
  Widget _buildDescriptionRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Card(
          color: Colors.brown,
          child: Container(
            width: 50,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(5),
            child: Text(
              "$ratings★",
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
          child: VerticalDivider(
            color: Colors.red,
            thickness: 2,
            indent: 5,
            endIndent: 0,
            width: 20,
          ),
        ),
        Text(category),
        const SizedBox(
          height: 15,
          child: VerticalDivider(
            color: Colors.red,
            thickness: 2,
            indent: 5,
            endIndent: 0,
            width: 20,
          ),
        ),
        Text(type),
      ],
    );
  }

  Widget _buildButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text(
              "Buy Now",
              style: TextStyle(fontSize: 10, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
          child: VerticalDivider(
            color: Colors.red,
            thickness: 2,
            indent: 5,
            endIndent: 0,
            width: 20,
          ),
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text(
              "Add To Cart",
              style: TextStyle(fontSize: 10, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Colors.black,
      child: Card(
        elevation: 5,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: _buildDescriptionRow(),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "₹ ${this.price}",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              _buildButtonRow(),
            ],
          ),
        ),
      ),
    );
  }
}
