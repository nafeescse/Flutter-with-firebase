import 'package:firebase/Signp.dart';
import 'package:firebase/authenticastion.dart';
import 'package:firebase/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:task1/Signup.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController _emailControoler = TextEditingController();
  TextEditingController _passControoler = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool _obscure = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30, bottom: 30),
            ),
            Image.asset(
              "C:/Users/17rah/Downloads/111.png",
              color: Colors.white,
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 20),
            ),
            Text(
              'ECORP',
              style: TextStyle(fontSize: 70, color: Colors.orange),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 20),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.50,
              width: MediaQuery.of(context).size.width * 0.85,
              // width: 320,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: Text('SIGN IN',style: TextStyle(fontSize: 25,color: Colors.indigoAccent),)
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: TextFormField(
                          cursorColor: Colors.black,
                          controller: _emailControoler,
                          autofocus: true,
                          decoration: InputDecoration(
                              hintText: "Enter Your UserName",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          validator: (value) {
                            if (value!.length > 5) {
                              return null;
                            } else {
                              return 'Username must be 5 digits long';
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: TextFormField(
                          obscureText: _obscure,
                          autofocus: true,
                          controller: _passControoler,
                          onChanged: (value) {
                            setState(() {});
                          },
                          decoration: InputDecoration(
                              hintText: 'Enter Your Password',
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: _obscure
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _obscure = !_obscure;
                                  });
                                },
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password ?',
                            style: TextStyle(fontSize: 16),
                          )),
                      // RaisedButton(
                      //   onPressed: () {},
                      //   color: Colors.indigo,
                      //   shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(20)),
                      //   child: Text(
                      //     'LOGIN',
                      //     style: TextStyle(color: Colors.white, fontSize: 16),
                      //   ),
                      // ),
                      Material(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),color: Colors.indigo,
                          child: Row(
                            children: [
                              MaterialButton(onPressed: () {
                                if(formKey.currentState!.validate()){
                                  Authentication.signIN(_emailControoler.text, _passControoler.text ).then((value)

                                      {
                                        if(value == null){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                                        }
                                      });

                                }},
                                  child : Text(
                                    "LOGIN",
                                    style: TextStyle(fontSize: 16, color: Colors.white),
                                  )),
                              MaterialButton(onPressed: () {

                                },
                                  child : Text(
                                    "Signup with Google",
                                    style: TextStyle(fontSize: 16, color: Colors.white),
                                  ))
                            ],
                          )
                      ),
                      // ElevatedButton(
                      //     onPressed: () {
                      //       if(formKey.currentState!.validate()){
                      //         Navigator.pushNamed(context, '/5');                    }
                      //     },
                      //     style: ButtonStyle(
                      //       backgroundColor:
                      //           MaterialStateProperty.all<Color>(Colors.indigo),
                      //       shape: MaterialStateProperty.all<
                      //           RoundedRectangleBorder>(
                      //         RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(20.0),
                      //         ),
                      //       ),
                      //       // shape: RoundedRectangleBorder(
                      //       //     borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
                      //     ),
                      //     child: Text(
                      //       "LOGIN",
                      //       style: TextStyle(fontSize: 18, color: Colors.white),
                      //     )),
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: 60)),
                          Expanded(
                            child:Divider(color: Color(0XFF1C313A), thickness: 1,), ),
                          Padding(padding: EdgeInsets.only(left: 10)),
                          Text('OR'),
                          Padding(padding: EdgeInsets.only(left: 10)),
                          Expanded(
                            child:Divider(color: Color(0XFF1C313A), thickness: 1,), ),
                          Padding(padding: EdgeInsets.only(left: 60)),

                        ],
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()));
                          },
                          child: Text(
                            'SIGNUP',
                            style: TextStyle(fontSize: 16),
                          )),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}

