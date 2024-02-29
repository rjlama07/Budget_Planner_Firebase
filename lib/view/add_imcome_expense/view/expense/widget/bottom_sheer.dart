import 'package:flutter/material.dart';

import 'package:myapp/utils/assets_source.dart/images_source.dart';
import 'package:myapp/widgets/svg_icons.dart';

Widget categoryBottomSheet(
    BuildContext context, TextEditingController controller) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 21),
    child: Column(
      children: [
        InkWell(
          onTap: () => Navigator.pop(context),
          child: const Row(
            children: [
              Icon(Icons.arrow_back_ios),
              Text("Select a Categrory"),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                controller.text = "Shopping";
                Navigator.pop(context);
              },
              child: categoryContainer(
                titile: "Shopping",
                svgIcon: SvgIconsSource.expenseSvg,
                color: const Color(0xFF47B6D4),
              ),
            ),
            InkWell(
              onTap: () {
                controller.text = "Transports";
                Navigator.pop(context);
              },
              child: categoryContainer(
                titile: "Transport",
                svgIcon: SvgIconsSource.incomeSvg,
                color: const Color(0xFFEBA90D),
              ),
            ),
            InkWell(
              onTap: () {
                controller.text = "Resturant";
                Navigator.pop(context);
              },
              child: categoryContainer(
                titile: "Resturant",
                svgIcon: SvgIconsSource.expenseSvg,
                color: const Color(0xFF4E61B6),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget categoryContainer({
  required String titile,
  required String svgIcon,
  required Color color,
}) {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 21),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24), color: color),
        child: SvgIcon(
          icon: svgIcon,
          height: 32,
          width: 32,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Text(titile,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
    ],
  );
}
