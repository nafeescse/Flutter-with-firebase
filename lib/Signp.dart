import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase/signin.dart';
import 'package:url_launcher/url_launcher.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              color: Colors.indigoAccent,
              height: MediaQuery.of(context).size.height*.35,
              child: Center(
                  child: Column(children: [
                    const Padding(
                        padding: EdgeInsets.only(top: 20)),
                    Image.asset(
                      "C:/Users/17rah/Downloads/111.png",
                      width: 60,
                      color: Colors.white,
                    ),

                  ]))),
          Padding(
            padding: EdgeInsets.fromLTRB(25, 85, 25, 0),
            child: Column(
              children: [
                Card(

                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(padding: EdgeInsets.only(bottom: 5)),
                          TextButton(onPressed: () {
                            setState(() {
                              _launchInBrowser('https://www.google.com');

                            });
                          },
                            child: Text('WOW', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.indigoAccent),),),
                          // Text('WOW', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.indigoAccent),),
                          Text('First Party Auth', style: TextStyle(fontSize: 14),),
                          Padding(padding: EdgeInsets.only(bottom: 3)),
                          Form(child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              MakeTextField('Enter User Name', Icon(Icons.account_circle,color: Colors.indigoAccent),Icon(null), r"^[0-9a-zA-Z]{6}"),
                              MakeTextField('Enter Your Email', Icon(Icons.mail,color: Colors.indigoAccent,),Icon(null),r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"),
                              MakePassword('Enter Your Password', Icon(CupertinoIcons.lock_open),r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8}"),
                              MakePassword('Enter Your Password', Icon(CupertinoIcons.lock_open),r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8}"),
                            ],
                          )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Checkbox(value: isChecked, onChanged: (value) {
                                setState(() {
                                  isChecked = !isChecked
                                  ;
                                });
                              },),
                              Text('I read and agree to'),
                              TextButton(onPressed: () {
                                setState(() {
                                  File();


                                });

                              },
                                  child: Text('Terms & Conditions'))
                            ],
                          ),
                          MaterialButton(onPressed: () {
                            // _makePhoneCall("tel: ");
                            setState(() {
                              _makePhoneCall("tel: ");
                              // _launchInBrowser("https://www.cylog.org/headers/");
                            });


                          },
                            color: Colors.indigoAccent,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                            child: Text('CREATE ACCOUNT',style: TextStyle(color: Colors.white),),
                          ),
                          Container(decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20)),color: Colors.indigoAccent,),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Already have an account?'),
                                TextButton(onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Signin(title: ''),));
                                },
                                    child: Text('Sign In', style: TextStyle(color: Colors.white),))
                              ],
                            ),
                          )


                        ],
                      ),
                    ),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget MakeTextField(String hinttext, Icon prefix, Icon suffix, String pattern){
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        autovalidate: true,
        autofocus: true,
        validator: (value) {
          if(RegExp(pattern).hasMatch(value!)){
            return null;
          }
          else{
            return "Error";
          }
        },
        decoration: InputDecoration(
            labelText: hinttext,
            prefixIcon: prefix,
            suffixIcon: suffix,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      ),);
  }

  Widget MakePassword(String hinttext, Icon prefix, String pattern){

    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        obscureText: Invisible,
        autofocus: true,
        autovalidate: true,
        validator: (value) {
          if(RegExp(pattern).hasMatch(value!)){
            return null;
          }
          else{
            return "Error";
          }
        },
        onChanged: (value) {
          setState(() {});
        },
        decoration: InputDecoration(
            labelText: hinttext,
            prefixIcon: prefix,
            suffixIcon:IconButton(
              icon: Invisible
                  ? Icon(Icons.visibility)
                  : Icon(Icons.visibility_off),
              onPressed: () {
                setState(() {
                  Invisible = !Invisible;
                });
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            )),
      ),
    );
  }

  Future<FilePickerResult?> File() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;

      print(file.name);
      print(file.bytes);
      print(file.size);
      print(file.extension);
      print(file.path);
    } else {
      // User canceled the picker
    }
    return result;
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  bool Invisible = false;
  bool isChecked = false;
}
