import 'package:flutter/material.dart';
import 'item_detail.dart'; // Assuming ItemDetail.dart is where ItemDetail widget is defined

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[50],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(height: 20),
              _buildFavoriteItem(
                imagePath: "lib/images/8.jpg",
                title: "Light Roast",
                description: "Wake up to the vibrant...",
                price: "Rs 320.00",
              ),
              SizedBox(height: 20),
              _buildFavoriteItem(
                imagePath: "lib/images/5.jpg",
                title: "Mountain Mist Roast",
                description: "Indulge in the rich and ...",
                price: "Rs 320.00",
              ),
              SizedBox(height: 20),
              _buildFavoriteItem(
                imagePath: "lib/images/3.jpg",
                title: "Explorer's Blend",
                description: "Embark on a journey...",
                price: "Rs 320.00",
              ),
              SizedBox(height: 20),
              _buildFavoriteItem(
                imagePath: "lib/images/15.jpg",
                title: "Light Roast",
                description: "Wake up to the vibrant...",
                price: "Rs 320.00",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFavoriteItem({
    required String imagePath,
    required String title,
    required String description,
    required String price,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDetail(
              imageAsset: imagePath,
              title: title,
              description: description,
              price: price,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: Container(
          width: MediaQuery.of(context).size.width - 20,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.teal[50],
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 10,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5),
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
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
}
