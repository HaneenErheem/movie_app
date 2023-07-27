
import 'package:flutter/material.dart';
import 'package:movie_app/app_router.dart';
import 'package:movie_app/screens/home.dart';

void main() => runApp(Main(appRouter: AppRouter(),));

class Main extends StatelessWidget {
  
  const Main({Key? key, required this.appRouter}) : super(key: key);
   final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
