import 'package:flutter/material.dart';
import 'package:sama/Final_Project/Models/Category.dart';


import '../LoginScreen.dart';

import 'Profile_Page.dart';
class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}
class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> _screens = [
      Screen2(),
      ProfilePage(),
      loginScreen(),
    ];

    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.brown[800],
        unselectedItemColor: Colors.brown[200],
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'logout',
          ),
        ],
      ),
    );
  }
}

class Screen2 extends StatefulWidget {
  const Screen2({super.key});
  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          splashColor: Colors.white,
          onTap:(){
            Navigator.pop(context);
          },child: Icon(Icons.home,color: Colors.black,),),
        title: Center(child: Text("Discover Your Favorite Category!",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),

      ),
      body: ListView.builder(itemBuilder:(context,i){
        return
          Column(
          children: [
            Stack(
              children: [
                Center(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    width: 320,
                    height: 320,
                    decoration: BoxDecoration(

                        color: Category[i].color,
                        borderRadius: BorderRadius.only(
                          topRight:Radius.circular(200),
                          topLeft:Radius.circular(200),
                          bottomLeft: Radius.circular(200),
                          bottomRight: Radius.circular(200),
                        )
                    ),

                  ),
                ),
                Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  splashColor: Category[i].color,
                 onTap: (){

                 },
                  child:
                  Center(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage("${Category[i].image}"),
                              fit: BoxFit.cover
                          ),
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                            topRight:Radius.circular(200),
                            topLeft:Radius.circular(200),
                            bottomLeft: Radius.circular(200),
                            bottomRight: Radius.circular(200),
                          )
                      ),

                    ),
                  ),
                ),
              ),],
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${Category[i].category}",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                SizedBox(width: 25,),
                FloatingActionButton(
                  heroTag: null,
                  onPressed: (){
                    Navigator.pushNamed(context, "Screen3",arguments: Category[i].category);
                },
                    child:  Icon(Icons.arrow_forward_ios,),backgroundColor: Category[i].color,
                ),
              ],
            ),


            SizedBox(height: 25,),
          ],
        );
      },
      itemCount:Category.length,
      ),
    );
  }
}
