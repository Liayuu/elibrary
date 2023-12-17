import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                onPressed: () {},
              ),
              FloatingActionButton.small(
                shape: const CircleBorder(),
                heroTag: null,
                child: const Icon(Icons.delete),
                onPressed: () {},
              ),
            ]),
        appBar: AppBar(
          backgroundColor: Colors.orange[300],
          title: const Center(
            child: Text(
              "Detail Buku",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
        body: SizedBox(
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
                    "https://sc04.alicdn.com/kf/He58198876a3e49748289f52dace0ee5cO.jpg",
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Buku Haluin Chara Genshin",
                    textAlign: TextAlign.left,
                    style: TextStyle(
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
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis facilisis varius sapien a malesuada. Aliquam efficitur sem ac purus commodo aliquam. Etiam semper neque tellus, quis pharetra sem ullamcorper quis. Curabitur rhoncus augue felis, in mollis leo malesuada at. Vestibulum tincidunt accumsan nunc non porttitor. Donec efficitur rutrum erat et.",
                    textAlign: TextAlign.left,
                    style: TextStyle(
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
                          _detailBook("Genre", "Halu, 2D"),
                          _detailBook("Penerbit", "Mihomo.inc")
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _detailBook("Pengarang", "Liem Chou Ching"),
                          _detailBook("Tanggal Terbit", "12 Feb 2019")
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _detailBook("Bahasa", "Chinese"),
                          _detailBook("ISBN", "0889W88492748")
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
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
