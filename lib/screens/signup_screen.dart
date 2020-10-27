import 'dart:io';
import 'package:classified_ads/api/authentication.dart';
import 'package:classified_ads/component/custom_dialog.dart';
import 'package:classified_ads/ui/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  bool isLoading = false;
  File _image;
  String _filePath;
  String _fileName;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
      _filePath = image.path;
      _fileName = basename(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    Authentication authentication = Authentication();


    final TextEditingController _first_nameController = new TextEditingController();

    final TextEditingController _last_nameController = new TextEditingController();

    final TextEditingController _emailController = new TextEditingController();

    final TextEditingController _mobileController = new TextEditingController();

    final TextEditingController _passwordController = new TextEditingController();

   _onPressed() {

      setState(() {

        isLoading = true;

        if (

          _first_nameController.text.trim().isNotEmpty &&
          _last_nameController.text.trim().isNotEmpty &&
          _emailController.text.trim().toLowerCase().isNotEmpty &&
          _mobileController.text.trim().isNotEmpty &&
          _passwordController.text.isNotEmpty && _image != null
            
            ) {

            authentication
                .register(
                _first_nameController.text,
                _last_nameController.text, _emailController.text.trim(),
                _mobileController.text , _passwordController.text , _filePath , _fileName
            )

              .whenComplete(() => {

                    if (authentication.status != 201)
                      {
                        Navigator.pushReplacementNamed(context, '/signup'),
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => CustomDialog(
                            title: "Failed",
                            description: "We are having trouble on connecting",
                            buttonText: "Ok",
                            icon: Icon(
                              Icons.clear,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                        isLoading = false,
                      }
                    else {

                      Navigator.pushReplacementNamed(context, '/login'),
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => CustomDialog(
                          title: "Done ",
                          description: "Your data saved successfully , Login now using email and password",
                          buttonText: "Ok",
                          icon: Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                      isLoading = false,
                    }
                  });
        }
        else{
          isLoading = false;
          showDialog(
            context: context,
            builder: (BuildContext context) => CustomDialog(
              title: "Missed data",
              description: "Here is missed data error",
              buttonText: "Ok",
              icon: Icon(
                Icons.clear,
                color: Colors.white,
                size: 40,
              ),
            ),
          );
        }

        isLoading = false;
      });
    }


    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: isLoading
      ? Container(
        color: KBackgroundColor,
        child: Center(
            child: SizedBox(
              height: 80,
              width: 80,
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(KMainColor),
                strokeWidth: 1.5,
              ),
            )
        ),
      )
      : Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Colors.purple[200],
            KMainColor,
            KMainColor,
          ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // SizedBox(
            //   height: 100,
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: Text('SIGN UP',
            //       style: TextStyle(
            //         letterSpacing: 8,
            //         fontFamily: 'PoiretOne',
            //         fontSize: 38,
            //         color: Colors.white,
            //         fontWeight: FontWeight.w700,
            //       )),
            // ),
            // SizedBox(
            //   height: 40,
            // ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: KBackgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35))),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.purple[200].withAlpha(100),
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                right: 20, left: 20, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey[200])),
                            ),
                            child: InkWell(
                                onTap: getImage,
                                child: _image == null
                                    ? CircleAvatar(
                                        radius: 75,
                                        child: Image.asset(
                                            'assets/images/placeholder.jpg'))
                                    : CircleAvatar(
                                        radius: 75,
                                        backgroundImage: new FileImage(_image))),
                          ),
                          Container(
                          padding: EdgeInsets.only(
                          right: 20, left: 20, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            border: Border(
                            bottom: BorderSide(color: Colors.grey[200])),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _first_nameController,
                            decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          hintText: "First Name",
                          border: InputBorder.none,
                            ),
                          ),
                          ),
                          Container(
                          padding: EdgeInsets.only(
                          right: 20, left: 20, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            border: Border(
                            bottom: BorderSide(color: Colors.grey[200])),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _last_nameController,
                            decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          hintText: "Last Name",
                          border: InputBorder.none,
                            ),
                          ),
                          ),
                          Container(
                          padding: EdgeInsets.only(
                          right: 20, left: 20, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            border: Border(
                            bottom: BorderSide(color: Colors.grey[200])),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                            decoration: InputDecoration(
                          icon: Icon(Icons.email),
                          hintText: "Email",
                          border: InputBorder.none,
                            ),
                          ),
                          ),
                          Container(
                          padding: EdgeInsets.only(
                          right: 20, left: 20, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            border: Border(
                            bottom: BorderSide(color: Colors.grey[200])),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _mobileController,
                            decoration: InputDecoration(
                          icon: Icon(Icons.phone),
                          hintText: "Phone Number",
                          border: InputBorder.none,
                            ),
                          ),
                          ),
                          Container(
                          padding: EdgeInsets.only(
                          right: 20, left: 20, top: 10, bottom: 10),
                          child: TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                          icon: Icon(Icons.vpn_key),
                          hintText: "Password",
                          border: InputBorder.none,
                            ),
                          ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Spacer(),
                    InkWell(
                      onTap: _onPressed,
                      child: CircleAvatar(
                        backgroundColor: KMainColor,
                        radius: 26,
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
