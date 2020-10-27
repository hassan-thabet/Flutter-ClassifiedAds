

class Categories{

  int category_id;
  String category_name , icon_url;

  Categories(this.category_id, this.category_name , this.icon_url);

  Categories.fromJson(Map<String , dynamic> jsonObject){
    this.category_id = jsonObject['category_id'];
    this.category_name = jsonObject['category_name'];
    this.icon_url = jsonObject['icon_url'];
  }
}