class NumModel {
  String? sId;
  String? value;

  NumModel(this.value);

  NumModel.fromJson(Map<String, dynamic> json) {
    sId = json["_id"];
    value = json["value"];
  }

  toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    return data;
  }
}
