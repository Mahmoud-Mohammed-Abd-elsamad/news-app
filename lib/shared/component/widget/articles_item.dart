import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ArticlesItem extends StatelessWidget {
  const ArticlesItem({Key? key, required this.image, required this.auther, required this.content, required this.date}) : super(key: key);

  final String image;
  final String auther;
  final String content;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8))
          ),
          child: Stack(children: [
            Container(height: 212,),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: Column(children:[SizedBox(height: 20,), CircularProgressIndicator()])),
            ),
            ClipRRect(borderRadius: const BorderRadius.all(Radius.circular(8)),child: Image.network(image)),
          ],),
        ),
          const SizedBox(height: 6,),

          Row(children:[ Text(auther,style:GoogleFonts.poppins(fontSize: 10,))]),
          const SizedBox(height: 2,),
          Text(content,style:GoogleFonts.poppins(fontSize: 14,fontWeight:FontWeight.w500 ),textAlign: TextAlign.start,maxLines: 2,),
          const SizedBox(height: 2,),
          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Text(date,style:GoogleFonts.poppins(fontSize: 13),textAlign: TextAlign.start,)]),
          const SizedBox(height: 6,),


        ]
      ),
    );
  }
}
