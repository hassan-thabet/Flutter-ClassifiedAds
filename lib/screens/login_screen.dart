import 'package:classified_ads/api/authentication.dart';
import 'package:classified_ads/ui/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:classified_ads/component/custom_dialog.dart';



class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Authentication authentication = Authentication();

    // String statusMessage = '';

    final TextEditingController _emailController = new TextEditingController();

    final TextEditingController _passwordController = new TextEditingController();

    _onPressed() {
      setState(() {
        isLoading = true;
        if (_emailController.text.trim().toLowerCase().isNotEmpty &&
            _passwordController.text.isNotEmpty) {
          authentication
              .login(_emailController.text, _passwordController.text)
              .whenComplete(() => {
                    if (authentication.status)
                      {
                        Navigator.pushReplacementNamed(context, '/login'),

                        showDialog(
                          context: context,
                          builder: (BuildContext context) => CustomDialog(
                            title: "Failed",
                            description: "E-mail or password is incorrect",
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
                    else
                      {
                        isLoading = false,
                        Navigator.pushReplacementNamed(context, '/home')
                      }
                  });
        }
        else{
          isLoading = false;
          showDialog(
            context: context,
            builder: (BuildContext context) => CustomDialog(
              title: "Missed data in login",
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
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('LOGIN',
                  style: TextStyle(
                    letterSpacing: 8,
                    fontFamily: 'PoiretOne',
                    fontSize: 38,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  )),
            ),
            SizedBox(
              height: 40,
            ),
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
                    // Container(
                    //   height: 50,
                    //   child: new Text(
                    //     '$statusMessage',
                    //     textAlign: TextAlign.center,
                    //     overflow: TextOverflow.ellipsis,
                    //     style: TextStyle(fontWeight: FontWeight.bold),
                    //   ),
                    // ),
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
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have account ? ',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 18,
                              color: Colors.black87.withAlpha(180),
                            )),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/signup");
                          },
                          child: Text('Sign Up',
                              style: TextStyle(
                                fontFamily: 'Raleway',
                                fontSize: 18,
                                color: Colors.purple,
                              )),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text('Or Continue With ...',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 15,
                          color: Colors.black87.withAlpha(180),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Image.asset(
                            'assets/social_media/facebook.png',
                            width: 40,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Image.asset(
                            'assets/social_media/twitter.png',
                            width: 40,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Image.asset(
                            'assets/social_media/google.png',
                            width: 40,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
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
