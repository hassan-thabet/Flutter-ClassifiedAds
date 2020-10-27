import 'package:flutter/material.dart';


class SliderModel{

  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath,this.title,this.desc});

  void setImageAssetPath(String getImageAssetPath){
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle){
    title = getTitle;
  }

  void setDesc(String getDesc){
    desc = getDesc;
  }

  String getImageAssetPath(){
    return imageAssetPath;
  }

  String getTitle(){
    return title;
  }

  String getDesc(){
    return desc;
  }

}


List<SliderModel> getSlides(){

  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc("Discover Restaurants offering the best fast food food near you on Foodwa");
  sliderModel.setTitle("Search");
  sliderModel.setImageAssetPath("assets/onboarding_icons/001-advertising.svg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc("Our veggie plan is filled with delicious seasonal vegetables, whole grains, beautiful cheeses and vegetarian proteins");
  sliderModel.setTitle("Order");
  sliderModel.setImageAssetPath("assets/onboarding_icons/007-customer.svg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc("Food delivery or pickup from local restaurants, Explore restaurants that deliver near you.");
  sliderModel.setTitle("Eat");
  sliderModel.setImageAssetPath("assets/onboarding_icons/011-free.svg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}