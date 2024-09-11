import 'package:flutter/material.dart';
import '../Models/ApiClass.dart';
import 'Cart_Page.dart';
import 'Screen_Widget.dart';

class Screen3 extends StatefulWidget {
  Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  bool isLoading = true;
  List products = [];
  List<Map<String, dynamic>> cartItems = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getAllData();
  }

  getAllData() async {
    String category = ModalRoute.of(context)!.settings.arguments as String;
    products = await apiservice().getdata(category);

    setState(() {
      isLoading = false;
    });
  }

  void _addToCart(String image, String name, double price) {
    setState(() {
      cartItems.add({
        'image': image,
        'name': name,
        'price': price,
      });
    });
  }

  void _removeFromCart(int index) {
    setState(() {
      cartItems.removeAt(index);
      print("$index");
    });
  }

  @override
  Widget build(BuildContext context) {
    String data = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$data",
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(
                    cartItems: cartItems,
                    onRemove: _removeFromCart,

                  ),
                ),
              );

            },
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ScreenWidget(
            image: '${product.thumbnail}',
            name: '${product.title}',
            text: '${product.category}',
            price: product.price,
            onAddToCart: (String image, String name, double price) {
              _addToCart(image, name, price);
            },
          );
        },
      ),
    );
  }
}
