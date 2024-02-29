import 'package:flutter/material.dart';

import '../../../widgets/svg_icons.dart';

Widget encIncContainer({
  required String title,
  required String svgIcon,
  required Color color,
  required Function onTap,
}) {
  return InkWell(
    onTap: ()=>onTap(),
    child: Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          CircleAvatar(
            radius: 24,
            backgroundColor: color,
            child: SvgIcon(icon: svgIcon),
          ),
        ],
      ),
    ),
  );
}
