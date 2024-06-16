import 'package:flutter/material.dart';

class CartBottomBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.yellow.shade100,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),

      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Icon(
                  Icons.discount,
                  color: Colors.yellow[800],
                ),

                const Text(
                  "Use promo coupons",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 25, thickness: 1),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),
                  Text(
                    "RS 2700.00",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.yellow[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, "OrderPage");
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.yellow[800],
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child:  const Text(
                    "Check Out",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              ),
            ],
          ),
        ],
      ),
    );
  }
}
