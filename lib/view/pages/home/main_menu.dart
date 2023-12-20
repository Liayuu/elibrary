import 'package:elibrary/controller/book_controller.dart';
import 'package:elibrary/view/form/input_buku.dart';
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
  final _bookCon = Get.find<BookController>();

  @override
  void initState() {
    _bookCon.getAllBook();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange[300],
          title: const Center(
            child: Text(
              "Daftar Buku",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Get.to(() => const InputBuku())?.then((value) {
              _bookCon.clearForm();
            });
          },
          backgroundColor: Get.theme.colorScheme.primary,
          child: Icon(
            Icons.add,
            color: Get.theme.colorScheme.onPrimary,
          ),
        ),
        body: GetBuilder<BookController>(
            init: Get.find<BookController>(),
            builder: (bc) {
              return GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 7 / 9,
                scrollDirection: Axis.vertical,
                children: List.generate(
                    bc.bookList.length,
                    (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => DetailPage(id: bc.bookList[index].id!));
                            },
                            child: BookCard(
                                image: bc.getImageUrl(bc.bookList[index].id!),
                                author: bc.bookList[index].writer?.writerName ?? "Unknown",
                                name: bc.bookList[index].name ?? "Unknown"),
                          ),
                        )),
              );
            }));
  }
}
