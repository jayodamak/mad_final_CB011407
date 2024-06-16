import 'package:flutter/material.dart';
import '../pages/item_detail.dart'; // Import ItemDetail widget

class PopularList extends StatelessWidget {
  const PopularList({Key? key}) : super(key: key);

  Widget _buildCoffeeItem({
    required BuildContext context,
    required String imageAsset,
    required String title,
    required String description,
    required String price,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
        child: Container(
          width: 170, // Width of each item card
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.asset(
                  imageAsset,
                  height: 130,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.red[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Popular",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow[800],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "View all",
                  style: TextStyle(
                    color: Colors.indigo,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 260, // Adjust the height based on your design
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: [
              _buildCoffeeItem(
                context: context,
                imageAsset: "lib/images/2.jpg",
                title: "Mountain Mist Roast",
                description: "Indulge in the rich and ...",
                price: "Rs 350.00",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ItemDetail(
                        imageAsset: "lib/images/2.jpg",
                        title: "Mountain Mist Roast",
                        description: "Indulge in the rich and ...",
                        price: "Rs 350.00",
                      ),
                    ),
                  );
                },
              ),
              _buildCoffeeItem(
                context: context,
                imageAsset: "lib/images/3.jpg",
                title: "Explorer's Blend",
                description: "Embark on a journey...",
                price: "Rs 350.00",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ItemDetail(
                        imageAsset: "lib/images/3.jpg",
                        title: "Explorer's Blend",
                        description: "Embark on a journey...",
                        price: "Rs 350.00",
                      ),
                    ),
                  );
                },
              ),
              _buildCoffeeItem(
                context: context,
                imageAsset: "lib/images/7.jpg",
                title: "Light Roast",
                description: "Wake up to the vibrant...",
                price: "Rs 350.00",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ItemDetail(
                        imageAsset: "lib/images/7.jpg",
                        title: "Light Roast",
                        description: "Wake up to the vibrant...",
                        price: "Rs 350.00",
                      ),
                    ),
                  );
                },
              ),
              _buildCoffeeItem(
                context: context,
                imageAsset: "lib/images/8.jpg",
                title: "Mountain Mist Roast",
                description: "Indulge in the rich and ...",
                price: "Rs 350.00",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ItemDetail(
                        imageAsset: "lib/images/8.jpg",
                        title: "Mountain Mist Roast",
                        description: "Indulge in the rich and ...",
                        price: "Rs 350.00",
                      ),
                    ),
                  );
                },
              ),
              _buildCoffeeItem(
                context: context,
                imageAsset: "lib/images/1.jpg",
                title: "Explorer's Blend",
                description: "Embark on a journey...",
                price: "Rs 350.00",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ItemDetail(
                        imageAsset: "lib/images/1.jpg",
                        title: "Explorer's Blend",
                        description: "Embark on a journey...",
                        price: "Rs 350.00",
                      ),
                    ),
                  );
                },
              ),
              _buildCoffeeItem(
                context: context,
                imageAsset: "lib/images/15.jpg",
                title: "Light Roast",
                description: "Wake up to the vibrant...",
                price: "Rs 350.00",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ItemDetail(
                        imageAsset: "lib/images/15.jpg",
                        title: "Light Roast",
                        description: "Wake up to the vibrant...",
                        price: "Rs 350.00",
                      ),
                    ),
                  );
                },
              ),
              _buildCoffeeItem(
                context: context,
                imageAsset: "lib/images/5.jpg",
                title: "Mocha",
                description: "Dive into the decadent...",
                price: "Rs 350.00",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ItemDetail(
                        imageAsset: "lib/images/5.jpg",
                        title: "Mocha",
                        description: "Dive into the decadent...",
                        price: "Rs 350.00",
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
