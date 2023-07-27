import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../Api/model.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Model character;
  const CharacterDetailsScreen({super.key, required this.character});

  Widget buildSliverAppbar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: Color.fromARGB(255, 126, 12, 69),
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          character.name,
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.start,
        ),
        background: Hero(
          tag: character.id,
          child: Image.network(
            character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

   Widget characterInfo(String title ,String value){
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(children: 
      [
       TextSpan(
        text: title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,

        )
       ) ,
         TextSpan(
        text: value,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          
        )
       ) 
      ]),);

   }

   Widget buildDevider(double endIndent){
    return Divider(
      color:Colors.white ,
      height: 30,
      endIndent: endIndent,
      thickness: 2,

      ); 
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 126, 12, 69),
      body: CustomScrollView(
        slivers: [
          buildSliverAppbar(),
           SliverList(delegate: SliverChildListDelegate(
            [
          Container(
            margin: EdgeInsets.fromLTRB( 14, 14, 14, 0),
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                characterInfo('name : ', character.name),
                buildDevider(315),
                 characterInfo('Job : ', 'Biologist'),
                buildDevider(330),
                 characterInfo('status : ', character.status),
                buildDevider(315),
                 characterInfo('gender : ', character.gender),
                buildDevider(315),
                 characterInfo('seasons : ', character.id.toString()),
                buildDevider(315),
                 characterInfo('species : ', character.species),
                buildDevider(310),
                SizedBox(height: 20,)
              ],
            ),
          ),
          SizedBox(height: 500,)
           ])),
           ],
      ),
    );
  }
}
