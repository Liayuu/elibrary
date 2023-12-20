import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class ImagePickerSheet extends StatelessWidget {
  BoolCallback? stats;
  ImagePickerSheet({super.key, this.stats});
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.3,
      expand: false,
      snap: true,
      builder: (context, scrollController) => Container(
        color: Get.theme.colorScheme.background,
        width: Get.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Ambil gambar menggunakan",
                style: Get.textTheme.titleLarge!,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: InkWell(
                      // splashColor: Pallete.lightGrey,
                      onTap: () {
                        stats!(ImageSource.camera);
                        Get.back();
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.camera_alt_rounded,
                            size: 28,
                            color: Get.theme.colorScheme.primary,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Kamera",
                            style: Get.textTheme.bodyLarge
                                ?.copyWith(color: Get.theme.colorScheme.primary),
                          )
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: InkWell(
                      // splashColor: Pallete.lightGrey,
                      onTap: () {
                        stats!(ImageSource.gallery);
                        Get.back();
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.photo, size: 28, color: Get.theme.colorScheme.primary),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Galeri",
                            style: Get.textTheme.bodyLarge
                                ?.copyWith(color: Get.theme.colorScheme.primary),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

typedef BoolCallback = void Function(ImageSource response);
