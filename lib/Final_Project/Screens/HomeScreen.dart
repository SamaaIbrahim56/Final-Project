import 'package:flutter/material.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<String> _imageUrls = [
    "https://images.pexels.com/photos/9219002/pexels-photo-9219002.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/21008924/pexels-photo-21008924/free-photo-of-chanel-perfume-vial.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
    "https://images.pexels.com/photos/6373309/pexels-photo-6373309.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://media.istockphoto.com/id/1148864103/photo/full-paper-bags-with-food-on-kitchen-table-on-dark-background-healthy-and-fresh-eco-products.jpg?s=612x612&w=0&k=20&c=FbP0MoxiK5hBc1WEb_TkemG1z1xuFuG7AbD-IAqUwAE="
  ];

  @override
  Widget build(BuildContext context) {
  String? Name=ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello $Name ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
      ),
      body: Column(
        children: [
          // PageView for scrolling through images
          Container(
            height: 400,
            child: PageView.builder(
              controller: _pageController,
              itemCount: _imageUrls.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Center(
                      child: Container(
                        width: 350,
                        height: 500,
                        decoration: BoxDecoration(
                          color: Colors.brown[100],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(400),
                            bottomRight: Radius.circular(250),
                            topLeft: Radius.circular(250),
                            topRight: Radius.circular(350),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 350,
                        height: 500,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(_imageUrls[index]),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(300),
                            bottomRight: Radius.circular(400),
                            topLeft: Radius.circular(400),
                            topRight: Radius.circular(350),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: 10),
          // Dots indicator for images
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_imageUrls.length, (index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index ? Colors.brown[800] : Colors.brown[100],
                ),
              );
            }),
          ),
          SizedBox(height: 10),
          Text("Beauty Trends", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35)),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Center(
              child: Text(
                "Discover The Latest Beauty Trends & explore new releases in makeup, fragrances, food, and furniture all in one app!",
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 30,),

          Container(

              width: double.infinity,
              height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "Navigator");
                  },
                  child:
                Container(
                  alignment: Alignment.center,
                  width: 130,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color:  Colors.brown[900],
                  ),
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                  ),

              ],
            ),
          ),


        ],
      ),
    );
  }
}
