import 'package:flutter/material.dart';
import '../components/cart_bottom_bar.dart';
// import '../components/cart_item_samples.dart';
import '../components/cart_itrm_samples.dart'; // Corrected import statement

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool checkedValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade50,
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade800,
        elevation: 0,
        title: const Text(
          'My Cart',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // CheckboxListTile(
              //   title: const Text("Select all items"),
              //   activeColor: Colors.yellow.shade800,
              //   value: checkedValue,
              //   onChanged: (newValue) {
              //     setState(() {
              //       checkedValue = newValue ?? false;
              //     });
              //   },
              //   controlAffinity: ListTileControlAffinity.leading,
              // ),
              const SizedBox(height: 20),
              CartItemSamples(
                selectAll: checkedValue,
                onSelectAllChanged: (newValue) {
                  setState(() {
                    checkedValue = newValue;
                  });
                },
              ), // Assuming this widget displays cart items
              const SizedBox(height: 20),
              _buildCartSummary(), // A function to build the summary section
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CartBottomBar(), // Assuming this widget handles bottom navigation
    );
  }

  Widget _buildCartSummary() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildSummaryRow("Sub_Total:", "Rs 2250.00"),
          const Divider(height: 10, thickness: 1, color: Colors.grey),
          _buildSummaryRow("Delivery Fee:", "Rs 450.00"),
          const Divider(height: 10, thickness: 1, color: Colors.grey),
          _buildSummaryRow("Discount:", "Rs 00.00"),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
