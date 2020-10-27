
import 'product_category.dart';
import 'product_user.dart';

class Products{

  int product_id;
  String  product_title , product_description , product_status;
  double product_price;
  ProductCategory product_category;
  ProductUser product_user;
  List<String> product_images;


  Products(
      this.product_id,
      this.product_title,
      this.product_description,
      this.product_status,
      this.product_price,
      this.product_category,
      this.product_user,
      this.product_images
      );

  Products.fromJson(Map<String , dynamic> jsonObject){
    this.product_id = jsonObject['product_id'];
    this.product_title = jsonObject['product_title'];
    this.product_description = jsonObject['product_description'];
    this.product_status = jsonObject['product_status'];
    this.product_price = jsonObject['product_price'];
    this.product_user = ProductUser.fromJson(jsonObject['user']);
    this.product_category = ProductCategory.fromJson(jsonObject['category']);
    _setImages(jsonObject['product_images']);

  }



  void _setImages( List<dynamic> jsonImages){
    product_images = [];
    if(jsonImages.length > 0){
      for(var image in jsonImages){
        if(product_images != null){
          this.product_images.add(image['image_url']);
        }

      }
    }

  }




}