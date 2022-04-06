import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/apis.dart';
import '../services/select_profile_services.dart';
import 'home.dart';

class SelectYourProfile extends StatefulWidget {
  const SelectYourProfile({Key? key}) : super(key: key);

  @override
  _SelectYourProfileState createState() => _SelectYourProfileState();
}

class _SelectYourProfileState extends State<SelectYourProfile> {
  bool isLoading = true;
  final _cont = SelectProfile();
  int selectedIndex = -1;





  @override
  void initState() {
    _cont.getProfile().whenComplete(() {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context)




{
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/select_profile/Main-bg.png',
          )
        ),
      ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
              child: Text('Kate, Select your profile',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 27,
                  letterSpacing: 1.5
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 8, right: 40),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text('Loream ipsumn is a simpley dummy text of\nthe printing and typesetting',
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 14
                  ),
                ),
              ),
            ),

           Expanded(
             child:isLoading ? Center(child: CircularProgressIndicator(),) :
             ListView.builder(
                 itemCount: _cont.profileList.length,
                 itemBuilder:(BuildContext context, int index){
               return GestureDetector(
                 onTap: (){
                   setState(() {
                     selectedIndex = index;

                     Get.to(Home(),arguments: _cont.profileList[selectedIndex]);
                   });
                 },
                 child: Container(
                   decoration: BoxDecoration(
                     color: Colors.grey,
                     borderRadius:  BorderRadius.circular(12.0),
                     image: DecorationImage(
                       fit: BoxFit.cover,
                       image: AssetImage(index == 0 ? 'assets/select_profile/patient-bg.png' : index == 1 ? 'assets/select_profile/doctor-bg.png' :'assets/select_profile/bg.png')
                     )
                   ),
                   padding:  const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8.0),
                   margin:  const EdgeInsets.symmetric(vertical: 6.0,horizontal: 12.0),

                   child: Row(
                     children: [
                        CircleAvatar(
                         radius: 30.0,
                         backgroundImage: AssetImage(getBackground(_cont.profileList[index].image!)),
                          child: Image.network(IMAGE_URL+_cont.profileList[index].image!,height: 30.0,width: 30.0,),
                       ),

                       Expanded(
                         child: Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 22),
                           child: Text(_cont.profileList[index].profileName!,
                             maxLines: 2 ,
                             overflow:  TextOverflow.ellipsis,
                             style:  GoogleFonts.poppins(
                                 fontSize: 18,
                                 fontWeight: FontWeight.w400,
                                 color: Colors.white
                             ),

                           ),
                         ),
                       ),
                       SizedBox(height: 25.0,width: 25.0,
                       child: selectedIndex  == index ? Image.asset('assets/select_profile/select.png') : Image.asset('assets/select_profile/un-select.png'),
                       )
                     ],
                   ),
                 ),
               );
             }),
           ),
            Center(
              child: Container(
                child:
                Center(
                  child: Text(
                    'Next',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 24
                    ),
                  ),),
                height: 70.0,
                width: MediaQuery.of(context).size.width - 180.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    //color: Colors.blue,
                    image: const DecorationImage(
                        image:  AssetImage(
                            'assets/btn.png'
                        ),
                        fit: BoxFit.cover
                    )
                ),
              ),
            ),

          ],
        ),
    )
    );



  }


  getBackground(imageName){
    switch(imageName) {
      case 'Doctor.png':
      return 'assets/select_profile/doctor-img-bg.png';
      case 'Patient.png':
      return 'assets/select_profile/Patient-img-bg.png';
      case 'Pharmacy.png':
        return 'assets/select_profile/pharmacy-img-bg.png';
      case 'Leboratory.png':
        return 'assets/select_profile/leboratory-img-bg.png';
        case 'Private_Hospital.png':
        return 'assets/select_profile/private-img-bg.png';
        case 'Beauty_Center.png':
        return 'assets/select_profile/beauty-img-bg.png';
        case 'Medical.png':
         return 'assets/select_profile/medical-img-bg.png';

      default: {
        print("Invalid choice");
      }
      break;
    }
  }




}

