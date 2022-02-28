// To parserequired this JSON data, do
//
//     final allBeer = allBeerFromJson(jsonString);

import 'dart:convert';

List<AllBeer> allBeerFromJson(jsonData) {
  // final data = json.decode(jsonData);
  return List<AllBeer>.from(
      jsonData.map((item) => AllBeer.fromJson(item)));
}

String allBeerToJson(AllBeer data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
class AllBeer {
    AllBeer({
       required this.id,
       required this.name,
       required this.tagline,
       required this.firstBrewed,
       required this.description,
       required this.imageUrl,
       required this.abv,
       required this.ibu,
       required this.targetFg,
       required this.targetOg,
       required this.ebc,
       required this.srm,
       required this.ph,
       required this.attenuationLevel,
       required this.volume,
       required this.boilVolume,
       required this.method,
       required this.ingredients,
       required this.foodPairing,
       required this.brewersTips,
       required this.contributedBy,
    });

    int? id;
    String? name;
    String? tagline;
    String? firstBrewed;
    String? description;
    String? imageUrl;
    double? abv;
    double? ibu;
    int? targetFg;
    double? targetOg;
    int? ebc;
    double? srm;
    double? ph;
    double? attenuationLevel;
    BoilVolume? volume;
    BoilVolume? boilVolume;
    Method? method;
    Ingredients? ingredients;
    List<String>? foodPairing;
    String? brewersTips;
    ContributedBy? contributedBy;

    factory AllBeer.fromJson(Map<String, dynamic> json) => AllBeer(
        id: json["id"],
        name: json["name"],
        tagline: json["tagline"],
        firstBrewed: json["first_brewed"],
        description: json["description"],
        imageUrl: json["image_url"],
        abv: json["abv"].toDouble(),
        ibu: json["ibu"] == null ? null : json["ibu"].toDouble(),
        targetFg: json["target_fg"],
        targetOg: json["target_og"].toDouble(),
        ebc: json["ebc"] == null ? null : json["ebc"],
        srm: json["srm"] == null ? null : json["srm"].toDouble(),
        ph: json["ph"] == null ? null : json["ph"].toDouble(),
        attenuationLevel: json["attenuation_level"].toDouble(),
        volume: BoilVolume.fromJson(json["volume"]),
        boilVolume: BoilVolume.fromJson(json["boil_volume"]),
        method: Method.fromJson(json["method"]),
        ingredients: Ingredients.fromJson(json["ingredients"]),
        foodPairing: List<String>.from(json["food_pairing"].map((x) => x)),
        brewersTips: json["brewers_tips"],
        contributedBy: contributedByValues.map[json["contributed_by"]],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "tagline": tagline,
        "first_brewed": firstBrewed,
        "description": description,
        "image_url": imageUrl,
        "abv": abv,
        "ibu": ibu == null ? null : ibu,
        "target_fg": targetFg,
        "target_og": targetOg,
        "ebc": ebc == null ? null : ebc,
        "srm": srm == null ? null : srm,
        "ph": ph == null ? null : ph,
        "attenuation_level": attenuationLevel,
        "volume": volume!.toJson(),
        "boil_volume": boilVolume!.toJson(),
        "method": method!.toJson(),
        "ingredients": ingredients!.toJson(),
        "food_pairing": List<dynamic>.from(foodPairing!.map((x) => x)),
        "brewers_tips": brewersTips,
        "contributed_by": contributedByValues.reverse[contributedBy],
    };
}

class BoilVolume {
    BoilVolume({
       required this.value,
       required this.unit,
    });

    double? value;
    Unit? unit;

    factory BoilVolume.fromJson(Map<String, dynamic> json) => BoilVolume(
        value: json["value"].toDouble(),
        unit: unitValues.map[json["unit"]],
    );

    Map<String, dynamic> toJson() => {
        "value": value,
        "unit": unitValues.reverse[unit],
    };
}

enum Unit { LITRES, GRAMS, KILOGRAMS, CELSIUS }

final unitValues = EnumValues({
    "celsius": Unit.CELSIUS,
    "grams": Unit.GRAMS,
    "kilograms": Unit.KILOGRAMS,
    "litres": Unit.LITRES
});

enum ContributedBy { SAM_MASON_SAMJBMASON, ALI_SKINNER_ALI_SKINNER }

final contributedByValues = EnumValues({
    "Ali Skinner <AliSkinner>": ContributedBy.ALI_SKINNER_ALI_SKINNER,
    "Sam Mason <samjbmason>": ContributedBy.SAM_MASON_SAMJBMASON
});

class Ingredients {
    Ingredients({
       required this.malt,
       required this.hops,
       required this.yeast,
    });

    List<Malt>? malt;
    List<Hop>? hops;
    String? yeast;

    factory Ingredients.fromJson(Map<String, dynamic> json) => Ingredients(
        malt: List<Malt>.from(json["malt"].map((x) => Malt.fromJson(x))),
        hops: List<Hop>.from(json["hops"].map((x) => Hop.fromJson(x))),
        yeast: json["yeast"],
    );

    Map<String, dynamic> toJson() => {
        "malt": List<dynamic>.from(malt!.map((x) => x.toJson())),
        "hops": List<dynamic>.from(hops!.map((x) => x.toJson())),
        "yeast": yeast,
    };
}

class Hop {
    Hop({
       required this.name,
       required this.amount,
       required this.add,
       required this.attribute,
    });

    String? name;
    BoilVolume? amount;
    Add? add;
    Attribute? attribute;

    factory Hop.fromJson(Map<String, dynamic> json) => Hop(
        name: json["name"],
        amount: BoilVolume.fromJson(json["amount"]),
        add: addValues.map[json["add"]],
        attribute: attributeValues.map[json["attribute"]],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "amount": amount!.toJson(),
        "add": addValues.reverse[add],
        "attribute": attributeValues.reverse[attribute],
    };
}

enum Add { START, MIDDLE, END, DRY_HOP }

final addValues = EnumValues({
    "dry hop": Add.DRY_HOP,
    "end": Add.END,
    "middle": Add.MIDDLE,
    "start": Add.START
});

enum Attribute { BITTER, FLAVOUR, AROMA, ATTRIBUTE_FLAVOUR }

final attributeValues = EnumValues({
    "aroma": Attribute.AROMA,
    "Flavour": Attribute.ATTRIBUTE_FLAVOUR,
    "bitter": Attribute.BITTER,
    "flavour": Attribute.FLAVOUR
});

class Malt {
    Malt({
       required this.name,
       required this.amount,
    });

    String? name;
    BoilVolume? amount;

    factory Malt.fromJson(Map<String, dynamic> json) => Malt(
        name: json["name"],
        amount: BoilVolume.fromJson(json["amount"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "amount": amount!.toJson(),
    };
}

class Method {
    Method({
       required this.mashTemp,
       required this.fermentation,
       required this.twist,
    });

    List<MashTemp>? mashTemp;
    Fermentation? fermentation;
    String? twist;

    factory Method.fromJson(Map<String, dynamic> json) => Method(
        mashTemp: List<MashTemp>.from(json["mash_temp"].map((x) => MashTemp.fromJson(x))),
        fermentation: Fermentation.fromJson(json["fermentation"]),
        twist: json["twist"] == null ? null : json["twist"],
    );

    Map<String, dynamic> toJson() => {
        "mash_temp": List<dynamic>.from(mashTemp!.map((x) => x.toJson())),
        "fermentation": fermentation!.toJson(),
        "twist": twist == null ? null : twist,
    };
}

class Fermentation {
    Fermentation({
       required this.temp,
    });

    BoilVolume? temp;

    factory Fermentation.fromJson(Map<String, dynamic> json) => Fermentation(
        temp: BoilVolume.fromJson(json["temp"]),
    );

    Map<String, dynamic> toJson() => {
        "temp": temp!.toJson(),
    };
}

class MashTemp {
    MashTemp({
       required this.temp,
       required this.duration,
    });

    BoilVolume? temp;
    int? duration;

    factory MashTemp.fromJson(Map<String, dynamic> json) => MashTemp(
        temp: BoilVolume.fromJson(json["temp"]),
        duration: json["duration"] == null ? null : json["duration"],
    );

    Map<String, dynamic> toJson() => {
        "temp": temp!.toJson(),
        "duration": duration == null ? null : duration,
    };
}

class EnumValues<T> {
    late Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
