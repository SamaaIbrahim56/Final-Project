import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;
  final void Function(int) onRemove;

  const CartPage({super.key, required this.cartItems, required this.onRemove});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Your Shopping Cart",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
      ),
      body: widget.cartItems.isEmpty
          ? Center(child: Text("Cart is empty"))
          : ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          final item = widget.cartItems[index];
          return ListTile(
            leading: Image.network(item['image']),
            title: Text(item['name']),
            subtitle: Text("\$${item['price']}"),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  widget.onRemove(index);
                });


              },
            ),
          );
        },
      ),
    );
  }
}
