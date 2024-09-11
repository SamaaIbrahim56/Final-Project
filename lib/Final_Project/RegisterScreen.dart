import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sama/Final_Project/LoginScreen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<SigninScreen> {
  bool visible =true;
  var formkey =GlobalKey<FormState>();
  TextEditingController emailcontroller =TextEditingController();
  TextEditingController passwordcontroller =TextEditingController();
  TextEditingController Usernamecontroller =TextEditingController();
  String? name="";
  String? Email="";
  String? Password="";
  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown[800],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Register",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                    controller: Usernamecontroller,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Username must not be empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: "Username",
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                        ))),
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
                            borderRadius: BorderRadius.circular(30)
                        ))),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                    controller: passwordcontroller,
                    obscureText: visible,
                    validator: (value){
                      if(value!.isEmpty){
                        return "password must not be empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: "password",
                        prefixIcon: Icon(Icons.password_rounded),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                visible = ! visible;
                              });
                            },
                            icon:visible ==true? Icon(Icons.visibility_off,color: Colors.brown[800]):Icon(Icons.visibility,color: Colors.brown[800])))),
                SizedBox(
                  height: 30,
                ),
                Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),color: Colors.brown[800]
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        if(formkey.currentState!.validate()){
                          print(emailcontroller.text);
                          print(passwordcontroller.text);
                        //   FirebaseAuth.instance.createUserWithEmailAndPassword
                        //     (email: emailcontroller.text, password: passwordcontroller.text);
                          setState(() {
                              name=Usernamecontroller.text;
                              Email=emailcontroller.text;
                              Password=passwordcontroller.text;
                                 });
                          Navigator.pushNamed(context, "HomeScreen",arguments: name);
                          }
                      },

                      child: Text(
                        "Sign Up",
                        style: TextStyle(fontSize:20, color: Colors.white),
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    TextButton(onPressed:(){
                      Navigator.pushNamed(context, "Data",arguments :
                          {
                            "email": Email,
                             "password":Password
                          });
                    }, child: Text("Sign in",style: TextStyle(fontSize: 15,color: Colors.brown[800]),))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}