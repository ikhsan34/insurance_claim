import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:photo_view/photo_view.dart';

class PhotoBox extends StatelessWidget {
  final Function() onTap;
  final Function() onRemove;
  final Uint8List? image;
  const PhotoBox({
    super.key,
    required this.onTap,
    required this.onRemove,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: image == null
          ? onTap
          : () => showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    child: SizedBox(
                      height: 100.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: PhotoView(
                          initialScale: PhotoViewComputedScale.covered,
                          imageProvider: Image.memory(image!).image,
                        ),
                      ),
                    ),
                  );
                },
              ),
      child: Container(
        width: 100.w,
        height: 50.w,
        alignment: image == null ? Alignment.center : Alignment.bottomRight,
        decoration: BoxDecoration(
          image: image != null
              ? DecorationImage(
                  image: Image.memory(image!).image,
                  fit: BoxFit.cover,
                )
              : null,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            const BoxShadow(
              color: Colors.grey,
            ),
            BoxShadow(
              color: Colors.grey[100]!,
              spreadRadius: -0.1,
              blurRadius: 4,
            ),
          ],
        ),
        child: image == null
            ? const Icon(
                Icons.add_a_photo_outlined,
                color: Colors.grey,
              )
            : IconButton(
                onPressed: onRemove,
                icon: Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                  size: 20.dp,
                ),
              ),
      ),
    );
  }
}
