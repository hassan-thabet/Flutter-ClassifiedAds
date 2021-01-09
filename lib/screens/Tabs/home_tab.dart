import 'package:classified_ads/api/categories_api.dart';
import 'package:classified_ads/api/products_api.dart';
import 'package:classified_ads/models/categories.dart';
import 'package:classified_ads/models/product.dart';
import 'package:classified_ads/screens/category_screen.dart';
import 'package:classified_ads/screens/product_screen.dart';
import 'package:classified_ads/ui/size_config.dart';
import 'package:classified_ads/utilities/api_helper.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  double _width;
  double _height;
  CategoriesApi categoriesApi = CategoriesApi();
  ProductsApi productsApi = ProductsApi();

  void _goToProductScreen(Products product, BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ProductScreen(product: product);
    }));
  }

  void _goToCategoryScreen(Categories category, BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return CategoryScreen(category: category);
    }));
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          brightness: Brightness.light,
          backgroundColor: Color(0xFFf0f0f0),
          elevation: 0.0,
          centerTitle: false,
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 16),
            child: Text('ClassifiedsЛpp',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                  color: Colors.black87.withAlpha(200),
                )),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.notifications,
                      size: 23, color: Colors.black87.withAlpha(200)),
                  SizedBox(width: 20),
                  Icon(
                    Icons.menu,
                    size: 25,
                    color: Colors.black87.withAlpha(200),
                  ),
                  // CircleAvatar(radius: 20, backgroundImage: NetworkImage(authUserImage().photo_url),)
                ],
              ),
            )
          ],
        ),
        backgroundColor: Color(0xFFf0f0f0),
        body: SingleChildScrollView(
          child: Container(
            color: Color(0xFFf0f0f0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      SizedBox(height: 20),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFFf0f0f0),
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(25)),
                            ),
                            padding: EdgeInsets.only(top: 30, bottom: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 18.0),
                                  child: Text('Find Your',
                                      style: TextStyle(
                                        fontFamily: 'Raleway',
                                        fontSize: 24,
                                        color: Colors.black87.withAlpha(180),
                                      )),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 18.0),
                                  child: Text('INTERESTS',
                                      style: TextStyle(
                                        letterSpacing: 8,
                                        fontFamily: 'PoiretOne',
                                        fontSize: 38,
                                        color: Colors.purple,
                                        fontWeight: FontWeight.w700,
                                      )),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.search,
                                          color: Colors.black87,
                                        ),
                                        hintText: "What are you looking for",
                                        hintStyle: TextStyle(
                                            color: Colors.grey, fontSize: 16)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ), // search bar and find your interests text column

                      SizedBox(height: 10),

                      Container(
                        height: 270,
                        width: SizeConfig.screenWidth,
                        child: FutureBuilder(
                          future: categoriesApi.fetchCategories(),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<Categories>> snapShot) {
                            switch (snapShot.connectionState) {
                              case ConnectionState.none:
                                return _error('nothing happened');
                                break;
                              case ConnectionState.waiting:
                                return _loading();
                                break;
                              case ConnectionState.active:
                                return _loading();
                                break;
                              case ConnectionState.done:
                                if (snapShot.hasError) {
                                  return _error(snapShot.error.toString());
                                } else {
                                  if (!snapShot.hasData) {
                                    return _error('NO DATA');
                                  } else {
                                    return Container(
                                      width: double.infinity,
                                      height: 230,
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: snapShot.data.length,
                                          itemBuilder: (context, position) {
                                            return GestureDetector(
                                              onTap: () {
                                                _goToCategoryScreen(
                                                    snapShot.data[position],
                                                    context);
                                              },
                                              child: _drowCategoryCard(
                                                  snapShot.data[position]),
                                            );
                                          }),
                                    );
                                  }
                                }
                                break;
                            }
                            return Container();
                          },
                        ),
                      ), //    Categories ListView.builder

                      SizedBox(
                        height: 30,
                      ),

                      Container(
                        width: SizeConfig.screenWidth,
                        child: FutureBuilder(
                          future: productsApi.fetchProducts(1),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<Products>> snapShot) {
                            switch (snapShot.connectionState) {
                              case ConnectionState.none:
                                return _error('nothing happened');
                                break;
                              case ConnectionState.waiting:
                                return _loading();
                                break;
                              case ConnectionState.active:
                                return _loading();
                                break;
                              case ConnectionState.done:
                                if (snapShot.hasError) {
                                  return _error(snapShot.error.toString());
                                } else {
                                  if (!snapShot.hasData) {
                                    return _error('We Cannot Find any data ');
                                  } else {
                                    return Container(
                                      width: double.infinity,
                                      height: double.maxFinite,
                                      child: ListView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: snapShot.data.length,
                                          itemBuilder: (context, position) {
                                            return GestureDetector(
                                              onTap: () {
                                                _goToProductScreen(
                                                    snapShot.data[position],
                                                    context);
                                              },
                                              child: _drowProductCard(
                                                  snapShot.data[position]),
                                            );
                                          }),
                                    );
                                  }
                                }
                                break;
                            }
                            return Container();
                          },
                        ),
                      ),

                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

Widget _error(String error) {
  return Container(
    child: Center(
      child: Text(error),
    ),
  );
}

Widget _loading() {
  return Container(
    color: Color(0xFFf0f0f0),
    child: Center(
        child: SizedBox(
      height: 80,
      width: 80,
      child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Color(0xFFAC7FFD)),
        strokeWidth: 1.5,
      ),
    )),
  );
}

Widget _drowCategoryCard(Categories categories) {
  return AspectRatio(
      aspectRatio: 2.20 / 3,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
              right: 15.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(categories.icon_url)),
            ),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient:
                      LinearGradient(begin: Alignment.bottomRight, stops: [
                    0.1,
                    0.9
                  ], colors: [
                    Colors.blueAccent.withOpacity(.8).withAlpha(120),
                    Colors.deepPurpleAccent.withOpacity(.8).withAlpha(120),
                  ])),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text.rich(TextSpan(
                      children: [
                        TextSpan(
                            text: categories.category_name,
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'PoiretOne'))
                      ],
                    )),
                  ),
                ],
              ),
            ],
          )
        ],
      ));
}

Widget _drowProductCard(Products products) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: 20,
              ),
              CircleAvatar(
                 backgroundImage:
                  NetworkImage(ApiHelper.USER_PHOTO + products.product_user.photo_url),
                radius: 25,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                products.product_user.first_name +
                    ' ' +
                    products.product_user.last_name,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Image.network(
            (products.product_images.length > 0)
                ? ApiHelper.IMAGES + products.product_images[0]
                : "https://www.formagenda.com/wp-content/uploads/woocommerce-placeholder-400x400@2x.png",
          ),

          // (products.product_images.length > 0)
          //     ? Image(
          //         image: NetworkImage(ApiHelper.IMAGES + products.product_images[0]),
          //       )
          //     : Container(
          //         child: Image.network(
          //             "https://www.formagenda.com/wp-content/uploads/woocommerce-placeholder-400x400@2x.png"),
          //       ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child: Text(
                products.product_title,
                overflow: TextOverflow.ellipsis,
              )),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(products.product_price.toString()),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
