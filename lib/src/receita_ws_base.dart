import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart' as xml;
import 'dart:convert';
import 'TAtividadePrincipal.dart';
import 'TAtividadesSecundarias.dart';
import 'TQSA.dart';

class receita_ws {
  String _URLBase = 'https://www.receita_ws.com.br/v1/cnpj/';

  String _Body;

  int _Response;

  String _LastCNPJ;

  String _sensitive;

  // variables
  String _data_situacao, _complemento, _tipo, _nome, _email, _situacao, _bairro, _logradouro, _numero, _cep, _municipio, _porte, _abertura, _natureza_juridica;
  String _uf, _telefone, _ultima_atualizacao, _fantasia, _motivo_situacao, _situacao_especial, _data_situacao_especial, _capital_social;
  String _cnpj, _efr;

  List<TAtividadePrincipal> _atividadePrincipal;
  List<TAtividadesSecundarias> _atividadesSecundarias;
  List<TQSA> _qsa;

  receita_ws() {
    clear();

    _LastCNPJ = null;

    _Body = null;

    _Response = null;
  }

  void clear() {
    _data_situacao = null;
    _complemento = null;
    _tipo = null;
    _nome = null;
    _email = null;
    _situacao = null;
    _bairro = null;
    _logradouro = null;
    _numero = null;
    _cep = null;
    _municipio = null;
    _porte = null;
    _abertura = null;
    _natureza_juridica = null;;
    _uf = null;
    _telefone = null;
    _ultima_atualizacao = null;
    _fantasia = null;
    _motivo_situacao = null;
    _situacao_especial = null;
    _data_situacao_especial = null;
    _capital_social = null;

    _cnpj = null;
    _efr = null;

    _sensitive = null;
  }

  Future searchCNPJ(String CNPJ, sensitive) async {
    _LastCNPJ = CNPJ;

    _sensitive = sensitive.toString().toLowerCase().trim();

    String _URLAccess = _URLBase+CNPJ;

    var response = await http.get(_URLAccess);

    _Response = response.statusCode;
    _Body = response.body;

    if (_Response != 200)
      clear();
    else {
      Map<String, dynamic> CNPJdata = jsonDecode(_Body);

      _data_situacao = CNPJdata['data_situacao'];
      _complemento = CNPJdata['complemento'];
      _tipo = CNPJdata['tipo'];
      _nome = CNPJdata['nome'];
      _email = CNPJdata['email'];
      _situacao = CNPJdata['situacao'];
      _bairro = CNPJdata['bairro'];
      _logradouro = CNPJdata['logradouro'];
      _numero = CNPJdata['numero'];
      _cep = CNPJdata['cep'];
      _municipio = CNPJdata['municipio'];
      _porte = CNPJdata['porte'];
      _abertura = CNPJdata['abertura'];
      _natureza_juridica = CNPJdata['natureza_juridica'];
      _uf = CNPJdata['uf'];
      _telefone = CNPJdata['telefone'];
      _ultima_atualizacao = CNPJdata['ultima_atualizacao'];
      _fantasia = CNPJdata['fantasia'];
      _motivo_situacao = CNPJdata['motivo_situacao'];
      _situacao_especial = CNPJdata['situacao_especial'];
      _data_situacao_especial = CNPJdata['data_situacao_especial'];
      _capital_social = CNPJdata['capital_social'];

      _cnpj = CNPJdata['cnpj'];
      _efr = CNPJdata['efr'];

      if (CNPJdata['atividade_principal'] != null) {
        _atividadePrincipal = new List<TAtividadePrincipal>();
        CNPJdata['atividade_principal'].forEach((v) { _atividadePrincipal.add(new TAtividadePrincipal.fromJson(v)); });
      }

      if (CNPJdata['atividades_secundarias'] != null) {
        _atividadesSecundarias = new List<TAtividadesSecundarias>();
        CNPJdata['atividades_secundarias'].forEach((v) { _atividadesSecundarias.add(new TAtividadesSecundarias.fromJson(v)); });
      }

      if (CNPJdata['qsa'] != null) {
        _qsa = new List<TQSA>();
        CNPJdata['qsa'].forEach((v) { _qsa.add(new TQSA.fromJson(v)); });
      }
    }

  }

  String getBody() {
    return _Body;
  }

  int getResponse() {
    return _Response;
  }

  String getLastCNPJ() {
    return _LastCNPJ;
  }

  String getCNPJ() {
    return _cnpj;
  }

  String getDataSituacao() {
    return _data_situacao;
  }

  String getComplemento() {
    if (_sensitive != null) {
      if (_sensitive == 'lower') {
        return _complemento.toLowerCase();
      } else if (_sensitive == 'upper') {
        return _complemento.toUpperCase();
      } else {
        return _complemento;
      }
    } else {
      return _complemento;
    }
  }

  String getTipo() {
    if (_sensitive != null) {
      if (_sensitive == 'lower') {
        return _tipo.toLowerCase();
      } else if (_sensitive == 'upper') {
        return _tipo.toUpperCase();
      } else {
        return _tipo;
      }
    } else {
      return _tipo;
    }
  }

  String getNome() {
    if (_sensitive != null) {
      if (_sensitive == 'lower') {
        return _nome.toLowerCase();
      } else if (_sensitive == 'upper') {
        return _nome.toUpperCase();
      } else {
        return _nome;
      }
    } else {
      return _nome;
    }
  }

  String getEmail() {
    if (_sensitive != null) {
      if (_sensitive == 'lower') {
        return _email.toLowerCase();
      } else if (_sensitive == 'upper') {
        return _email.toUpperCase();
      } else {
        return _email;
      }
    } else {
      return _email;
    }
  }

