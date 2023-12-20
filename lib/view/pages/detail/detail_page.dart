import 'package:elibrary/controller/book_controller.dart';
import 'package:elibrary/services/parser/date_and_time_parser.dart';
import 'package:elibrary/view/form/input_buku.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  final int id;
  const DetailPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bookCon = Get.find<BookController>();

    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: ExpandableFab.location,
        floatingActionButton: ExpandableFab(
            openButtonBuilder: RotateFloatingActionButtonBuilder(
              child: const Icon(Icons.account_box),
              fabSize: ExpandableFabSize.regular,
              foregroundColor: Colors.amber,
              backgroundColor: Colors.green,
              shape: const CircleBorder(),
            ),
            closeButtonBuilder: DefaultFloatingActionButtonBuilder(
              child: const Icon(Icons.close),
              fabSize: ExpandableFabSize.regular,
              foregroundColor: Colors.deepOrangeAccent,
              backgroundColor: Colors.lightGreen,
              shape: const CircleBorder(),
            ),
            distance: 60,
            children: [
              FloatingActionButton.small(
                shape: const CircleBorder(),
                heroTag: null,
                child: const Icon(Icons.edit),
                onPressed: () async {
                  bookCon.modelToForm(id);
                  await Get.to(() => const InputBuku())?.then((value) {
                    bookCon.clearForm();
                  });
                },
              ),
              FloatingActionButton.small(
                shape: const CircleBorder(),
                heroTag: null,
                child: const Icon(Icons.delete),
                onPressed: () async {
                  bookCon.deleteBook(id).then((value) {
                    Get.back();
                  });
                },
              ),
            ]),
        appBar: AppBar(
          backgroundColor: Colors.orange[300],
          title: const Center(
            child: Text(
              "Detail Buku",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
        body: GetBuilder<BookController>(
            init: Get.find<BookController>(),
            builder: (bc) {
              return SizedBox(
                height: Get.height,
                width: Get.width,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height / 3,
                        width: Get.width,
                        child: Image.network(
                          bc.getImageUrl(id),
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          bc.bookList.singleWhere((e) => e.id == id).name!,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Deskripsi",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          bc.bookList.singleWhere((e) => e.id == id).description!,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Detail",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _detailBook(
                                    "Genre",
                                    bc.bookList
                                        .singleWhere((e) => e.id == id)
                                        .genres!
                                        .map((e) => e.name)
                                        .toList()
                                        .join(", ")),
                                _detailBook(
                                    "Penerbit",
                                    bc.bookList
                                        .singleWhere((e) => e.id == id)
                                        .publisher!
                                        .publisherName!)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _detailBook("Pengarang",
                                    bc.bookList.singleWhere((e) => e.id == id).writer!.writerName!),
                                _detailBook(
                                    "Tanggal Terbit",
                                    dateToString(
                                        date: bc.bookList
                                            .singleWhere((e) => e.id == id)
                                            .publishedDate!))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _detailBook(
                                    "Bahasa", bc.bookList.singleWhere((e) => e.id == id).language!),
                                _detailBook(
                                    "ISBN", bc.bookList.singleWhere((e) => e.id == id).isbn!)
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  Widget _detailBook(String title, String detailText) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            detailText,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
