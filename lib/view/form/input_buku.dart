import 'package:flutter/material.dart';

class InputBuku extends StatelessWidget {
  const InputBuku({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: Center(
          child: Text(
            "Selamat Datang",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    
    );
  }
}
