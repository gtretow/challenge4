// ignore_for_file: unnecessary_getters_setters
class ViaCepAggregateModel {
  List<ViaCEPModel> ceps = [];

  ViaCepAggregateModel(this.ceps);

  ViaCepAggregateModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      ceps = <ViaCEPModel>[];
      json['results'].forEach((v) {
        ceps.add(ViaCEPModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = ceps.map((v) => v.toJson()).toList();
    return data;
  }
}

class ViaCEPModel {
  String? objectId;
  String? createdAt;
  String? updatedAt;
  String? _cep;
  String? _logradouro;
  String? _complemento;
  String? _bairro;
  String? _localidade;

  ViaCEPModel({
    String? objectId,
    String? createdAt,
    String? updatedAt,
    String? cep,
    String? logradouro,
    String? complemento,
    String? bairro,
    String? localidade,
  }) {
    if (cep != null) {
      _cep = cep;
    }
    if (logradouro != null) {
      _logradouro = logradouro;
    }
    if (complemento != null) {
      _complemento = complemento;
    }
    if (bairro != null) {
      _bairro = bairro;
    }
    if (localidade != null) {
      _localidade = localidade;
    }
  }
  ViaCEPModel.create(this._cep, this._logradouro, this._bairro,
      this._complemento, this._localidade);

  String? get cep => _cep;
  set cep(String? cep) => _cep = cep;
  String? get logradouro => _logradouro;
  set logradouro(String? logradouro) => _logradouro = logradouro;
  String? get complemento => _complemento;
  set complemento(String? complemento) => _complemento = complemento;
  String? get bairro => _bairro;
  set bairro(String? bairro) => _bairro = bairro;
  String? get localidade => _localidade;
  set localidade(String? localidade) => _localidade = localidade;

  ViaCEPModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    _cep = json['cep'];
    _logradouro = json['logradouro'];
    _complemento = json['complemento'];
    _bairro = json['bairro'];
    _localidade = json['localidade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['cep'] = _cep;
    data['logradouro'] = _logradouro;
    data['complemento'] = _complemento;
    data['bairro'] = _bairro;
    data['localidade'] = _localidade;
    return data;
  }

  Map<String, dynamic> toJsonEndpoint() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cep'] = _cep;
    data['logradouro'] = _logradouro;
    data['complemento'] = _complemento;
    data['bairro'] = _bairro;
    data['localidade'] = _localidade;
    return data;
  }
}
