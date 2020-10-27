
import 'package:classified_ads/models/product.dart';
import 'package:classified_ads/models/product_user.dart';
import 'package:classified_ads/utilities/api_helper.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  final Products product;

  const ProductScreen({Key key, this.product}) : super(key: key);


  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf0f0f0),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        brightness: Brightness.light,
        backgroundColor: Color(0xFFf0f0f0),
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.only( left: 16),
          child: Text(
            widget.product.product_title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFFAC7FFD),
          onPressed: (){},
          child: Icon(Icons.phone , color: Colors.white,),
      ),
      body: Column(
        children: [
          Image.network(
           (widget.product.product_images.length > 0)
              ? ApiHelper.IMAGES + widget.product.product_images[0]
              : "https://www.formagenda.com/wp-content/uploads/woocommerce-placeholder-400x400@2x.png",
          ),

          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                CircleAvatar(backgroundImage: NetworkImage(
                  ApiHelper.USER_PHOTO + widget.product.product_user.photo_url),
                   radius: 30,),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.product_user.first_name+' ' + widget.product.product_user.last_name,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18
                      ),
                    ),
                    Text(
                      widget.product.product_category.category_name,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  widget.product.product_price.toString()+" EGP",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18
                  ),
                ),


             ],
            ),
          )
        ],
      ),
    );
  }
}
