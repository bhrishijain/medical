import 'package:get/get.dart';

class OnbordingContent {
  String image;
  String title;
  String description;

  OnbordingContent({required this.image, required this.title, required this.description});
}

List<OnbordingContent> contents = [


  OnbordingContent(
      title: 'meet_the_doctor'.tr,
      image: 'assets/imag-1.png',
      description: 'find_book_appointment'.tr
    ,
  ),
  OnbordingContent(
    title: 'online_Pharmacy'.tr,
    image: 'assets/imag-2.png',
    description: 'order_any_medition'.tr,
  ),
  OnbordingContent(
    title: 'online_consultation'.tr,
    image: 'assets/imag-3.png',
    description: 'consult_2000+_dr'.tr,
  ),


];