import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pebble_life/MainScreens/Dashboard.dart';
import 'package:pebble_life/get_started.dart';
import 'Profile/Profile_page1.dart';
import 'Registeration.dart';
import 'package:google_sign_in/google_sign_in.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);


  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  googleLogin() async {
    print("googleLogin method Called");
    GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      var reslut = await _googleSignIn.signIn();
      if (reslut == null) {
        return;
      }

      final userData = await reslut.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: userData.accessToken, idToken: userData.idToken);
      var finalResult =
      await FirebaseAuth.instance.signInWithCredential(credential);
      print("Result $reslut");
      print(reslut.displayName);
      print(reslut.email);
      print(reslut.photoUrl);


    } catch (error) {
      print(error);
    }
  }

  Future<void> logout() async {
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
  }



  @override
  Widget build(BuildContext context) {
    var size,height,width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
        body:SingleChildScrollView(
      child:Container(
          height: height,
            width: width,

            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width:  width*0.5,
                  height:  height*0.25,
                  margin: EdgeInsets.fromLTRB(0,40,0,0),
                  child:
                  Image.asset('assets/images/login.png',
                    fit: BoxFit.fitHeight,




                  )
                  ,
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                ),
                Container(
                  margin:  EdgeInsets.fromLTRB(0, 0, 2, 0),
                  child:
                  Text(
                    'Login Now.',
                    style:  GoogleFonts.poppins (
                      fontSize:  36,
                      fontWeight:  FontWeight.w700,
                      height:  height*0.002,
                      color:  Color(0xff74369a),
                    ),
                  ),
                ),
                Container(
                  margin:  EdgeInsets.fromLTRB(0, 0, 0, 0),
                  constraints:  BoxConstraints (
                    maxWidth:  400,
                  ),
                  child:
                  Text(
                    'Please enter the details below to continue',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize:  18,
                      fontWeight:  FontWeight.w400,
                      color:  Color(0xff724db9),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  height: height*0.08,
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xfff8edff),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2,
                            color: Color(0xff74369a),),
                          borderRadius: BorderRadius.all(Radius.circular(10),)
                      ),
                      labelText: 'Enter your email',
                      labelStyle: TextStyle(
                        color: Color(0xff74369a),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  height: height*0.08,
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xfff8edff),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2,
                            color: Color(0xff74369a),),
                          borderRadius: BorderRadius.all(Radius.circular(10),)
                      ),
                      labelText: 'Enter your Password',
                      labelStyle: TextStyle(
                        color: Color(0xff74369a),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  child: Text(
                    'Forgot Password?',
                    textAlign:  TextAlign.right,
                    style: GoogleFonts.poppins(
                      fontSize:  18,
                      fontWeight:  FontWeight.w500,
                      color:  Color(0xffe94560),
                    ),
                  ),
                ),
                Container(
                  margin:  EdgeInsets.fromLTRB(56.5, 0, 58.5, 0),
                  child:
                  Center(
                      child:
                      SizedBox(
                        width: width*0.6,
                        height: height*0.06,
                        child:
                        ElevatedButton(
                          onPressed: () {

                            FirebaseAuth.instance.signInWithEmailAndPassword(email: nameController.text, password: passwordController.text)
                                .then((value){
                              print("logined succesffuly");
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const dashboard()),);   });
                            if (nameController.text.isEmpty || nameController.text ==String.fromCharCode(32)) {
                              Fluttertoast.showToast(
                                msg: 'Email id not entered',
                                backgroundColor: Colors.grey,
                              );
                            }
                            bool emailVerify=RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(nameController.text);
                            if (emailVerify==false) {
                              Fluttertoast.showToast(
                                msg: 'Invalid email',
                                backgroundColor: Colors.grey,
                              );
                            }
                            else if (passwordController.text.isEmpty || nameController.text ==String.fromCharCode(32)) {
                              Fluttertoast.showToast(
                                msg: 'Password field cannot be empty',
                                backgroundColor: Colors.grey,
                              );
                            }





                          },
                          child: Text('Login'),
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
                Container(
                  padding: const EdgeInsets.only(top: 15),
                  margin:  EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child:
                  Row(
                    crossAxisAlignment:  CrossAxisAlignment.center,
                    children:  [
                      Flexible(child:
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width:  width*0.4,
                            height:  height*0.002,
                            decoration:  BoxDecoration (
                              color:  Color(0x7f461667),
                            ),
                          ),
                          SizedBox(
                            width:  width*0.04,
                          ),
                          Text(
                            'OR',
                            style:  GoogleFonts.poppins (
                              fontSize:  17,
                              fontWeight:  FontWeight.w400,
                              height:  height*0.0005,
                              color:  Color(0xff461667),
                            ),
                          ),
                          SizedBox(
                            width:  25,
                          ),
                          Container(
                            width:  150,
                            height:  1,
                            decoration:  BoxDecoration (
                              color:  Color(0x7f461667),
                            ),
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  margin:  EdgeInsets.fromLTRB(56.5, 0, 58.5, 0),
                  child:
                  Center(
                      child:
                      SizedBox(
                        width: 225,
                        height: height*0.06,
                        child:
                        ElevatedButton.icon(
                          onPressed: () {



                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Home()),
                            );
                          },
                          icon: Image.asset('assets/images/icon_button.png'),
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            backgroundColor: Color(0xff74369a),
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontStyle: FontStyle.normal),
                          ),label: Text(''),
                        ),
                      )
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Don’t have an account!'),
                    TextButton(
                      child: const Text(
                        'Register',
                        style: TextStyle(fontSize: 20,
                          color:  Color(0xffe94560), ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Register()),
                        );
                      },
                    )
                  ],
                ),
              ],

            ),
          ),
        ));
  }
  siginGoogle()
  async {
    GoogleSignInAccount? googleuser=await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth= await googleuser?.authentication;
    AuthCredential credential=GoogleAuthProvider.credential(
      accessToken:googleAuth?.accessToken,
      idToken:googleAuth?.idToken
    );
    UserCredential user=await FirebaseAuth.instance.signInWithCredential(credential);

  }

  }
