import 'package:flutter/material.dart';
import 'package:p1/component/button.dart';
import 'package:p1/component/drawer.dart';

import 'evs.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: MyButton(),
      appBar: AppBar(
        title: const Text("Categories"),
      ),
      drawer: MyDrawer(),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          //* category 1
          InkWell(
            child: Card(
              child: Column(
                children: [
                  Expanded(
                      child: Image.asset(
                    "images/AMG GT 63 4-door Coupe white.png",
                    fit: BoxFit.cover,
                  )),
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: const Text(
                      "EVs",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Svs(
                        category: "evs",
                      )));
            },
          ),
          //* end category 1
          //? category 2
          InkWell(
            child: Card(
              child: Column(
                children: [
                  Expanded(
                      child: Image.asset(
                    "../images/suv/2.png",
                    fit: BoxFit.cover,
                  )),
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: const Text(
                      "SUV",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Svs(
                        category: "suv",
                      )));
            },
          ),
          //* category 3
          InkWell(
            child: Card(
              child: Column(
                children: [
                  Expanded(
                      child: Image.asset(
                    "../images/Mercedes-Maybach.png",
                    fit: BoxFit.scaleDown,
                  )),
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: const Text(
                      "Sedans & Wagons",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Svs(
                        category: "Sedans & Wagons",
                      )));
            },
          ),
          //* category 4
          InkWell(
            child: Card(
              child: Column(
                children: [
                  Expanded(
                      child: Image.asset(
                    "../images/Coupes.png",
                    fit: BoxFit.cover,
                  )),
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: const Text(
                      "Coupes",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Svs(
                        category: "Coupes",
                      )));
            },
          ),
          //* category 5
          InkWell(
            child: Card(
              child: Column(
                children: [
                  Expanded(
                      child: Image.asset(
                    "../images/4.png",
                    fit: BoxFit.cover,
                  )),
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: const Text(
                      "Convertibles & Roadsters",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Svs(
                        category: "Convertibles & Roadsters",
                      )));
            },
          ),
        ],
      ),
    );
  }
}
