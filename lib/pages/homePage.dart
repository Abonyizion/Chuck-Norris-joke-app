
import 'package:flutter/material.dart';
import 'package:joke_app/providerService/jokeProvider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  final jokeProvider = JokeProvider();
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
        title: const Text('JOKES'
        ),
        centerTitle: true,
      ),
      body:  Consumer<JokeProvider>(
        builder: (context, jokeController, _) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder(
                  future: jokeProvider.getJokes(context),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 160, bottom: 160),
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.blue,
                              valueColor: AlwaysStoppedAnimation(Colors.pink),
                              strokeWidth: 5,
                            ),
                          ));
                    } else {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 65, bottom: 20, left: 10, right: 10),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if(jokeController.joke != null)...{
                                  Text(jokeController.joke!.updatedAt),
                                  Image.network(jokeController.joke !.iconUrl),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(15.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.grey[700],
                                    ),
                                    child:  Text(jokeController.joke!.value.toString(),
                                      style: const TextStyle(
                                          fontSize: 25, color: Colors.white
                                      ),
                                    ),
                                  ),
                                },
                                const SizedBox(
                                  height: 35,
                                ),
            
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  }
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        foregroundColor: Colors.white
                    ),
                    onPressed: () {
                      jokeController.getJokes(context);
                    },
                    child: Text(
                      jokeController.joke == null
                          ? "Click to explore jokes"
                          : "Next joke", style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          );

        },
      ),
    );
  }
}
