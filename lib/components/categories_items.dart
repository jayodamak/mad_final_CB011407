import 'package:flutter/material.dart';
import '../pages/item_detail.dart'; // Adjust the import path as per your project structure

class CategoriesItems extends StatelessWidget {
  const CategoriesItems({Key? key}) : super(key: key);

  // Function to navigate to ItemDetail screen with specific item details
  void _navigateToItemDetail(BuildContext context, String imageAsset, String title, String description, String price) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ItemDetail(
          imageAsset: imageAsset,
          title: title,
          description: description,
          price: price,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.58,
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        _buildItem(
          context,
          "lib/images/1.jpg",
          "Light Roast",
          "Wake up to the vibrant...",
          "Rs 675.00",
        ),
        _buildItem(
          context,
          "lib/images/5.jpg",
          "Explorer's Blend",
          "Embark on a journey...",
          "Rs 675.00",
        ),
        _buildItem(
          context,
          "lib/images/8.jpg",
          "Mountain Mist Roast",
          "Indulge in the rich...",
          "Rs 675.00",
        ),
        _buildItem(
          context,
          "lib/images/3.jpg",
          "Light Roast",
          "Wake up to the vibrant...",
          "Rs 675.00",
        ),
        _buildItem(
          context,
          "lib/images/7.jpg",
          "Explorer's Blend",
          "Embark on a journey...",
          "Rs 675.00",
        ),
        _buildItem(
          context,
          "lib/images/5.jpg",
          "Mist Roast",
          "Indulge in the rich and ...",
          "Rs 675.00",
        ),
      ],
    );
  }

  // Method to build each item widget
  Widget _buildItem(BuildContext context, String imageAsset, String title, String description, String price) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.teal[50],
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              _navigateToItemDetail(context, imageAsset, title, description, price);
            },
            child: Container(
              height: 120,
              width: 120,
              margin: const EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  imageAsset,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            alignment: Alignment.centerLeft,
            child: Text(
              description,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              price,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
