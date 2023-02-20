class FoodModel {
  FoodModel({
    required this.text,
    required this.parsed,
    required this.hints,
    required this.links,
  });

  final String text;
  final List<Parsed> parsed;
  final List<Hint> hints;
  final Links links;

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        text: json["text"] as String? ?? "",
        parsed:
            List<Parsed>.from(json["parsed"].map((x) => Parsed.fromJson(x))),
        hints: List<Hint>.from(json["hints"].map((x) => Hint.fromJson(x))),
        links: Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "parsed": List<dynamic>.from(parsed.map((x) => x.toJson())),
        "hints": List<dynamic>.from(hints.map((x) => x.toJson())),
        "_links": links.toJson(),
      };
}

class Hint {
  Hint({
    required this.food,
    required this.measures,
  });

  final HintFood food;
  final List<Measure> measures;

  factory Hint.fromJson(Map<String, dynamic> json) => Hint(
        food: HintFood.fromJson(json["food"]),
        measures: List<Measure>.from(
            json["measures"].map((x) => Measure.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "food": food.toJson(),
        "measures": List<dynamic>.from(measures.map((x) => x.toJson())),
      };
}

class HintFood {
  HintFood({
    required this.foodId,
    required this.label,
    required this.knownAs,
    required this.nutrients,
    required this.category,
    required this.categoryLabel,
    required this.image,
    required this.brand,
    required this.foodContentsLabel,
    // required this.servingSizes,
    required this.servingsPerContainer,
  });

  final String foodId;
  final String label;
  final String knownAs;
  final Nutrients nutrients;
  final String category;
  final String categoryLabel;
  final String image;
  final String brand;
  final String foodContentsLabel;
  // final List<ServingSize> servingSizes;
  final num servingsPerContainer;

  factory HintFood.fromJson(Map<String, dynamic> json) => HintFood(
        foodId: json["foodId"] as String? ?? "",
        label: json["label"] as String? ?? "",
        knownAs: json["knownAs"] as String? ?? "",
        nutrients: Nutrients.fromJson(json["nutrients"]),
        category: json["category"] as String? ?? "",
        categoryLabel: json["categoryLabel"] as String? ?? "",
        image: json["image"] as String? ?? "",
        brand: json["brand"] as String? ?? "",
        foodContentsLabel: json["foodContentsLabel"] as String? ?? "",
        // servingSizes: List<ServingSize>.from(
        //     json["servingSizes"].map((x) => ServingSize.fromJson(x))),
        servingsPerContainer: json["servingsPerContainer"] as num? ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "foodId": foodId,
        "label": label,
        "knownAs": knownAs,
        "nutrients": nutrients.toJson(),
        "category": category,
        "categoryLabel": categoryLabel,
        "image": image,
        "brand": brand,
        "foodContentsLabel": foodContentsLabel,
        // "servingSizes": List<dynamic>.from(servingSizes.map((x) => x.toJson())),
        "servingsPerContainer": servingsPerContainer,
      };
}


class Nutrients {
  Nutrients({
     this.enercKcal,
     this.procnt,
     this.fat,
     this.chocdf,
     this.fibtg,
  });

  final num? enercKcal;
  final num? procnt;
  final num? fat;
  final num? chocdf;
  final num? fibtg;

  factory Nutrients.fromJson(Map<String, dynamic> json) => Nutrients(
        enercKcal: json["ENERC_KCAL"] as num? ?? 0.0,
        procnt: json["PROCNT"] as num? ?? 0.0,
        fat: json["FAT"] as num? ?? 0.0,
        chocdf: json["CHOCDF"] as num? ?? 0.0,
        fibtg: json["FIBTG"] as num? ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "ENERC_KCAL": enercKcal,
        "PROCNT": procnt,
        "FAT": fat,
        "CHOCDF": chocdf,
        "FIBTG": fibtg,
      };
}

// class ServingSize {
//   ServingSize({
//     required this.uri,
//     required this.label,
//     required this.quantity,
//   });
//
//   final String uri;
//   final String label;
//   final num quantity;
//
//   factory ServingSize.fromJson(Map<String, dynamic> json) => ServingSize(
//         uri: json["uri"] as String? ?? "",
//         label: json["label"] as String? ?? "",
//         quantity: json["quantity"] as num? ?? 0.0,
//       );
//
//   Map<String, dynamic> toJson() => {
//         "uri": uri,
//         "label": label,
//         "quantity": quantity,
//       };
// }

class Measure {
  Measure({
    required this.uri,
    required this.label,
    this.weight,
    // required this.qualified,
  });

  final String uri;
  final String label;
  final num? weight;
  // final List<Qualified> qualified;

  factory Measure.fromJson(Map<String, dynamic> json) => Measure(
        uri: json["uri"] as String? ?? "",
        label: json["label"] as String? ?? "",
        weight: json["weight"] as num? ?? 0.0,
        // qualified: List<Qualified>.from(
        //     json["qualified"].map((x) => Qualified.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "uri": uri,
        "label": label,
        "weight": weight,
        // "qualified": List<dynamic>.from(qualified.map((x) => x.toJson())),
      };
}

// class Qualified {
//   Qualified({
//
//     required this.qualifiers,
//     this.weight,
//   });
//
//   final List<Qualifier> qualifiers;
//   final num? weight;
//
//   factory Qualified.fromJson(Map<String, dynamic> json) => Qualified(
//         qualifiers: List<Qualifier>.from(
//             json["qualifiers"].map((x) => Qualifier.fromJson(x))),
//         weight: json["weight"] as num? ?? 0.0,
//       );
//
//   Map<String, dynamic> toJson() => {
//         "qualifiers": List<dynamic>.from(qualifiers.map((x) => x.toJson())),
//         "weight": weight,
//       };
// }

class Qualifier {
  Qualifier({
    required this.uri,
    required this.label,
  });

  final String uri;
  final String label;

  factory Qualifier.fromJson(Map<String, dynamic> json) => Qualifier(
        uri: json["uri"]  as String? ?? "",
        label: json["label"] as String? ?? "",
      );

  Map<String, dynamic> toJson() => {
        "uri": uri,
        "label": label,
      };
}

class Links {
  Links({
    required this.next,
  });

  final Next next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        next: Next.fromJson(json["next"]),
      );

  Map<String, dynamic> toJson() => {
        "next": next.toJson(),
      };
}

class Next {
  Next({
    required this.title,
    required this.href,
  });

