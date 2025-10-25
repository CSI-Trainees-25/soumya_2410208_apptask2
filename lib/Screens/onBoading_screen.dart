import 'package:flutter/material.dart';

class OnBoadingScreen extends StatelessWidget {
  const OnBoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 233, 220),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset("Assets/Images/Mask group.png"),
              SizedBox(height: 50),
              SizedBox(
                child: Center(
                  child: Text(
                    'Stay Focused',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1,
                      fontSize: 28,
                      color: const Color.fromARGB(255, 78, 53, 44),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                child: Center(
                  child: Text(
                    'Get the cup filled of your choice to stay',
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 0.25,
                      fontWeight: FontWeight.w300,
                      color: const Color.fromARGB(255, 165, 140, 131),
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: Center(
                  child: Text(
                    'focused and awake .Different type of coffee ',
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 0.25,
                      fontWeight: FontWeight.w300,
                      color: const Color.fromARGB(255, 165, 140, 131),
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: Center(
                  child: Text(
                    'menu, hot lotte cappuchino',
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 0.25,
                      fontWeight: FontWeight.w300,
                      color: const Color.fromARGB(255, 165, 140, 131),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 70),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 179, 137, 122),
                ),

                child: Text(
                  'Dive In ⟶',
                  style: TextStyle(
                    color: const Color.fromARGB(246, 255, 255, 255),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.1,
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
