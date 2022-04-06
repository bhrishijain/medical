import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/select_profile_services.dart';

class SelectProfilePatient extends StatefulWidget {
  const SelectProfilePatient({Key? key}) : super(key: key);

  @override
  _SelectProfilePatientState createState() => _SelectProfilePatientState();
}

class _SelectProfilePatientState extends State<SelectProfilePatient> {

  bool isLoading = true;
  final _cont =  SelectProfile();

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
            image: AssetImage('assets/select_profile/Main-bg.png')
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 22, 12.0, 8),
              child: Text('Good Morning, Kate',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                    letterSpacing: 1.5
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(left: 12, right: 40),
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
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 3/2.5,
                    mainAxisSpacing: 10.0
                ),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),

                  itemBuilder: (BuildContext context, index){
                    return Container(

                      //padding: EdgeInsets.symmetric(horizontal: 20,),
                     // margin: EdgeInsets.only(left: 20, right: 20),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                        borderRadius: BorderRadiusDirectional.circular(8.0)
                      ),
                    );

                  },  ),
            )

          ],
        ),
      ),
    );
  }
}
