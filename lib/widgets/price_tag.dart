import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../resources/consts.dart';

class PriceTag extends StatelessWidget {
  final String price;
  const PriceTag({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColor.accent.withOpacity(0.3),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.attach_money,
                size: 14,
                color: AppColor.accent,
              ),
              Text(
                price,
                style: GoogleFonts.nunito(
                  fontSize: 14,
                  color: AppColor.accent,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
