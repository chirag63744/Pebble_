import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pebble_life/Profile/Profile_doctor.dart';
import 'package:pebble_life/Profile/Profile_patient.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'dart:async';

class profile_sub extends StatefulWidget {
  const profile_sub({Key? key}) : super(key: key);

  @override
  State<profile_sub> createState() => _profile_subState();
}

class _profile_subState extends State<profile_sub> {

  @override
  Widget build(BuildContext context) {
    int? toggle;
    bool _toggle = true;
    String image='assets/images/doctor.png';
    var size,height,width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
        body: SingleChildScrollView(
        child:Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Container(

          margin: EdgeInsets.fromLTRB(26, 50, 26, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Positioned(
                left: 0,
                top: 0,
                child:
                Text(
                  'Profile',
                  style:  GoogleFonts.poppins (
                    fontSize:  36,
                    fontWeight:  FontWeight.w700,
                    color:  Color(0xff74369a),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 50,
                child:
                Text(
                  'Let’s get started and complete your profile',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.poppins(
                    fontSize:  18,
                    fontWeight:  FontWeight.w400,
                    color:  Color(0xff724db9),
                  ),
                ),
              ),
              Center(
                child:
                Container(
                  height: height*0.08,
                  margin:  EdgeInsets.fromLTRB(0, 20, 0, 0),
                  constraints:  BoxConstraints (
                    maxWidth:  300,
                  ),
                  child:
                  Text(
                    'Are you ...',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize:  32,
                      fontWeight:  FontWeight.w600,
                      color:  Color(0xff724db9),
                    ),
                  ),
                ),
              ),

              Container(
                alignment: Alignment.center,
                width:  width*0.6,
                height:  height*0.34,
                margin: EdgeInsets.fromLTRB( 50,0, 0, 0),
                child: _toggle
                    ? Image.asset('assets/images/doctor.png')
                    : Image.asset('assets/images/patient.png'),
              ),
              Container(
                height: height*0.1,
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(10, 40, 0, 10),
                child: ToggleSwitch(
                  minWidth: width*0.4,
                  minHeight: height*0.05,
                  initialLabelIndex: 0,
                  cornerRadius: 50.0,
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.white,
                  borderColor: [Color(0xff74369a)],
                  inactiveFgColor: Color(0xff74369a),
                  totalSwitches: 2,
                  labels: ['Doctor', 'Patient'],
                  fontSize: 25,
                  activeBgColor: [Color(0xff74369a)],
                  onToggle: (index) {
                    toggle=index;


                    print('switched to: $toggle');
                  },
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.all(20),
                margin:  EdgeInsets.fromLTRB(56.5, 20, 58.5, 0),
                child:
                Center(
                    child:
                    SizedBox(
                      width: 225,
                      height: height*0.05,
                      child:
                      ElevatedButton(
                        onPressed: () {
                          if(toggle==0)
                            {//image='assets/images/doctor.png';
                              Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const profile_doc()),
                            );}
                          else if(toggle==1)
                            {
                              //image='assets/images/patient.png';
                              {Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const profile_patient()),
                              );}

                            }


                        },
                        child: Text('Next'),
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          backgroundColor: Color(0xff74369a),
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontStyle: FontStyle.normal),
                        ),
                      ),
                    )
                ),
              ),
            ],

          ),
        )





      ),
    ));
  }
}
