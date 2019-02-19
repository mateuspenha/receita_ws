class TAtividadesSecundarias {
  String text;
  String code;

  TAtividadesSecundarias({this.text, this.code});

  TAtividadesSecundarias.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['text'] = this.text;
    data['code'] = this.code;

    return data;
  }
}