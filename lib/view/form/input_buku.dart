import 'dart:developer';

import 'package:elibrary/view/components/bordered_input_text.dart';
import 'package:elibrary/view/components/button_main.dart';
import 'package:elibrary/view/components/profile_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class InputBuku extends StatefulWidget {
  const InputBuku({super.key});

  @override
  State<InputBuku> createState() => _InputBukuState();
}

class _InputBukuState extends State<InputBuku> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: const Center(
          child: Text(
            "Input Buku",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
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
                        ProfileTextfield(
                          hintText: "Nama Buku",
                          initialValue: null,
                          title: Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 4),
                            child: Text(
                              "Nama Buku",
                              style: Get.textTheme.titleMedium!
                                  .copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                          onSaved: (value) {},
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Deskripsi",
                          style: Get.textTheme.titleMedium!
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                        BorderedInputText(
                          maxLines: 3,
                          addSuffix: false,
                          readOnly: false,
                          onSaved: (value) {},
                        ),
                        ProfileTextfield(
                          hintText: "ISBN",
                          initialValue: null,
                          title: Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 4),
                            child: Text(
                              "ISBN",
                              style: Get.textTheme.titleMedium!
                                  .copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                          onSaved: (value) {},
                        ),
                        _formWithDatePicker(
                            label: "Tahun Terbit",
                            hint: "Tahun Terbit",
                            onTap: () => _selectDate(
                                  context: Get.context!,
                                  initialDate: DateTime.now(),
                                  onDatePicked: (selectedDate) {
                                    log("selected date: $selectedDate");
                                    setState(() {
                                      // controller.promotionModel.endTime = selectedDate;
                                    });
                                  },
                                )),
                        ProfileTextfield(
                          hintText: "Pengarang",
                          initialValue: null,
                          title: Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 4),
                            child: Text(
                              "Pengarang",
                              style: Get.textTheme.titleMedium!
                                  .copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                          onSaved: (value) {},
                        ),
                        ProfileTextfield(
                          hintText: "Penerbit",
                          initialValue: null,
                          title: Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 4),
                            child: Text(
                              "Penerbit",
                              style: Get.textTheme.titleMedium!
                                  .copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                          onSaved: (value) {},
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
                    onTap: () {},
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
                    style: Get.textTheme.titleMedium!
                        .copyWith(fontWeight: FontWeight.w700),
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
                    border:
                        Border.all(color: Get.theme.primaryColor, width: 1)),
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
