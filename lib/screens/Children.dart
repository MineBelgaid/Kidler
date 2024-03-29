// ignore_for_file: prefer_const_constructors,prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hackit3/screens/AddChild.dart';
import 'package:hackit3/screens/ChildStatus.dart';

class Children extends StatelessWidget {
  Children({Key? key}) : super(key: key);
  List<Map> children = [
    {
      "name": "Amine",
      "nbrNotif": 2,
      "distance": 700,
      "image": "assets/avatar.png",
    },
    {
      "name": "Boubek",
      "nbrNotif": 2,
      "distance": 200,
      "image": "assets/avatar.png",
    },
    {
      "name": "Cedric",
      "nbrNotif": 0,
      "distance": 340,
      "image": "assets/avatar.png",
    },
    {
      "name": "Dorian",
      "nbrNotif": 2,
      "distance": 90,
      "image": "assets/avatar.png",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(left: 25, right: 25, top: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "My Children",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(),
              Text(
                  "Auctor curabitur taciti at justo, mauris elemen tum malesuada dictumst duis scelerisque nunc, quis rutrum!",
                  style: TextStyle(fontSize: 15, color: Colors.grey)),
              Expanded(
                child: ListView.builder(
                  itemCount: children.length+1,
                  itemBuilder: (context, index) {
                    if (index == 4) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddChild()));
                        },
                        child: Container(
                          child: Center(child: Text("+",style: TextStyle(
                            fontSize: 50,
                            color: Colors.white
                          ),)),
                          margin: EdgeInsets.only(top: 20),
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            color: Color(0xbb8ABFCB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      );
                    }

                    return Child(
                      child: children[index],
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}

class Child extends StatelessWidget {
  Child({Key? key, required this.child}) : super(key: key);
  Map child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ChildStatus()));
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        padding: EdgeInsets.symmetric(horizontal: 25),
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Color(0xff8ABFCB),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore:
          children: [
            CircleAvatar(
              foregroundImage: AssetImage(child["image"]),
              radius: 25,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  child["name"],
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600),
                ),
                Text(child["distance"].toString() + "m away",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600)),
              ],
            ),
            Expanded(child: SizedBox()),
            child["nbrNotif"] > 0
                ? Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: Center(
                        child: Text(
                      child["nbrNotif"].toString(),
                      style: TextStyle(color: Colors.white),
                    )),
                  )
                : Container(),
            Text("  View State",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600)),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
