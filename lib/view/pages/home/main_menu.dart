import 'package:elibrary/view/pages/detail/detail_page.dart';
import 'package:elibrary/view/pages/home/components/book_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange[300],
          title: const Center(
            child: Text(
              "Daftar Buku",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 7 / 9,
          scrollDirection: Axis.vertical,
          children: List.generate(
              10,
              (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => DetailPage());
                      },
                      child: const BookCard(
                          image:
                              "https://sc04.alicdn.com/kf/He58198876a3e49748289f52dace0ee5cO.jpg",
                          author: "Yulia Candra",
                          name: "Buku Haluin Chara Genshin"),
                    ),
                  )),
        ));
  }
}
