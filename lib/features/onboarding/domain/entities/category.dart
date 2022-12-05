class Category{
  final int id;
  final String title;
  final String image;
  bool isSelected=false;

  Category({required this.id, required this.title, required this.image,required this.isSelected});

 Map<String,dynamic> toJson(){
   return {
     'id':id,
     'title':title,
     'image':image,
     'isSelected':isSelected
   };
 }
}

