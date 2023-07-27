// class Model {
//   List <dynamic> results;

  
//  Model({required  this.results});

  
//    factory Model.fromJson(Map<String,dynamic> jsonData)
//   {
//     return Model(results: jsonData['results']);
//   }
// }
class Model{
  int id;
  String name;
  String species;
  String status;
  String gender;
  String image;


  Model({
    required this.id,

    required this.name,
    required this.gender,
    required this.status,
    required this.species,
    required this.image,
  });

  factory Model.fromJson(Map<String,dynamic> jsonData){
    return Model(
        id: jsonData['id'],

        name: jsonData['name'],
        gender: jsonData['gender'],
        status: jsonData['status'],
        species: jsonData['species'],
        image: jsonData['image']
    );
  }
}
