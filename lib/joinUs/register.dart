import 'package:credit_card/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'login.dart';
// import 'package:login_register_app/joinus/login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    //TODO update what details you want
    //test feild state
    // String email = "";
    // String password = "";
    // String name = "";
    // String city = "";
    // String phonenumber = "";

    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    //for showing loading
    bool loading = false;

    // this below line is used to make notification bar transparent
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            "assets/images/moon.jpg",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          // Image.network(
          //   //TODO update this
          //   'https://cdn.pixabay.com/photo/2016/10/11/21/43/geometric-1732847_960_720.jpg',
          //   fit: BoxFit.cover,
          //   height: double.infinity,
          //   width: double.infinity,
          // ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(.1),
                ])),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 27.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  //TODO update this
                  'Join Mr X!',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Stack(
                  children: <Widget>[
                    Container(
                        width: double.infinity,
                        margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(left: 20),
                              height: 22,
                              width: 22,
                              child: const Icon(
                                Icons.email,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ],
                        )),
                    Container(
                      height: 50,
                      margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                      child: TextField(
                        // onChanged: (value) => email = value,
                        controller: email,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                            hintText: 'Email',
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.white70)),
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                //city
                const SizedBox(
                  height: 16,
                ),
                //TODO remove unwanted containers
                Stack(
                  children: <Widget>[
                    Container(
                        width: double.infinity,
                        margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(left: 20),
                              height: 22,
                              width: 22,
                              child: const Icon(
                                Icons.home,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ],
                        )),
                    Container(
                        height: 50,
                        margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                        child: const TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: 'City',
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.white70)),
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        )),
                  ],
                ),
                //phonenumber
                const SizedBox(
                  height: 16,
                ),
                Stack(
                  children: <Widget>[
                    Container(
                        width: double.infinity,
                        margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(left: 20),
                              height: 22,
                              width: 22,
                              child: const Icon(
                                Icons.phone,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ],
                        )),
                    Container(
                        height: 50,
                        margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                        child: const TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: 'Mobile Number',
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.white70)),
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        )),
                  ],
                ),
                //Name
                const SizedBox(
                  height: 16,
                ),
                Stack(
                  children: <Widget>[
                    Container(
                        width: double.infinity,
                        margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(left: 20),
                              height: 22,
                              width: 22,
                              child: const Icon(
                                Icons.account_circle_outlined,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ],
                        )),
                    Container(
                        height: 50,
                        margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                        child: TextField(
                          // onChanged: (value) => name = value,
                          controller: name,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                              hintText: 'Name',
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.white70)),
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Stack(
                  children: <Widget>[
                    Container(
                        width: double.infinity,
                        margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(left: 20),
                              height: 22,
                              width: 22,
                              child: const Icon(
                                Icons.vpn_key,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ],
                        )),
                    Container(
                        height: 50,
                        margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                        child: TextField(
                          // onChanged: (value) => password = value,
                          controller: password,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.white70),
                          ),
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Apimanager()
                        .registerUser(
                            email: email.text,
                            name: name.text,
                            password: password.text)
                        .then((value) {
                      if (value.tokens!.access!.token!.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => Login()),
                        );
                      }
                    });
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                    margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: const Center(
                      child: Text(
                        'Register',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: const Center(
                      child: Text(
                    "Already have an account",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  )),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: Container(
                    height: 30,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: const Center(
                        child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
