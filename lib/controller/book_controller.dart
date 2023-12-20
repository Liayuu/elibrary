import 'package:elibrary/models/book_form.dart';
import 'package:elibrary/models/book_model.dart';
import 'package:elibrary/services/book_service.dart';
import 'package:get/get.dart';

class BookController extends GetxController {
  BookModel book = BookModel();
  List<BookModel> bookList = [];
  BookForm form = BookForm();

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
    await _bookService.createBook(form.toJson()).then((value) async {
      var filePart = MultipartFile(await form.image!.readAsBytes(),
          filename: form.image!.name, contentType: _bookService.getContentType(form.image!.name));
      await _bookService.addingImage(FormData({"file": filePart}), value.id!).then((vv) {
        bookList.insert(0, vv);
      });
      update();
    });
  }

  Future<void> updateBook(BookForm form) async {
    await _bookService.updateBook(form.toJson(), form.id!).then((value) async {
      bookList[bookList.indexWhere((e) => e.id == value.id)] = value;
      if (form.image != null) {
        MultipartFile filePart = MultipartFile(form.image!.readAsBytes(),
            filename: form.image!.name, contentType: _bookService.getContentType(form.image!.name));
        await _bookService.addingImage(FormData({"file": filePart}), value.id!);
      }
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

  void modelToForm(int id) {
    var bookData = bookList.singleWhere((element) => element.id == id);
    form = BookForm(
        author: bookData.writer?.writerName,
        description: bookData.description,
        genres: bookData.genres?.map((e) => e.name!).toList(),
        id: bookData.id,
        isbn: bookData.isbn,
        imageLink: bookData.id != null ? getImageUrl(bookData.id!) : null,
        language: bookData.language,
        name: bookData.name,
        publishedDate: bookData.publishedDate,
        publisher: bookData.publisher?.publisherName);
    update();
  }

  void clearForm() {
    form = BookForm();
    update();
  }
}
