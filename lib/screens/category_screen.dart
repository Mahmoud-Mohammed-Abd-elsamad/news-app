import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/category_model.dart';
import '../shared/component/widget/category_item.dart';

class CategoryScreen extends StatelessWidget {

  CategoryScreen({super.key, required this.onCategoryClicked});
 static const   String routeName = "CategoryScreen";
 // static int? categoryIndex;
 final Function(CategoryModel) onCategoryClicked;


 final List categoriesList = [
    CategoryModel(
        color: 0xff707070,
        logo: "assets/logo/sports_icon.png",
        name: "Sports",
        isLeft: true, id: 'sports'),
    CategoryModel(
        color: 0xff003E90,
        logo: "assets/logo/environment.png",
        name: "Politics",
        isLeft: false, id: 'technology'),
    CategoryModel(
        color: 0xffED1E79,
        logo: "assets/logo/health_logo.png",
        name: "Health",
        isLeft: true, id: 'health'),
    CategoryModel(
        color: 0xffCF7E48,
        logo: "assets/logo/bussines_logo.png",
        name: "Bussines",
        isLeft: false, id: 'business'),
    CategoryModel(
        color: 0xff4882CF,
        logo: "assets/logo/environment.png",
        name: "Enviroment",
        isLeft: true, id: 'entertainment'),
    CategoryModel(
        color: 0xffF2D352,
        logo: "assets/logo/science_logo.png",
        name: "Sience",
        isLeft: false, id: 'science')
  ];



  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: const EdgeInsets.all(8),
              child: Text("Pick your category\n of interest",style: GoogleFonts.poppins(fontSize: 22,fontWeight: FontWeight.bold),)),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: categoriesList.length,
              itemBuilder: (context, index) => InkWell(
                onTap:(){
                  onCategoryClicked(categoriesList[index]);
                },
                child: CategoryItem(

                  category: categoriesList[index],
                ),
              ),
            ),
          ),
        ]);
  }
}

