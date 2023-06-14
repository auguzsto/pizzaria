import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaria/src/views/client/home/home_screen.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    //Background
    return Scaffold(
      //Body
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/src/assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),

        //Content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Logo
            const CircleAvatar(
              radius: 115,
              child: Icon(
                Icons.local_pizza,
                size: 110,
              ),
            ),
            const SizedBox(height: 15),
            //Button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Application
                SizedBox(
                  height: 66,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.phone_iphone),
                    label: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Baixe o aplicativo"),
                        Text(
                          "Android",
                          style: TextStyle(
                              fontSize: 10, color: Colors.red.shade400),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 15),

                //Web
                SizedBox(
                  height: 66,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 92, 17, 17),
                      foregroundColor: Colors.white,
                      elevation: 15,
                    ),
                    onPressed: () {
                      Get.offAll(HomeScreen());
                    },
                    icon: const Icon(Icons.web_stories),
                    label: const Text("Continue pelo website"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
