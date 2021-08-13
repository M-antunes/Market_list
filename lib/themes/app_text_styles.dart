import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_list/themes/app_colors.dart';

class AppTextStyles {
  static final title = GoogleFonts.montserrat(
    fontSize: 23,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static final subTitle = GoogleFonts.montserrat(
    fontSize: 19,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
  static final items = GoogleFonts.montserrat(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
  static final itemsOnSelected = GoogleFonts.montserrat(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.contrastColor,
  );
  static final quantity = GoogleFonts.lora(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static final quantityOnSelected = GoogleFonts.lora(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.contrastColor,
  );
  static final formText = GoogleFonts.montserrat(
    fontSize: 17,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
  static final typeDescription = GoogleFonts.montserrat(
    fontSize: 15,
    fontWeight: FontWeight.w300,
    color: Colors.black,
  );
  static final typeDescriptionOnSelected = GoogleFonts.montserrat(
    fontSize: 15,
    fontWeight: FontWeight.w300,
    color: AppColors.contrastColor,
  );
}
