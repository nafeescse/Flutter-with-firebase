// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class AllOperation extends StatefulWidget {
//   // const AllOperation({Key? key}) : super(key: key);
//
//   @override
//   _AllOperationState createState() => _AllOperationState();
// }
//
// class _AllOperationState extends State<AllOperation> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController passController = TextEditingController();
//   GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
//   FirebaseFirestore operationFirestore = FirebaseFirestore.instance;
//   bool data = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Card(
//         child: Form(
//             key: _globalKey,
//             child: Column(children: [
//               SizedBox(height: 30),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
//                 child: TextFormField(
//                   controller: nameController,
//                   obscureText: false,
//                   validator: (value) {
//                     if (value!.length > 3) {
//                       return null;
//                     } else {
//                       return "Name lenght must be mone than 3 letters";
//                     }
//                   },
//                   decoration: InputDecoration(
//                       hintText: 'Enter Name',
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10))),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
//                 child: TextFormField(
//                     controller: passController,
//                     obscureText: true,
//                     validator: (value) {
//                       if (value!.length > 3) {
//                         return null;
//                       } else {
//                         return "Password must be mone than 6 letters";
//                       }
//                     },
//                     decoration: InputDecoration(
//                         hintText: 'Enter Age',
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10)))),
//               ),
//               SizedBox(height: 30),
//               Padding(
//                 padding: EdgeInsets.all(10),
//                 child: ElevatedButton(
//                     onPressed: () {
//                       if (_globalKey.currentState!.validate()) {
//                         addData(nameController.text, passController.text);
//                       }
//                     },
//                     child: Text('Create Data')),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(10),
//                 child: ElevatedButton(
//                     onPressed: () {
//                       if (_globalKey.currentState!.validate()) {
//                         getData();
//                       }
//                     },
//                     child: Text('Read single Data')),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(10),
//                 child: ElevatedButton(
//                     onPressed: () {
//                       if (_globalKey.currentState!.validate()) {}
//                     },
//                     child: Text('Read Data')),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(10),
//                 child: ElevatedButton(
//                     onPressed: () {
//                       if (_globalKey.currentState!.validate()) {}
//                       getAllDocument();
//                       setState(() {
//                         data = true;
//                       });
//                     },
//                     child: Text('Read all Data')),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(10),
//                 child: ElevatedButton(
//                     onPressed: () {
//                       if (_globalKey.currentState!.validate()) {
//                         updateData(nameController.text, passController.text);
//                       }
//                     },
//                     child: Text('Update Data')),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(10),
//                 child: ElevatedButton(
//                     onPressed: () {
//                       if (_globalKey.currentState!.validate()) {}
//                     },
//                     child: Text('Delete Data')),
//               ),
//               data
//                   ? Center(
//                       child: FutureBuilder<DocumentSnapshot>(
//                         future: getData(),
//                         builder: (BuildContext context,
//                             AsyncSnapshot<DocumentSnapshot> snapshot) {
//                           if (snapshot.hasError) {
//                             return Text("Somethikng went wrong");
//                           }
//                           if (snapshot.hasData && !snapshot.data!.exists) {
//                             return Text("Document doesn't exist");
//                           }
//                           if (snapshot.connectionState ==
//                               ConnectionState.done) {
//                             Map<String, dynamic> data =
//                                 snapshot.data!.data() as Map<String, dynamic>;
//                             return Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text("Name: ${data['name']}"),
//                                 Text("Password: ${data['password']}"),
//                                 Text("Age: ${data['info']['age']}"),
//                                 Text("Location: ${data['location']}"),
//                               ],
//                             );
//                           }
//                           return CircularProgressIndicator();
//                         },
//                       ),
//                     )
//                   : Container(),
//             ])),
//       ),
//     );
//   }
//
//   addData(String name, String password) async {
//     return await operationFirestore.collection("78").add({
//       "name": name,
//       "password": password,
//       "batch": "77",
//       "location": "Sylhet",
//       "info": {
//         "address": {
//           "word": "25",
//           "house": "112",
//         },
//         "gender": "Male",
//         "age": "25"
//       }
//     });
//   }
//
//   addDataWithDoc(String name, String password) async {
//     return await operationFirestore.collection("78").doc(name).set({
//       "name": name,
//       "password": password,
//       "batch": "77",
//       "location": "Sylhet",
//       "info": {
//         "address": {
//           "word": "25",
//           "house": "112",
//         },
//         "gender": "Male",
//         "age": "25"
//       }
//     });
//   }
//
//   Future<DocumentSnapshot> getData() async {
//     return await operationFirestore
//         .collection("77")
//         .doc("Nafees2")
//         .get()
//         .then((snapshot) => snapshot);
//   }
//
//   getAllDocument() async {
//     await operationFirestore
//         .collection("77")
//         .where("info.gender", isEqualTo: "Male")
//         .snapshots()
//         .listen((value) {
//       value.docs.forEach((snapshotItem) {
//         print(snapshotItem.get("info"));
//       });
//     });
//   }
//
//   updateData(String name, String password) async {
//     return await operationFirestore.collection("77").doc("Nafees1").update({
//       "info": {
//         "address": {
//           "word": "17",
//           "house": "112",
//         },
//         "gender": "Male",
//         "age": "25"
//       }
//     }).then((value) => print("Updated Successfully"));
//   }
// }
//





