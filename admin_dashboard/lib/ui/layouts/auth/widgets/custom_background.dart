import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            decoration: _buildBackgroundImage(),
            child: Container(
                constraints: BoxConstraints(
                  maxWidth: 400.0,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Center(
                      child: Image(
                    image: AssetImage('twitter-white-logo.png'),
                    width: 400.0,
                  )),
                ))));
  }

  BoxDecoration _buildBackgroundImage() {
    return BoxDecoration(
        image: DecorationImage(
            image: AssetImage('twitter-bg.png'), fit: BoxFit.cover));
  }
}
