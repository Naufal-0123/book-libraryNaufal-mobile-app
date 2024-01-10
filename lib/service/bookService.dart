import 'package:flutter/services.dart';
import '../model/buku.dart';

class BukuServices {
  getBuku() async {
    final String response =
        await rootBundle.loadString('asset/json/book-library.json');

    ListBuku data = listBukuFromJson(response);

    return data.toJson();
  }
}
