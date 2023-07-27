import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movie_app/Api/repository.dart';

import '../Api/model.dart';
import '../widgets/character_item.dart';
import '../widgets/myText.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
//اول اشي بنعمل اوبجكت من الريبوزيتوري علشان يجيب الداتا لليو اي 
Repository repository =Repository();
late Model characterData;
bool isLoading=false;
late List<Model> allCharacters; 
bool _isSearching =false;
final _searchTextController = TextEditingController();
late List<Model> searchedForCharacter;


Future<void> getData() async{
    setState(() {
      isLoading = true;
    });
    await repository.getCharacterData().then((value) {
      if(value.isEmpty){
        print('Empty:(');
      }else{
        print('not empty');
        allCharacters = value;
        setState(() {
          isLoading = false;
        });
      }
    });
  }
  ///////--------search function ------------------////////////////////////
   Widget _buildSearchField(){
    return TextField(
      controller: _searchTextController,
      cursorColor: const Color(0xFF13152F),
      decoration: const InputDecoration(
        hintText: 'Find a character... ',
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white, fontSize: 18),
      ),
      style: const TextStyle(color: Colors.white, fontSize: 18),
      onChanged: (searchedCharacter){
        if(searchedCharacter.isEmpty)
          {
            print('searchedCharacter is empty');
            getData();
          }
        else{
          print('searchedCharacter is not empty');
          addSearchedForItemsToSearchedList(searchedCharacter);//هاي فنكشن عملتها تحت وظيفتها تاخود النص الي دخلتو على السيرش واتشوف العناصر الي بتخص هاد الحرف
        }
      },
    );
  }
void addSearchedForItemsToSearchedList(searchedCharacter){
    //اللستة الي بدي احط فيها العناصر الي هعرضهم//
    // بقدر اغيرها ل contains
    setState(() {
      allCharacters = allCharacters.where(
              (characterData) =>
              characterData.name.toLowerCase().startsWith(searchedCharacter)).toList();
    });
  }
  List<Widget> _buildAppBarActions(){
    if(_isSearching){
      return[
        IconButton(
            onPressed: (){
              _clearSearch();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.clear, color: Color(0xFF13152F),))
      ];
    }else{
      //في حالة ما بعمل سيرش
      return[
        IconButton(
            onPressed: _startSearch,
            icon: const Icon(Icons.search, color: Color(0xFF13152F),)
        ),
      ];
    }
  }
  void _startSearch(){
    ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching= true;
    });
  }
  void _stopSearching(){
    _clearSearch();
    setState(() {
      _isSearching= false;
    });
  }
  void _clearSearch(){
    setState(() {
      _searchTextController.clear();//بيمسح الداتا الي في الكونترولير
    });
  }
  Widget _buildAppBarTitel(){
    return MyText(
      text: 'Rick & Morty',color: Colors.white,
    );
  }


//هلأ بيحط الجيت داتا ف الانيت ستيت
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
      AppBar(
        title:  _isSearching ? _buildSearchField() : _buildAppBarTitel(),
        actions:_buildAppBarActions(),
        
        backgroundColor: Color.fromARGB(255, 126, 12, 69)),
    body:
     isLoading?const Text('LOADING...'):GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        childAspectRatio: 2/3),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount:allCharacters.length,
        padding: EdgeInsets.zero, 
      itemBuilder: (context,index){
        return CharacterItem(character: allCharacters[index],);
        /////////Not Done
        
      })
    );
  }
}

  //  body: isLoading?const Text('LOADING...'):GridView.count(
  //     crossAxisCount: 2,
  //     mainAxisSpacing: 15,
  //     crossAxisSpacing: 15,
  //     children:
  //       List.generate(
  //         characterData.results.length,
  //          (index) => Card(
  //          child: Column(
  //           children:
  //           [
  //            Expanded(child: Image.network('${characterData.results[index]['image']}')),
  //            MyText(text: '${characterData.results[index]['id']}',),
  //            MyText(text: '${characterData.results[index]['name']}',),
  //            MyText(text: '${characterData.results[index]['gender']}',),
  //            MaterialButton(
  //             color: Colors.blue,
  //             onPressed: (){},
  //             child:MyText(text:'character detailes',color: Colors.white) ,)
  //            ]
  //          ),
  //          ))
  //     ),