import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AllOperation extends StatefulWidget {
  const AllOperation({Key? key}) : super(key: key);

  @override
  _AllOperationState createState() => _AllOperationState();
}

class _AllOperationState extends State<AllOperation> {

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _globalKey = GlobalKey<FormState>();
  FirebaseFirestore operationFirestore = FirebaseFirestore.instance;
  bool data = false;
  var myData = "";


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _globalKey,
        child: Card(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: nameController,
                  validator: (value){
                    if(value!.length > 3 ){
                      return null;
                    }else{
                      return "Name length must be more than 3 letters";
                    }
                  },
                  decoration: InputDecoration(
                      hintText: "Enter Your Name",
                      // prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  validator: (value){
                    if(value!.length > 6){
                      return null;
                    }else{
                      return "Password must be more than 6 digits";
                    }
                  },
                  decoration: InputDecoration(
                      hintText: "Enter Your Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: (){
                      if(_globalKey.currentState!.validate()){
                        // addData(nameController.text, passwordController.text);
                        addDataWithDocumentName(nameController.text, passwordController.text);
                      }
                    },
                    child: Text("Create Data")
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: (){
                      if(_globalKey.currentState!.validate()){
                        // getData();
                        // print(getData().toString());

                      }
                      getData();
                      setState(() {
                        data = true;
                      });
                    },
                    child: Text("Read Single Data")
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: (){
                      if(_globalKey.currentState!.validate()){
                        // getData();
                        // print(getData().toString());

                      }
                      // getData();
                      getAllDocument();
                      setState(() {
                        data = true;
                      });
                    },
                    child: Text("Read all Data")
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: (){
                      if(_globalKey.currentState!.validate()){
                        updateData(nameController.text, passwordController.text);
                      }
                    },
                    child: Text("Update Data")
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: (){
                      if(_globalKey.currentState!.validate()){
                        // addData(nameController.text, ageController.text);
                        deleteData();
                      }
                    },
                    child: Text("Delete Data")
                ),
              ),

              data ? Center(
                child: FutureBuilder<DocumentSnapshot>(
                  future: getData(),
                  builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text("Something went wrong");
                    }

                    if (snapshot.hasData && !snapshot.data!.exists) {
                      return Text("Document does not exist");
                    }

                    if (snapshot.connectionState == ConnectionState.done) {
                      Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Name: ${data}"),
                          Text("Password: ${data['password']}"),
                          Text("Batch: ${data['batch']}"),
                          Text("Location: ${data['location']}"),
                        ],
                      );
                      // return Text("Data: ${data['name']} ${data['money']}");
                    }

                    return CircularProgressIndicator();
                  },
                ),
              ) : Container(),

            ],
          ),
        ),
      ),
    );
  }

  addData(String ourName,String password) async {
    return await operationFirestore.collection("75").add(
        {
          "name": ourName,
          "password" : password,
          "batch" : "77",
          "location" : "Sylhet",
          "info" : {
            "address" : {
              "word" : "25",
              "house number": "B12"
            },
            "gender" : "Male",
            "age" : "25",
          }
        }
    );
  }

  addDataWithDocumentName(String name,String pass)async{
    return await operationFirestore.collection("77").doc(name).set(
        {
          "name": name,
          "password" : pass,
          "batch" : "77",
          "location" : "Sylhet",
          "info" : {
            "address" : {
              "word" : "26",
              "house number": "B13"
            },
            "gender" : "Male",
            "age" : "25",
          }
        }
    );
  }

  Future<DocumentSnapshot> getData() async {
    return await operationFirestore
        .collection("77").
    doc("naima").get().then(
            (snapshot){
          // var name = snapshot.get("name");
          // print(snapshot.get("name"));
          return snapshot;

        }
    );
    // .doc("Tomal")
    // .get();
  }

  getAllDocument() async {
    await operationFirestore
        .collection("77").where("info.gender",isEqualTo: "Female").
    snapshots().listen((snapshot) {
      snapshot.docs.forEach(
              (snapshotItem) {
            print(snapshotItem.get("info.age"));
          }) ;
    });
    // .where("money", isGreaterThan: "10000")
    // .get().then((allDocument) {
    //   allDocument.docs.forEach((value) {
    //     try{
    //       myData = value.get("name").toString();
    //     }catch (e){
    //       myData = e.toString();
    //     }
    //     print(myData);
    //   });
    //  });
  }

  updateData(String name, String pass)async{
    return await operationFirestore.collection("78").doc("Nafees2").update(
        {
          "name": name,
          "password" : pass,
          "batch" : "77",
          "location" : "Sylhet",
          "info": {
            "address": {
              "word": "32",
              "house number": "C112"
            },
            "gender": "Female",
            "age": "26",
          }
        }
    ).then((value) {
      Fluttertoast.showToast(msg: "Data Updated Successfully");
    });

  }

  deleteData()async{
    return await operationFirestore.collection("80").doc("Tomal").delete();
  }

}
