import 'package:flutter/material.dart';

Widget listingElevent(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: const Color(0xFF4A556812).withOpacity(0.07),
        spreadRadius: 1,
        blurRadius: 7,
        offset: const Offset(0, 3),
      ),
    ], borderRadius: BorderRadius.circular(12), color: Colors.white),
    child: Row(
      children: [
        Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: const Color(0xFF81B2CA).withOpacity(0.14)),
          child: const Center(
            child: Icon(
              Icons.home,
              size: 36,
            ),
          ),
        ),
        const SizedBox(width: 20),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Rent",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            Text(
              "10 Jan 2022",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ],
        ),
        const Spacer(),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Rent",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            Text(
              "10 Jan 2022",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ],
        ),
      ],
    ),
  );
}

