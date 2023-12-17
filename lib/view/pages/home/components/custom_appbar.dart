import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final Color? colors;
  final String? title;
  const CustomAppbar({super.key, this.colors, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: colors ?? Colors.orange[300],
      title: Center(
        child: Text(
          title ?? "Selamat Datang",
          style: const TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
