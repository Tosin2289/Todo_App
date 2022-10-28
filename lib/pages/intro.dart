import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/pages/homepage.dart';

class Intor extends StatelessWidget {
  const Intor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  colors: [
                    Colors.white,
                    Colors.white60,
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                  child: Row(
                children: [
                  Text(
                    " Todo",
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.bold,
                      fontSize: 80,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    "App",
                    style: GoogleFonts.barlow(
                      fontWeight: FontWeight.bold,
                      fontSize: 80,
                    ),
                  ),
                ],
              )),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: (() {
          Navigator.push(context, MaterialPageRoute(builder: ((context) {
            return Home();
          })));
        }),
        child: Icon(
          Icons.arrow_forward_ios,
          size: 25,
          color: Colors.black,
        ),
      ),
    );
  }
}
