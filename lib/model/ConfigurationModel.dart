class ConfigurationModel {
  String? title;
  String? subtitle;

  ConfigurationModel({
    this.title,
    this.subtitle,
  });

  ConfigurationModel.fromJson(
    Map<String, dynamic> json,
  ) {
    title = json['title'];
    subtitle = json['subtitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['subtitle'] = subtitle;

    return data;
  }
}