  final String title;
  final String href;

  factory Next.fromJson(Map<String, dynamic> json) => Next(
        title: json["title"] as String? ?? "",
        href: json["href"] as String? ?? "",
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "href": href,
      };
}

class Parsed {
  Parsed({
    required this.food,
  });

  final ParsedFood food;

  factory Parsed.fromJson(Map<String, dynamic> json) => Parsed(
        food: ParsedFood.fromJson(json["food"]),
      );

  Map<String, dynamic> toJson() => {
        "food": food.toJson(),
      };
}

class ParsedFood {
  ParsedFood({
    required this.foodId,
    required this.label,
    required this.knownAs,
    required this.nutrients,
    required this.category,
    required this.categoryLabel,
    required this.image,
  });

  final String foodId;
  final String label;
  final String knownAs;
  final Nutrients nutrients;
  final String category;
  final String categoryLabel;
  final String image;

  factory ParsedFood.fromJson(Map<String, dynamic> json) => ParsedFood(
        foodId: json["foodId"] as String? ?? "",
        label: json["label"] as String? ?? "",
        knownAs: json["knownAs"] as String? ?? "",
        nutrients: Nutrients.fromJson(json["nutrients"]),
        category: json["category"] as String? ?? "",
        categoryLabel: json["categoryLabel"] as String? ?? "",
        image: json["image"] as String? ?? "",
      );

  Map<String, dynamic> toJson() => {
        "foodId": foodId,
        "label": label,
        "knownAs": knownAs,
        "nutrients": nutrients.toJson(),
        "category": category,
        "categoryLabel": categoryLabel,
        "image": image,
      };
}

