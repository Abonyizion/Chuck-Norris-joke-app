
import 'package:flutter/material.dart';
import 'homePage.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(image:
                AssetImage("assets/images/three.png"),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("Welcome to Chuck Norris Joke App by Zion",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                const Text("ENJOY!!!", style: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.only(top: 45),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        foregroundColor: Colors.white
                      ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HomePage()));
                        },
                        child: const Text("START",  style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),),
                    ),
                  ),
                ),
              ],
            ),
          ),

      ),
    );
  }
}
