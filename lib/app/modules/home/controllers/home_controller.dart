// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../model/buku.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  TextEditingController search = TextEditingController();
  List<DataBuku> buku = [];
  List<DataBuku> filter = [];
  RxInt jumlahFilter = 0.obs;

  Future<List<DataBuku>> readJson() async {
    final String response =
        await rootBundle.loadString('asset/json/book-library.json');
    final data = await json.decode(response);
    final rawData = data["data"];

    List<DataBuku> buku = [];

    for (var rawBook in rawData) {
      final books = DataBuku.fromJson(rawBook);
      buku.add(books);
    }

    return buku;
  }

  getSearch() {
    filter = buku
        .where((element) => element.title.toLowerCase().contains(search.text))
        .toList();
    buku
        .where((element) => element.author.toLowerCase().contains(search.text))
        .toList();
    buku
        .where(
            (element) => element.category.toLowerCase().contains(search.text))
        .toList();
    buku
        .where(
            (element) => element.publisher.toLowerCase().contains(search.text))
        .toList();

    print("ok");
    print(filter.length);
    jumlahFilter.value = filter.length;
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
