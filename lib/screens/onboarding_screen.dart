import 'dart:io';
import 'package:classified_ads/component/onbloardingData.dart';
import 'package:classified_ads/ui/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<SliderModel> mySLides = new List<SliderModel>();
  int slideIndex = 0;
  PageController controller;

  Widget _buildPageIndicator(bool isCurrentPage){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 12.0 : 6.0,
      width: isCurrentPage ? 12.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? KBackgroundColor : KBackgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mySLides = getSlides();
    controller = new PageController();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [KMainColor, KMainColor])),
      child: Scaffold(
        backgroundColor: KMainColor,
        body: Container(
          height: MediaQuery.of(context).size.height - 100,
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                slideIndex = index;
              });
            },
            children: <Widget>[
              SlideTile(
                imagePath: mySLides[0].getImageAssetPath(),
                title: mySLides[0].getTitle(),
                desc: mySLides[0].getDesc(),
              ),
              SlideTile(
                imagePath: mySLides[1].getImageAssetPath(),
                title: mySLides[1].getTitle(),
                desc: mySLides[1].getDesc(),
              ),
              SlideTile(
                imagePath: mySLides[2].getImageAssetPath(),
                title: mySLides[2].getTitle(),
                desc: mySLides[2].getDesc(),
              )
            ],
          ),
        ),
        bottomSheet: slideIndex != 2 ? Container(
          color: KMainColor,
          padding: EdgeInsets.only(bottom: 16),
          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton(
                onPressed: (){
                  controller.animateToPage(2, duration: Duration(milliseconds: 400), curve: Curves.linear);
                },
                splashColor: Colors.blue[50],
                child: Text(
                  "SKIP",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    for (int i = 0; i < 3 ; i++) i == slideIndex ? _buildPageIndicator(true): _buildPageIndicator(false),
                  ],),
              ),
              FlatButton(
                onPressed: (){
                  controller.animateToPage(slideIndex + 1, duration: Duration(milliseconds: 500), curve: Curves.linear);
                },
                splashColor: Colors.blue[50],
                child: Text(
                  "NEXT",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ): InkWell(
          onTap: (){
            Navigator.pushReplacementNamed(context, '/home');
          },
          child: Container(
            height: Platform.isIOS ? 70 : 60,
            color: Colors.white,
            alignment: Alignment.center,
            child: Text(
              "GET STARTED NOW",
              style: TextStyle(color: KMainColor, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}



class SlideTile extends StatelessWidget {
  String imagePath, title, desc;

  SlideTile({this.imagePath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(imagePath , width: 200,),
          SizedBox(
            height: 40,
          ),
          Text(title, textAlign: TextAlign.center,style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'Raleway',
              fontSize: 30,
            color: Colors.white
          ),),
          SizedBox(
            height: 20,
          ),
          Text(desc, textAlign: TextAlign.center,style: TextStyle(
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w500,
              fontSize: 18 , color: Colors.white))
        ],
      ),
    );
  }
}

