// To parse this JSON data, do
//
//     final equipment = equipmentFromJson(jsonString);

import 'dart:convert';

List<Equipment> equipmentFromJson(String str) => List<Equipment>.from(json.decode(str).map((x) => Equipment.fromJson(x)));

String equipmentToJson(List<Equipment> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Equipment {
    String model;
    int pk;
    Fields fields;

    Equipment({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Equipment.fromJson(Map<String, dynamic> json) => Equipment(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String name;
    String itemType;
    int amount;
    int power;
    int price;
    String uniqueSkill;
    String description;

    Fields({
        required this.user,
        required this.name,
        required this.itemType,
        required this.amount,
        required this.power,
        required this.price,
        required this.uniqueSkill,
        required this.description,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        itemType: json["item_type"],
        amount: json["amount"],
        power: json["power"],
        price: json["price"],
        uniqueSkill: json["unique_skill"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "item_type": itemType,
        "amount": amount,
        "power": power,
        "price": price,
        "unique_skill": uniqueSkill,
        "description": description,
    };
}
