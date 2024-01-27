import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:p1/component/button.dart';
import 'package:p1/component/drawer.dart';
import 'package:p1/pages/EVs/update.dart';

import 'EVs/details.dart';

class Svs extends StatefulWidget {
  final String? category;
  const Svs({super.key, this.category});

  @override
  State<Svs> createState() => _SvsState();
}

class _SvsState extends State<Svs> {
  List<QueryDocumentSnapshot> data = [];
  bool isLoading = true;
  getData() async {
    QuerySnapshot querysnapshot = await FirebaseFirestore.instance
        .collection("products")
        .where("category", isEqualTo: widget.category)
        .get();
    await Future.delayed(Duration(seconds: 2));
    data.addAll(querysnapshot.docs);
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed("addCar");
            }),
        appBar: AppBar(
          title: const Text("Cars"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("categories");
                },
                icon: Icon(Icons.arrow_forward))
          ],
        ),
        drawer: MyDrawer(),
        body: isLoading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, i) {
                  return InkWell(
                    onLongPress: () {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.warning,
                        headerAnimationLoop: true,
                        animType: AnimType.bottomSlide,
                        title: 'warning',
                        reverseBtnOrder: true,
                        btnCancelText: "delete",
                        btnOkText: "update",
                        btnOkOnPress: () async {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EvsUpdate(
                                    docid: data[i].id,
                                    carNameo: data[i]["Car name"],
                                    priceo: data[i]["price"],
                                    imageo: data[i]["image"],
                                    Powero: data[i]["Power"],
                                    Accelerationo: data[i]["Acceleration"],
                                    Torqueo: data[i]["Torque"],
                                  )));
                        },
                        btnCancelOnPress: () async {
                          await FirebaseFirestore.instance
                              .collection("products")
                              .doc(data[i].id)
                              .delete();
                          Navigator.of(context)
                              .pushReplacementNamed("categories");
                        },
                        desc: "Delete or Update",
                      ).show();
                    },
                    child: Container(
                      height: 150,
                      child: Card(
                          child: Row(
                        children: [
                          // row 1
                          Expanded(
                              flex: 3,
                              // ignore: prefer_const_constructors
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage('${data[i]["image"]}'),
                              )),
                          // row 2
                          Expanded(
                              flex: 2,
                              child: Container(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 15,
                                    ),
                                    Text(" ${data[i]["Car name"]}"),
                                    Container(
                                      height: 45,
                                    ),
                                    Text(
                                      " ${data[i]["price"]}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 92, 243, 97)),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      )),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EvsDetail(
                              docid: data[i].id,
                              oldName: data[i]["Car name"],
                              uid: data[i]["uid"])));
                    },
                  );
                },
              )

        //? list 1

        );
  }
}
