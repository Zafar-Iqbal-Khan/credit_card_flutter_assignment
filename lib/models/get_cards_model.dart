// To parse this JSON data, do
//
//     final getCards = getCardsFromJson(jsonString);

import 'dart:convert';

GetCards getCardsFromJson(String str) => GetCards.fromJson(json.decode(str));

String getCardsToJson(GetCards data) => json.encode(data.toJson());

class GetCards {
  GetCards({
    this.results,
    this.page,
    this.limit,
    this.totalPages,
    this.totalResults,
  });

  List<Result>? results;
  int? page;
  int? limit;
  int? totalPages;
  int? totalResults;

  factory GetCards.fromJson(Map<String, dynamic> json) => GetCards(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        page: json["page"],
        limit: json["limit"],
        totalPages: json["totalPages"],
        totalResults: json["totalResults"],
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
        "page": page,
        "limit": limit,
        "totalPages": totalPages,
        "totalResults": totalResults,
      };
}

class Result {
  Result({
    this.category,
    this.name,
    this.cardExpiration,
    this.cardHolder,
    this.cardNumber,
    this.id,
  });

  Category? category;
  String? name;
  String? cardExpiration;
  String? cardHolder;
  String? cardNumber;
  String? id;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        category: categoryValues.map[json["category"]],
        name: json["name"],
        cardExpiration: json["cardExpiration"],
        cardHolder: json["cardHolder"],
        cardNumber: json["cardNumber"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "category": categoryValues.reverse[category],
        "name": name,
        "cardExpiration": cardExpiration,
        "cardHolder": cardHolder,
        "cardNumber": cardNumber,
        "id": id,
      };
}

enum Category { VISA }

final categoryValues = EnumValues({"VISA": Category.VISA});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
