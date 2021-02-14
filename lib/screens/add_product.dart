import 'package:classified_ads/api/products_api.dart';
import 'package:classified_ads/component/custom_dialog.dart';
import 'package:classified_ads/ui/custom_colors.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    // File _image;
    // final picker = ImagePicker();

    // Future getImage() async {
    //   final pickedFile = await picker.getImage(source: ImageSource.gallery);

    //   setState(() {
    //     _image = File(pickedFile.path);
    //   });
    // }

    ProductsApi productsApi = ProductsApi();
    final TextEditingController _titleController = new TextEditingController();
    final TextEditingController _descriptionController =
        new TextEditingController();
    final TextEditingController _priceController = new TextEditingController();
    final TextEditingController _category_idController =
        new TextEditingController();
    final TextEditingController _user_idController =
        new TextEditingController();

    _onPressed() {
      setState(() {
        if (_titleController.text.isNotEmpty &&
            _descriptionController.text.isNotEmpty &&
            _priceController.text.isNotEmpty &&
            _category_idController.text.isNotEmpty &&
            _user_idController.text.isNotEmpty) {
          ProductsApi()
              .newProduct(
                  _titleController.text,
                  _descriptionController.text,
                  _priceController.text,
                  _category_idController.text,
                  _user_idController.text)
              .whenComplete(() => {
                    if (productsApi.status)
                      {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => CustomDialog(
                            title: "Failed",
                            description:
                                "Error was happined When we saving data",
                            buttonText: "Ok",
                            icon: Icon(
                              Icons.clear,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        )
                      }
                    else
                      {
                        Navigator.pushReplacementNamed(context, '/home'),
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => CustomDialog(
                            title: "Success",
                            description: "Your data has been saved successfuly",
                            buttonText: "Ok",
                            icon: Icon(
                              Icons.clear,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        )
                      }
                  });
        }
      });
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        //onPressed: getImage,
        onPressed: () {},
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
        backgroundColor: KMainColor,
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        brightness: Brightness.light,
        backgroundColor: Color(0xFFf0f0f0),
        elevation: 0.0,
        centerTitle: true,
        title: Text('Post Your AD',
            style: TextStyle(
              fontFamily: 'Raleway',
              color: Colors.black87.withAlpha(200),
            )),
      ),
      backgroundColor: Color(0xFFf0f0f0),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Container(
                padding:
                    EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 10),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey[200])),
                ),
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller: _titleController,
                  decoration: InputDecoration(
                    hintText: "Title",
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 10),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey[200])),
                ),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    hintText: "Description",
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 10),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey[200])),
                ),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _priceController,
                  decoration: InputDecoration(
                    hintText: "Price",
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 10),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey[200])),
                ),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _category_idController,
                  decoration: InputDecoration(
                    hintText: "Category ID",
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 10),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey[200])),
                ),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _user_idController,
                  decoration: InputDecoration(
                    hintText: "User ID",
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: _onPressed,
                child: CircleAvatar(
                  backgroundColor: KMainColor,
                  radius: 30,
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
