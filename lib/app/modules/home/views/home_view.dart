// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:perpustakaan/model/buku.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: TextField(
            keyboardType: TextInputType.text,
            controller: controller.search,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(
                  255, 206, 205, 205), // Warna latar belakang TextFormField
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              labelStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder(),
              hintText: "Cari buku",
              suffixIcon: Icon(Icons.search), iconColor: Colors.black,
            ),
            onChanged: (value) {
              controller.getSearch();
            },
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 35, top: 30),
              child: FutureBuilder(
                future: controller.readJson(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    final data = snapshot.data;
                    print(data);
                    if (data == null) {
                      return Container(
                        margin: EdgeInsets.only(top: 350),
                        child: Center(
                          child: SpinKitFadingCube(
                            size: 60,
                            itemBuilder: (BuildContext context, int index) {
                              return DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 66, 224, 8),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    } else {
                      return Wrap(
                          runSpacing: 10,
                          spacing: 16,
                          children: data
                              .map((e) => Column(
                                    children: [
                                      Container(
                                        width: 200,
                                        height: 180,
                                        decoration: BoxDecoration(
                                            // boxShadow: [
                                            //   BoxShadow(
                                            //     color: const Color.fromARGB(
                                            //         255, 77, 76, 76),
                                            //     blurRadius: 9,
                                            //     offset: Offset(2, 2),
                                            //   )
                                            // ],
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Color.fromARGB(
                                                255, 206, 205, 205)),
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  25, 20, 0, 0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 2, bottom: 10),
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      e.author,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 2, bottom: 10),
                                                    child: Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        e.category,
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 2, bottom: 10),
                                                    child: Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        e.title,
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ))
                              .toList());
                    }
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ),
        ));
  }
}
