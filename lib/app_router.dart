import 'package:flutter/material.dart';
import 'package:movie_app/Api/model.dart';
import 'package:movie_app/screens/characterDetailsScreen.dart';
import 'package:movie_app/screens/home.dart';
import 'package:movie_app/constants.dart';
class AppRouter{
Route? generateRoute(RouteSettings settings ){
switch (settings.name) {

  case charactersScreen:
    return MaterialPageRoute(builder: (_)=>Home());

  case characterDetailsScreen:
  final character = settings.arguments as Model;
    return MaterialPageRoute(builder: (_)=>CharacterDetailsScreen(character: character,));

 
}
}
}