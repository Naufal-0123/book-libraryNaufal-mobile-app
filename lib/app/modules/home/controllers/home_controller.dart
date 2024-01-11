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
  RxInt jumlahFilter = 0.obs;

  Future<List<DataBuku>> readJson() async {
    final String response =
        await rootBundle.loadString('asset/json/book-library.json');
    final data = await json.decode(response);
    final rawData = data["data"];

    // List<DataBuku> buku = [];

    for (var rawBook in rawData) {
      final books = DataBuku.fromJson(rawBook);
      buku.add(books);
    }

    print("search: ${search.text}");
    if (search.text.isNotEmpty) {
      List<DataBuku> filteredBuku = buku;
      if (search.text.isNotEmpty) {
        filteredBuku = buku
            .where((element) =>
                element.title.toLowerCase().contains(search.text.toLowerCase()))
            .toList();
      }

      return filteredBuku;
    }

    return buku;
  }

  getSearch() {
    print("buku.lengt:${buku.length}");
    // Initial copy of the original buku list
    List<DataBuku> filteredBuku = List.from(buku);

    // Filter by title
    filteredBuku = buku
        .where((element) =>
            element.title.toLowerCase().contains(search.text.toLowerCase()))
        .toList();

    // Filter by author
    // filteredBuku = filteredBuku
    //     .where((element) =>
    //         element.author.toLowerCase().contains(search.text.toLowerCase()))
    //     .toList();

    // // Filter by category
    // filteredBuku = filteredBuku
    //     .where((element) =>
    //         element.category.toLowerCase().contains(search.text.toLowerCase()))
    //     .toList();

    // // Filter by publisher
    // filteredBuku = filteredBuku
    //     .where((element) =>
    //         element.publisher.toLowerCase().contains(search.text.toLowerCase()))
    //     .toList();

    // Update buku list with filtered results
    // buku = filteredBuku;

    // Print and update the count
    print("ok");
    print(filteredBuku.length);
    jumlahFilter.value = filteredBuku.length;
  }

  List<DataBuku> searchBuku(String jsonString) {
    final Map<String, dynamic> data = json.decode(jsonString);
    final List<dynamic> booksData = data['data'];
    return booksData.map((bookData) => DataBuku.fromJson(bookData)).toList();
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
