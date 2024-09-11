import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
         children: [
           Container(
             width: double.infinity,
             height: double.infinity,
             decoration: BoxDecoration(

               image: DecorationImage(image: NetworkImage("https://images.pexels.com/photos/17951028/pexels-photo-17951028/free-photo-of-vintage-photos-in-black-and-white.jpeg?auto=compress&cs=tinysrgb&w=600"),
               fit: BoxFit.cover
               )


             ),

           ),

           Padding(
             padding: const EdgeInsets.only(top: 500,left: 5,right: 5,bottom: 5),
             child: Container(
             width: double.infinity,
             height: 300,
             decoration: BoxDecoration(
               color: Colors.grey[200],
             ),
 child: Padding(
   padding: const EdgeInsets.only(left: 10),
   child: Column(
     mainAxisAlignment: MainAxisAlignment.start,
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       SizedBox(height: 50,),
       Text("Sama Ibrahim",style:TextStyle(fontSize: 30,fontWeight: FontWeight.w300)),
       SizedBox(height: 40,),
       Row(
         children: [
           Icon(Icons.visibility,),
           Text("views"),
           SizedBox(width: 60),
           Icon(Icons.shopping_cart),
           Text("Sales for This Month"),
           SizedBox(width: 60),
           Icon(Icons.favorite,),
           Text("likes"),

         ],
       ),
       Row(
         children: [
           SizedBox(width: 10),
           Text("624",style:TextStyle(fontSize: 25,fontWeight: FontWeight.w300)),
           SizedBox(width: 120),
           Text("142",style:TextStyle(fontSize: 25,fontWeight: FontWeight.w300)),
           SizedBox(width: 135),
           Text("104",style:TextStyle(fontSize: 25,fontWeight: FontWeight.w300)),
         ],
       )
     ],
   ),
 ),
                      ),
           ),
           Padding(
             padding: const EdgeInsets.only(top: 470,left: 30),
             child: CircleAvatar(
               radius: 40, // Radius of the CircleAvatar
               backgroundImage: NetworkImage(
                 "https://images.pexels.com/photos/18968265/pexels-photo-18968265/free-photo-of-a-man-sitting-on-a-bench-in-a-field.jpeg?auto=compress&cs=tinysrgb&w=600",
               ),
             ),
           ),
         ],
        ),





    );
  }
}
