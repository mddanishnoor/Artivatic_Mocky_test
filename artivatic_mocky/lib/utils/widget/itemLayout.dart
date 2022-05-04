import 'package:artivatic_mocky/models/mocky_model.dart';
import 'package:flutter/material.dart';

Widget itemLayout(Rows row) {
  return Container(
    margin: const EdgeInsets.all(8),
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.grey.shade50,
      border: Border.all(color: Colors.black, width: 1.0),
      borderRadius: const BorderRadius.all(
          Radius.circular(10.0) //                 <--- border radius here
          ),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        row.imageHref != null
            ? Container(
                width: 100,
                height: 100,
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  row.imageHref!,
                  fit: BoxFit.fill,
                  // scale: 3.5,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.hide_image_rounded,
                    size: 40,
                  ),
                ),
              )
            : Container(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8),
                child: Text(row.title ?? "N/A",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )),
              ),
              Container(
                padding: const EdgeInsets.only(top: 5, left: 8),
                child: Text(row.description ?? 'N/A'),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
