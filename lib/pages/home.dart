import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:p1/component/drawer.dart';
import 'package:p1/pages/evs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        drawer: MyDrawer(),
        body: ListView(children: [
          SizedBox(
            height: 25,
            width: double.infinity,
          ),
          Container(
            height: 200.0,
            child: Carousel(
                indicatorBgPadding: 10,
                dotBgColor: Colors.black.withOpacity(0),
                dotIncreasedColor: Colors.blue,
                images: const [
                  Image(
                    image: AssetImage("images/E 350 4MATIC Sedan-black.png"),
                    fit: BoxFit.cover,
                  ),
                  Image(
                    image: AssetImage("images/AMG GLE 63 S Coupe red.png"),
                    fit: BoxFit.cover,
                  ),
                  Image(
                    image: AssetImage("images/AMG SL 43 Roadster blue.png"),
                    fit: BoxFit.cover,
                  ),
                  Image(
                    image:
                        AssetImage("images/AMG GT 63 4-door Coupe white.png"),
                    fit: BoxFit.cover,
                  ),
                  Image(
                    image: AssetImage("images/AMG G 63 SUV.png"),
                    fit: BoxFit.cover,
                  ),
                ]),
          ),
          //! categories
          // category title
          Container(
            width: 500,
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            padding: const EdgeInsets.only(left: 15),
            child: const Text(
              "Category",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 198, 183, 52),
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline),
            ),
          ),
          Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                InkWell(
                  child: Container(
                    height: 200,
                    width: 200,
                    child: ListTile(
                      title: const Image(
                        height: 140,
                        width: 140,
                        image: AssetImage("../images/10.png"),
                        fit: BoxFit.cover,
                      ),
                      subtitle: const Text(
                        "EVS",
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Svs(
                                  category: "evs",
                                )));
                      },
                    ),
                  ),
                  onTap: () {},
                ),
                //category 2
                InkWell(
                  child: Container(
                    height: 200,
                    width: 200,
                    child: ListTile(
                      title: const Image(
                        height: 140,
                        width: 140,
                        image: AssetImage("../images/suv/2.png"),
                        fit: BoxFit.cover,
                      ),
                      subtitle: const Text(
                        "SUV",
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Svs(
                                  category: "suv",
                                )));
                      },
                    ),
                  ),
                  onTap: () {},
                ),
                //category 3
                InkWell(
                  child: Container(
                    height: 200,
                    width: 200,
                    child: ListTile(
                      title: const Image(
                        height: 140,
                        width: 140,
                        image: AssetImage("../images/Mercedes-Maybach.png"),
                        fit: BoxFit.scaleDown,
                      ),
                      subtitle: const Text(
                        "Sedans & Wagons",
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Svs(
                                  category: "Sedans & Wagons",
                                )));
                      },
                    ),
                  ),
                  onTap: () {},
                ),
                //category 4
                InkWell(
                  child: Container(
                    height: 200,
                    width: 200,
                    child: ListTile(
                      title: const Image(
                        height: 140,
                        width: 140,
                        image: AssetImage("../images/Coupes.png"),
                        fit: BoxFit.cover,
                      ),
                      subtitle: const Text(
                        "Coupes",
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Svs(
                                  category: "Coupes",
                                )));
                      },
                    ),
                  ),
                  onTap: () {},
                ),
                //category 5
                InkWell(
                  child: Container(
                    height: 200,
                    width: 200,
                    child: ListTile(
                      title: const Image(
                        height: 140,
                        width: 140,
                        image: AssetImage("../images/4.png"),
                        fit: BoxFit.cover,
                      ),
                      subtitle: const Text(
                        "Convertibles & Roadsters",
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Svs(
                                  category: "Convertibles & Roadsters",
                                )));
                      },
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
          Container(
            width: 500,
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            padding: const EdgeInsets.only(left: 15),
            child: const Text(
              "New Product",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 198, 183, 52),
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline),
            ),
          ),
          Container(
            height: 500,
            width: double.infinity,
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              children: [
                InkWell(
                  child: GridTile(
                    child: Image(
                      image: AssetImage("images/suv/1.png"),
                      fit: BoxFit.contain,
                    ),
                    footer: Container(
                        height: 30,
                        child: const Text(
                          "EQS 450 Sedan",
                          style: TextStyle(fontWeight: FontWeight.w800),
                          textAlign: TextAlign.center,
                        )),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ]));
  }
}
