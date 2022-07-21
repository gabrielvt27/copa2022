class CountryModel {
  int id;
  String nome;
  String imagename;
  String? bandeira;
  String? sigla;
  String? escudo;
  String? populacao;
  String? lingua;
  String? capital;

  CountryModel({
    required this.id,
    required this.nome,
    required this.imagename,
    this.populacao,
    this.lingua,
    this.capital,
    this.bandeira,
    this.sigla,
    this.escudo,
  });

  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
      id: map['id']?.toInt() ?? 0,
      nome: map['nome'] ?? '',
      imagename: map['imagename'] ?? '',
      populacao: map['populacao'],
      lingua: map['lingua'],
      sigla: map['sigla'],
      capital: map['capital'],
      bandeira: map['bandeira'],
      escudo: map['escudo'],
    );
  }

  @override
  String toString() {
    return 'CountryModel(id: $id, nome: $nome, sigla: $sigla, imagename: $imagename, bandeira: $bandeira, escudo: $escudo, populacao: $populacao, lingua: $lingua, capital: $capital)';
  }
}
