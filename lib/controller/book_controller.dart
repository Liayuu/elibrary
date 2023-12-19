import 'package:elibrary/models/book_form.dart';
import 'package:elibrary/models/book_model.dart';
import 'package:elibrary/services/book_service.dart';
import 'package:get/get.dart';

class BookController extends GetxController {
  BookModel book = BookModel();
  List<BookModel> bookList = [];

  final BookService _bookService = BookService();

  Future<void> getAllBook() async {
    await _bookService.getAllBook().then((value) {
      bookList.assignAll(value);
      update();
    });
  }

  Future<void> getBook(int id) async {
    await _bookService.getBook(id).then((value) {
      book = value;
      update();
    });
  }

  Future<void> createBook(BookForm form) async {
    var filePart = MultipartFile(form.image!.readAsBytes(),
        filename: form.image!.name, contentType: _bookService.getContentType(form.image!.name));
    var metaPart = MultipartFile(form.toJson(), filename: "meta", contentType: "application/json");

    await _bookService.createBook(FormData({"file": filePart, "meta": metaPart})).then((value) {
      bookList.insert(0, value);
      update();
    });
  }

  Future<void> updateBook(BookForm form) async {
    MultipartFile? filePart;
    if (form.image != null) {
      filePart = MultipartFile(form.image!.readAsBytes(),
          filename: form.image!.name, contentType: _bookService.getContentType(form.image!.name));
    }
    var metaPart = MultipartFile(form.toJson(), filename: "meta", contentType: "application/json");

    await _bookService
        .updateBook(
            FormData({
              "meta": metaPart,
              if (filePart != null) ...{"file": filePart}
            }),
            form.id!)
        .then((value) {
      bookList.insert(0, value);
      update();
    });
  }

  Future<void> deleteBook(int id) async {
    await _bookService.deleteBook(id).then((value) {
      bookList.removeWhere((element) => element.id == id);
      update();
    });
  }

  String getImageUrl(int id) {
    return _bookService.imageUrl(id);
  }
}
