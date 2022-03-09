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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['time'] = this.time;
    data['distance'] = this.distance;
    data['standard'] = this.standard;
    data['url'] = this.url;
    data['price'] = this.price;
    return data;
  }
}