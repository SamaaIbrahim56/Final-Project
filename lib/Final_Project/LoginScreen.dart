import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'RegisterScreen.dart';



class loginScreen extends StatefulWidget {
  const loginScreen({super.key});
  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  bool visible =true;
  var formkey =GlobalKey<FormState>();

  TextEditingController emailcontroller =TextEditingController();
  TextEditingController passwordcontroller =TextEditingController();




  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Map<String,dynamic>?data=ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>?;
    if (data != null) {
      emailcontroller.text = data["email"] ?? "";
      passwordcontroller.text =data["password"] ?? "";
    }
    return Form(
      key: formkey,
      child: Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.brown[800],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Stack(
                children: [

                  Center(
                    child: Container(
                      width: 220,
                      height: 220,
                      decoration: BoxDecoration(
                          color: Colors.brown[100],
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
                    padding: const EdgeInsets.all(10),
                    child:
                    Center(
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage('https://images.pexels.com/photos/5052287/pexels-photo-5052287.jpeg?auto=compress&cs=tinysrgb&w=600'),
                                fit: BoxFit.cover
                            ),
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
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,color: Colors.brown[900]),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(

                        controller: emailcontroller,
                        validator: (value){
                          if(value!.isEmpty){
                            return "Email must not be empty";
                          }
                          return null;
                        },
                        decoration: InputDecoration(

                            labelText: "Email",
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(

                                borderRadius: BorderRadius.circular(30),borderSide: BorderSide(
                                color: Colors.brown
                            )
                            )
                        )
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                        obscureText: visible,
                        controller: passwordcontroller,
                        validator: (value){
                          if(value!.isEmpty){
                            return "password must not be empty";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: "password",
                            prefixIcon: Icon(Icons.password),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)
                            ),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    visible = !visible;
                                  });
                                },
                                icon:visible ==true? Icon(Icons.visibility_off,color: Colors.brown[800],):Icon(Icons.visibility,color: Colors.brown[800])))),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),color: Colors.brown[800]
                        ),
                        child: MaterialButton(
                          onPressed: ()  {
                     if(formkey.currentState!.validate()){
                          print(emailcontroller.text);
                          print(passwordcontroller.text);
                            Navigator.pushNamed(context, "HomeScreen");

                            //   FirebaseAuth.instance.signInWithEmailAndPassword
                            //     (email: emailcontroller.text, password: passwordcontroller.text);
                            }
                          },
                          child: Text(
                            "Sign in",
                            style: TextStyle(fontSize:20, color: Colors.white),
                          ),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account ?"),
                        TextButton(onPressed:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SigninScreen()));
                        }, child: Text("Sign Up",style: TextStyle(fontSize: 15,color: Colors.brown[800]),))
                      ],
                    )
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