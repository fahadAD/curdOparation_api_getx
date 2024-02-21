class AllModel {
  String? tittle;
  String? description;
  String? date;
  String? time;
  String? id;

  AllModel({this.tittle, this.description, this.date, this.time, this.id});

  AllModel.fromJson(Map<String, dynamic> json) {
    tittle = json['tittle'];
    description = json['description'];
    date = json['date'];
    time = json['time'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tittle'] = this.tittle;
    data['description'] = this.description;
    data['date'] = this.date;
    data['time'] = this.time;
    data['id'] = this.id;
    return data;
  }
}
