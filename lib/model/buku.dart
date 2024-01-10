// To parse this JSON data, do
//
//     final listBuku = listBukuFromJson(jsonString);

import 'dart:convert';

ListBuku listBukuFromJson(String str) => ListBuku.fromJson(json.decode(str));

String listBukuToJson(ListBuku data) => json.encode(data.toJson());

class ListBuku {
    List<DataBuku> data;

    ListBuku({
        required this.data,
    });

    factory ListBuku.fromJson(Map<String, dynamic> json) => ListBuku(
        data: List<DataBuku>.from(json["data"].map((x) => DataBuku.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class DataBuku {
    int id;
    String title;
    String subtitle;
    DateTime releaseDate;
    int volume;
    String author;
    String publisher;
    String category;
    int totalPages;
    double rating;

    DataBuku({
        required this.id,
        required this.title,
        required this.subtitle,
        required this.releaseDate,
        required this.volume,
        required this.author,
        required this.publisher,
        required this.category,
        required this.totalPages,
        required this.rating,
    });

    factory DataBuku.fromJson(Map<String, dynamic> json) => DataBuku(
        id: json["id"],
        title: json["title"],
        subtitle: json["subtitle"],
        releaseDate: DateTime.parse(json["release_date"]),
        volume: json["volume"],
        author: json["author"],
        publisher: json["publisher"],
        category: json["category"],
        totalPages: json["total_pages"],
        rating: json["rating"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "volume": volume,
        "author": author,
        "publisher": publisher,
        "category": category,
        "total_pages": totalPages,
        "rating": rating,
    };
}
