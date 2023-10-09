import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.category}) : super(key: key);
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        width: 148,
        height: 171,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: const Radius.circular(12),topLeft: const Radius.circular(12),
          bottomLeft: category.isLeft ?  const Radius.circular(12):  const Radius.circular(0),
            bottomRight: category.isLeft ?  const Radius.circular(0):  const Radius.circular(12),),
          color: Color(category.color)
        ),
        child: Column(
          children: [
            const SizedBox( height:6),
            Image.asset(category.logo),
            const SizedBox( height:6),
            Center(child: Text(category.name,style: GoogleFonts.exo(color: Colors.white,fontSize: 22),)),
          ],
        ),
      ),
    );
  }
}
