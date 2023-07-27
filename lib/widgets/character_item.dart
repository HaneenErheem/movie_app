import 'package:flutter/material.dart';
import 'package:movie_app/Api/model.dart';

import '../constants.dart';
import 'myText.dart';
class CharacterItem extends StatelessWidget {
  final Model character;

 CharacterItem({Key? key,

   required this.character,
  });

  @override
  Widget build(BuildContext context) {
   return Container(
             width: double.infinity,
             margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
             padding: EdgeInsetsDirectional.all(4),
             decoration: BoxDecoration(
                 color: Color.fromARGB(255, 126, 12, 69),
                 borderRadius: BorderRadius.circular(8)
             ),
             child: InkWell(
              onTap: ()=>Navigator.pushNamed(context,characterDetailsScreen,arguments:character ),
               child: GridTile(
                 child: Hero(
                  /////////////////////////////
                  tag: character.id,
                   child: Container(
                     color: Color.fromARGB(255, 126, 12, 69),
                     child: Column(
                       children: [
                         Expanded(
                          child:
                         Image.network(character.image,fit: BoxFit.cover,),
                         ),
                       ],
                     ),
                   ),
                 ),
                 footer: Container(
                   width: double.infinity,
                   padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                   color: Colors.black54,
                   alignment: Alignment.bottomCenter,
                   child:MyText(text: character.name, color: Colors.white,) ,
                 ),
             
               ),
             ),
           );
  }
}