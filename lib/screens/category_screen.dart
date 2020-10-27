import 'package:classified_ads/api/categories_api.dart';
import 'package:classified_ads/models/categories.dart';
import 'package:classified_ads/ui/size_config.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  final Categories category;

  const CategoryScreen({Key key, this.category}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

CategoriesApi categoriesApi = CategoriesApi();

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.category_name),
      ),
      body: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(widget.category.icon_url),
                fit: BoxFit.cover)),
      ),
    );
  }
}

// Widget _error(String error) {
//   return Container(
//     child: Center(
//       child: Text(error),
//     ),
//   );
// }

// Widget _loading() {
//   return Container(
//     color: Color(0xFFf0f0f0),
//     child: Center(
//         child: SizedBox(
//       height: 80,
//       width: 80,
//       child: CircularProgressIndicator(
//         valueColor: new AlwaysStoppedAnimation<Color>(Color(0xFFAC7FFD)),
//         strokeWidth: 1.5,
//       ),
//     )),
//   );
// }

// Widget _drowProductCard(Categories category) {
//   return Card(
//     child: Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               SizedBox(
//                 height: 20,
//               ),
//               CircleAvatar(
//                 backgroundImage: NetworkImage(category.category_name),
//                 radius: 25,
//               ),
//               SizedBox(
//                 width: 20,
//               ),
//               Text(
//                 products.product_user.first_name +
//                     ' ' +
//                     products.product_user.last_name,
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           (products.product_images.length > 0)
//               ? Image(
//                   image: NetworkImage(products.product_images[0]),
//                 )
//               : Container(
//                   child: Image.network(
//                       "https://www.formagenda.com/wp-content/uploads/woocommerce-placeholder-400x400@2x.png"),
//                 ),
//           SizedBox(
//             height: 20,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Flexible(
//                   child: Text(
//                 products.product_title,
//                 overflow: TextOverflow.ellipsis,
//               )),
//               Padding(
//                 padding: const EdgeInsets.only(left: 8.0),
//                 child: Text(products.product_price.toString()),
//               ),
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
// }
