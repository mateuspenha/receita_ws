class TQSA {
  String qual;
  String nome;

  TQSA({this.qual, this.nome});

  TQSA.fromJson(Map<String, dynamic> json) {
    qual = json['qual'];
    nome = json['nome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['qual'] = this.qual;
    data['nome'] = this.nome;

    return data;
  }
}