
class ProductCategory{
  String category_name ;
  String icon_url ;
  int category_id;

  ProductCategory(this.category_name, this.category_id , this.icon_url);
  ProductCategory.fromJson( Map <String , dynamic> jsonObject ){
    this.category_name = jsonObject['category_name'];
    this.category_id = jsonObject['category_id'];
    this.icon_url = jsonObject['icon_url'];

  }

}