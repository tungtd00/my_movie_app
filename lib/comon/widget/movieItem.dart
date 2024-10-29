import 'package:flutter/material.dart';

class MovieItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int year;
  final Function onTap;
  const MovieItem({super.key, required this.imageUrl,required this.name, required this.year,required this.onTap });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> onTap,
      child: Container(
        alignment: Alignment.center,
        width: 180,
        height: 280,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: ClipRRect(
              borderRadius:  BorderRadius.circular(12),
              child: Image.network(imageUrl,fit: BoxFit.fill,height:212 ,width:170,))),
            Text(name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            Text(year.toString(),style: TextStyle(fontSize: 14),)
    
          ],
        ),
      ),
    );
  }
}