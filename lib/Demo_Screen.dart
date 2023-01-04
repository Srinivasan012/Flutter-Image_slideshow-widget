import 'package:flutter/material.dart';
import 'package:slide_show_widget/slide_show_widget.dart';

class DemoScreen extends StatelessWidget {
  const DemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 223, 215, 215),
      appBar: AppBar(
        title: const Text("MyCustomSlideShow"),
        centerTitle: true,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Center(
          child: Container(
            height: 300,
            width: 300,
            child: MySlideShowWidget(children: [
              Image.network(
                "https://images.hdqwalls.com/wallpapers/iron-man-the-avengers-yy.jpg",
                fit: BoxFit.cover,
              ),
              Image.network(
                "https://4kwallpapers.com/images/walls/thumbs_3t/103.jpg",
                fit: BoxFit.cover,
              ),
              Image.network(
                "https://images.hdqwalls.com/wallpapers/bthumb/thor-lightning-5k-nd.jpg",
                fit: BoxFit.cover,
              ),
            ]),
          ),
        ),
        Container(
          height: 300,
          width: 300,
          child: MySlideShowWidget(seconds: 3, children: [
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.yellow,
            ),
          ]),
        )
      ]),
    );
  }
}
