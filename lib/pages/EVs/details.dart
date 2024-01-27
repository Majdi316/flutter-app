// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:p1/component/detailText.dart';
import 'package:p1/component/drawer.dart';

class EvsDetail extends StatefulWidget {
  final String? docid;
  final String? oldName;
  final double? uid;
  const EvsDetail({super.key, this.docid, this.oldName, this.uid});

  @override
  State<EvsDetail> createState() => _EvsDetailState();
}

class _EvsDetailState extends State<EvsDetail> {
  List<QueryDocumentSnapshot> data = [];
  bool isLoading = true;
  getData() async {
    QuerySnapshot querysnapshot = await FirebaseFirestore.instance
        .collection("products")
        .where("uid", isEqualTo: widget.uid!.toDouble())
        .get();
    await Future.delayed(Duration(seconds: 2));
    data.addAll(querysnapshot.docs);
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
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
              itemBuilder: ((context, index) {
                return Center(
                    child: Column(
                  children: [
                    Text(
                      " ${data[index]["Car name"]}",
                      style: TextStyle(fontSize: 25, color: Colors.red),
                    ),
                    Container(
                      height: 15,
                    ),
                    Image(image: NetworkImage("${data[index]["image"]}")),
                    //?   row 1
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: EdgeInsets.only(left: 15),
                            child: detailText(
                              title: "Category:",
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child:
                              detailText(title: "${data[index]["category"]}"),
                        ),
                      ],
                    ),
                    Container(
                      height: 15,
                    ),
                    //row 2
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: EdgeInsets.only(left: 15),
                            child: detailText(
                              title: "Power:",
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: detailText(title: "${data[index]["Power"]}"),
                        ),
                      ],
                    ),
                    Container(
                      height: 15,
                    ),
                    //row 3
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: EdgeInsets.only(left: 15),
                            child: detailText(
                              title: "Torque:",
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: detailText(title: "${data[index]["Torque"]}"),
                        ),
                      ],
                    ),
                    Container(
                      height: 15,
                    ),
                    //row 4
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: EdgeInsets.only(left: 15),
                            child: detailText(
                              title: "Acceleration:",
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: detailText(
                              title: "${data[index]["Acceleration"]}"),
                        ),
                      ],
                    ),
                    Container(
                      height: 15,
                    ),
                    //row 5
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: EdgeInsets.only(left: 15),
                            child: detailText(
                              title: "price:",
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            "${data[index]["price"]}",
                            style: TextStyle(fontSize: 20, color: Colors.green),
                          ),
                        ),
                      ],
                    )
                  ],
                ));
              })),
    );
  }
}
