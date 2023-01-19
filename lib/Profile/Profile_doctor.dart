import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pebble_life/MainScreens/Dashboard.dart';
import 'package:pebble_life/Profile/Profile_patient.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'dart:async';

class profile_doc extends StatefulWidget {
  const profile_doc({Key? key}) : super(key: key);

  @override
  State<profile_doc> createState() => _profile_docState();
}

class _profile_docState extends State<profile_doc> {

  TextEditingController ControllDoctorid = TextEditingController();
  TextEditingController Designation = TextEditingController();
  TextEditingController Location = TextEditingController();
  TextEditingController Specialization = TextEditingController();
  TextEditingController Achievements = TextEditingController();
  TextEditingController Education = TextEditingController();
  TextEditingController YearOfExperience = TextEditingController();
  final CollectionReference Doctor_details=FirebaseFirestore.instance.collection('Doctor_details');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child:Container(
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
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(bottom: 20, top: 50),
                  child: TextField(
                    controller: ControllDoctorid,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xfff8edff),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2,
                            color: Color(0xff74369a),),
                          borderRadius: BorderRadius.all(Radius.circular(10),)
                      ),
                      labelText: 'Doctor ID*',
                      labelStyle: TextStyle(
                        color: Color(0xff74369a),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextField(
                    controller: Designation,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xfff8edff),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2,
                            color: Color(0xff74369a),),
                          borderRadius: BorderRadius.all(Radius.circular(10),)
                      ),
                      labelText: 'Designation*',
                      labelStyle: TextStyle(
                        color: Color(0xff74369a),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextField(
                    controller: Location,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xfff8edff),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2,
                            color: Color(0xff74369a),),
                          borderRadius: BorderRadius.all(Radius.circular(10),)
                      ),
                      labelText: 'Location*',
                      labelStyle: TextStyle(
                        color: Color(0xff74369a),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextField(
                    controller: Specialization,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xfff8edff),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2,
                            color: Color(0xff74369a),),
                          borderRadius: BorderRadius.all(Radius.circular(10),)
                      ),
                      labelText: 'Specialization*',
                      labelStyle: TextStyle(
                        color: Color(0xff74369a),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextField(
                    controller: Achievements,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xfff8edff),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2,
                            color: Color(0xff74369a),),
                          borderRadius: BorderRadius.all(Radius.circular(10),)
                      ),
                      labelText: 'Achievements*',
                      labelStyle: TextStyle(
                        color: Color(0xff74369a),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextField(
                    controller: Education,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xfff8edff),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2,
                            color: Color(0xff74369a),),
                          borderRadius: BorderRadius.all(Radius.circular(10),)
                      ),
                      labelText: 'Education*',
                      labelStyle: TextStyle(
                        color: Color(0xff74369a),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextField(
                    controller: YearOfExperience,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xfff8edff),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2,
                            color: Color(0xff74369a),),
                          borderRadius: BorderRadius.all(Radius.circular(10),)
                      ),
                      labelText: 'Years Of Experience',
                      labelStyle: TextStyle(
                        color: Color(0xff74369a),
                      ),
                    ),
                  ),
                ),

                Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.all(20),
                  margin:  EdgeInsets.fromLTRB(56.5, 50, 58.5, 0),
                  child:
                  Center(
                      child:
                      SizedBox(
                        width: 225,
                        height: 60,
                        child:
                        ElevatedButton(
                          onPressed: () async {

                              await Doctor_details.add({"Doctor_ID": ControllDoctorid.text.toString(), "Designation": Designation.text.toString(),"Location":Location.text.toString(),"Specialization":Specialization.text.toString(),"Achievements":Achievements.text.toString(),"Education":Education.text.toString(),"Year_of_Experience":YearOfExperience.text.toString()});
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const dashboard()),
                              );
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
