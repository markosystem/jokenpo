import 'package:flutter/material.dart';

class Ajuda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo - Ajuda"),
      ),
      backgroundColor: Colors.white,
      body: Center(child: Image.asset("images/ajuda.jpg")),
    );
  }
}