  String getSituacao() {
    if (_sensitive != null) {
      if (_sensitive == 'lower') {
        return _situacao.toLowerCase();
      } else if (_sensitive == 'upper') {
        return _situacao.toUpperCase();
      } else {
        return _situacao;
      }
    } else {
      return _situacao;
    }
  }

  String getBairro() {
    if (_sensitive != null) {
      if (_sensitive == 'lower') {
        return _bairro.toLowerCase();
      } else if (_sensitive == 'upper') {
        return _bairro.toUpperCase();
      } else {
        return _bairro;
      }
    } else {
      return _bairro;
    }
  }

  String getLogradouro() {
    if (_sensitive != null) {
      if (_sensitive == 'lower') {
        return _logradouro.toLowerCase();
      } else if (_sensitive == 'upper') {
        return _logradouro.toUpperCase();
      } else {
        return _logradouro;
      }
    } else {
      return _logradouro;
    }
  }

  String getNumero() {
    if (_sensitive != null) {
      if (_sensitive == 'lower') {
        return _numero.toLowerCase();
      } else if (_sensitive == 'upper') {
        return _numero.toUpperCase();
      } else {
        return _numero;
      }
    } else {
      return _numero;
    }
  }

  String getCEP() {
    return _cep;
  }

  String getMunicipio() {
    if (_sensitive != null) {
      if (_sensitive == 'lower') {
        return _municipio.toLowerCase();
      } else if (_sensitive == 'upper') {
        return _municipio.toUpperCase();
      } else {
        return _municipio;
      }
    } else {
      return _municipio;
    }
  }

  String getPorte() {
    if (_sensitive != null) {
      if (_sensitive == 'lower') {
        return _porte.toLowerCase();
      } else if (_sensitive == 'upper') {
        return _porte.toUpperCase();
      } else {
        return _porte;
      }
    } else {
      return _porte;
    }
  }

  String getAbertura() {
    return _abertura;
  }

  String getNaturezaJuridica() {
    if (_sensitive != null) {
      if (_sensitive == 'lower') {
        return _natureza_juridica.toLowerCase();
      } else if (_sensitive == 'upper') {
        return _natureza_juridica.toUpperCase();
      } else {
        return _natureza_juridica;
      }
    } else {
      return _natureza_juridica;
    }
  }

  String getUF() {
    if (_sensitive != null) {
      if (_sensitive == 'lower') {
        return _uf.toLowerCase();
      } else if (_sensitive == 'upper') {
        return _uf.toUpperCase();
      } else {
        return _uf;
      }
    } else {
      return _uf;
    }
  }

  String getTelefone() {
    return _telefone;
  }

  String getUltimaAtualizacao() {
    return _ultima_atualizacao;
  }

  String getFantasia() {
    if ( (_fantasia == null) || (_fantasia == '') ) {
      _fantasia = 'IndisponĂ­vel';
    }

    if (_sensitive != null) {
      if (_sensitive == 'lower') {
        return _fantasia.toLowerCase();
      } else if (_sensitive == 'upper') {
        return _fantasia.toUpperCase();
      } else {
        return _fantasia;
      }
    } else {
      return _fantasia;
    }
  }

  String getMotivoSituacao() {
    if (_sensitive != null) {
      if (_sensitive == 'lower') {
        return _motivo_situacao.toLowerCase();
      } else if (_sensitive == 'upper') {
        return _motivo_situacao.toUpperCase();
      } else {
        return _motivo_situacao;
      }
    } else {
      return _motivo_situacao;
    }
  }

  String getSituacaoEspecial() {
    if (_sensitive != null) {
      if (_sensitive == 'lower') {
        return _situacao_especial.toLowerCase();
      } else if (_sensitive == 'upper') {
        return _situacao_especial.toUpperCase();
      } else {
        return _situacao_especial;
      }
    } else {
      return _situacao_especial;
    }
  }

  String getDataSituacaoEspecial() {
    return _data_situacao_especial;
  }

  String getCapitalSocial() {
    return _capital_social;
  }

  String getAtividadePrincipal() {
    String retorno = null;

    for (TAtividadePrincipal node in _atividadePrincipal) {
      retorno = node.text;

      break;
    }

    if (_sensitive != null) {
      if (_sensitive == 'lower') {
        return retorno.toLowerCase();
      } else if (_sensitive == 'upper') {
        return retorno.toUpperCase();
      } else {
        return retorno;
      }
    } else {
      return retorno;
    }
  }

  String getCNAEPrincipal() {
    String retorno = null;

    for (TAtividadePrincipal node in _atividadePrincipal) {
      retorno = node.code;

      break;
    }

    return retorno;
  }

  int getCNAEPrincipalNumeros() {
    int retorno = null;

    for (TAtividadePrincipal node in _atividadePrincipal) {
      retorno = int.parse(node.code.replaceAll('.', '').replaceAll('-', ''));

      break;
    }

    return retorno;
  }

  Map<String, String> getAtividadesSecundarias() {
    Map<String, String> map = new Map<String, String>();

    for (TAtividadesSecundarias node in _atividadesSecundarias) {
      map[node.text] = node.code;
    }

    return map;
  }

  Map<String, String> getQSA() {
    Map<String, String> map = new Map<String, String>();

    for (TQSA node in _qsa) {
      map[node.nome] = node.qual;
    }

    return map;
  }

  String getEFR() {
    if (_sensitive != null) {
      if (_sensitive == 'lower') {
        return _efr.toLowerCase();
      } else if (_sensitive == 'upper') {
        return _efr.toUpperCase();
      } else {
        return _efr;
      }
    } else {
      return _efr;
    }
  }

}