import 'dart:developer';
import 'dart:io';

import 'package:elibrary/controller/book_controller.dart';
import 'package:elibrary/view/components/bordered_input_text.dart';
import 'package:elibrary/view/components/button_main.dart';
import 'package:elibrary/view/components/image_picker_sheet.dart';
import 'package:elibrary/view/components/profile_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

class InputBuku extends StatefulWidget {
  const InputBuku({super.key});

  @override
  State<InputBuku> createState() => _InputBukuState();
}

class _InputBukuState extends State<InputBuku> {
  final _formKey = GlobalKey<FormState>();
  final _picker = ImagePicker();

  final _bookCon = Get.find<BookController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: const Center(
          child: Text(
            "Input Buku",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: Get.height * 0.2,
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                Get.bottomSheet(ImagePickerSheet(
                                  stats: (response) async {
                                    _onPickImage(response).then((value) {
                                      setState(() {
                                        _bookCon.form.image = value;
                                      });
                                    });
                                  },
                                ));
                              },
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: FormField(
                                  validator: (value) {
                                    return null;
                                  },
                                  builder: (field) => Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: Get.theme.primaryColor,
                                        width: 2,
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                                      child: _bookCon.form.imageLink == null &&
                                              _bookCon.form.image == null
                                          ? Center(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Icon(
                                                    Icons.add,
                                                    size: 32,
                                                    color: Get.theme.colorScheme.primary,
                                                  ),
                                                  const Text(
                                                    "Tambah Gambar",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          : _bookCon.form.image == null
                                              ? Image.network(
                                                  _bookCon.form.imageLink!,
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (context, error, stackTrace) =>
                                                      const Center(
                                                    child: Icon(
                                                      Icons.image_not_supported_sharp,
                                                      size: 24,
                                                    ),
                                                  ),
                                                )
                                              : Image.file(
                                                  File(_bookCon.form.image!.path),
                                                  fit: BoxFit.cover,
                                                ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        ProfileTextfield(
                          hintText: "Nama Buku",
                          initialValue: _bookCon.form.name,
                          title: Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 4),
                            child: Text(
                              "Nama Buku",
                              style:
                                  Get.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                          onSaved: (value) {
                            _bookCon.form.name = value.toString();
                          },
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Deskripsi",
                          style: Get.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w700),
                        ),
                        BorderedInputText(
                          maxLines: 3,
                          addSuffix: false,
                          readOnly: false,
                          hint: "Tambah deskripsi buku",
                          initValue: _bookCon.form.description,
                          onSaved: (value) {
                            _bookCon.form.description = value.toString();
                          },
                        ),
                        ProfileTextfield(
                          hintText: "ISBN",
                          initialValue: _bookCon.form.isbn,
                          title: Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 4),
                            child: Text(
                              "ISBN",
                              style:
                                  Get.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                          onSaved: (value) {
                            _bookCon.form.isbn = value.toString();
                          },
                        ),
                        _formWithDatePicker(
                            initialValue: _bookCon.form.publishedDate,
                            label: "Tahun Terbit",
                            hint: "Tahun Terbit",
                            onTap: () => _selectDate(
                                  context: Get.context!,
                                  initialDate: DateTime.now(),
                                  onDatePicked: (selectedDate) {
                                    log("selected date: $selectedDate");
                                    setState(() {
                                      _bookCon.form.publishedDate = selectedDate;
                                      // controller.promotionModel.endTime = selectedDate;
                                    });
                                  },
                                )),
                        ProfileTextfield(
                          hintText: "Pengarang",
                          initialValue: _bookCon.form.author,
                          title: Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 4),
                            child: Text(
                              "Pengarang",
                              style:
                                  Get.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                          onSaved: (value) {
                            _bookCon.form.author = value.toString();
                          },
                        ),
                        ProfileTextfield(
                          hintText: "Penerbit",
                          initialValue: _bookCon.form.publisher,
                          title: Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 4),
                            child: Text(
                              "Penerbit",
                              style:
                                  Get.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                          onSaved: (value) {
                            _bookCon.form.publisher = value.toString();
                          },
                        ),
                        ProfileTextfield(
                          hintText: "Bahasa",
                          initialValue: _bookCon.form.language,
                          title: Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 4),
                            child: Text(
                              "Bahasa",
                              style:
                                  Get.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                          onSaved: (value) {
                            _bookCon.form.language = value.toString();
                          },
                        ),
                        ProfileTextfield(
                          hintText: "Genre",
                          initialValue: _genreText(_bookCon.form.genres),
                          title: Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 4),
                            child: Text(
                              "Genre",
                              style:
                                  Get.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                          onSaved: (value) {
                            var genreData = value.toString().split(',');
                            _bookCon.form.genres = [];
                            for (var t in genreData) {
                              _bookCon.form.genres!.add(t.trim());
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
                height: Get.height * 0.085,
                width: Get.width,
                color: Get.theme.colorScheme.background,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ButtonMain(
                    height: Get.height,
                    width: Get.width,
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        Get.dialog(Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Container(
                              color: Get.theme.colorScheme.background,
                              width: Get.width * 0.8,
                              height: Get.height * 0.4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const CircularProgressIndicator(),
                                  Text(
                                    "Please Wait",
                                    style: Get.textTheme.bodyLarge,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ));
                        if (_bookCon.form.id == null) {
                          await _bookCon.createBook(_bookCon.form).then((value) {
                            Get.back();
                          });
                        } else {
                          await _bookCon.updateBook(_bookCon.form).then((value) => Get.back());
                        }
                        Get.back();
                      }
                    },
                    color: Get.theme.primaryColor,
                    background: Get.theme.colorScheme.primary,
                    style: Get.textTheme.labelLarge,
                    label: "Simpan",
                  ),
                ))
          ],
        ),
      ),
    );
  }

  String? _genreText(List<String>? data) {
    if (data != null) {
      return data.join(', ');
    }
    return null;
  }

  Widget _formWithDatePicker(
      {required String label,
      required String hint,
      DateTime? initialValue,
      Function()? onTap,
      String? Function(Object?)? onValidate}) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: FormField(
        validator: onValidate,
        builder: (field) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    label,
                    style: Get.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(height: 8.0),
              ],
            ),
            GestureDetector(
              onTap: onTap,
              child: Container(
                width: Get.width,
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Get.theme.primaryColor, width: 1)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      initialValue != null
                          ? DateFormat("dd-MM-yyyy").format(initialValue)
                          : "Masukkan Tanggal Lahir",
                      style: Get.textTheme.bodyText1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<XFile?> _onPickImage(ImageSource source) async {
    XFile? imageFile = await _picker.pickImage(source: source, imageQuality: 50);
    var datalost = await _picker.retrieveLostData();
    if (!datalost.isEmpty) {
      imageFile = datalost.file;
    }
    if (imageFile != null) {
      return imageFile;
    }
    return null;
  }

  void _selectDate(
      {required BuildContext context,
      required DateTime initialDate,
      Function(DateTime selectedDate)? onDatePicked}) async {
    await showDatePicker(
            context: context,
            initialDate: initialDate,
            firstDate: DateTime(1900, 1),
            lastDate: DateTime(9999))
        .then((value) {
      if (value != null) onDatePicked!(value);
    });
  }
}
