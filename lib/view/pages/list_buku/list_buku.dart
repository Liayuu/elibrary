import 'package:flutter/material.dart';

class ListBuku extends StatelessWidget {
  const ListBuku({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: const Center(
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
