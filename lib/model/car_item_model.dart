
class CarItemModel {
 String? name;
  String? time;
  String? distance;
  String? standard;
  String? url;
  String? price;

  CarItemModel(
      {this.name,
        this.time,
        this.distance,
        this.standard,
        this.url,
        this.price});

  CarItemModel.fromJson(Map<String, dynamic> json,) {
    name = json['name'];
    time = json['time'];
    distance = json['distance'];
    standard = json['standard'];
    url = json['url'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['time'] = time;
    data['distance'] = distance;
    data['standard'] = standard;
    data['url'] = url;
    data['price'] = price;
    return data;
  }
}