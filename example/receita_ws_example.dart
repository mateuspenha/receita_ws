import 'package:receita_ws/receita_ws.dart' as ws;
import 'dart:io';

main() async {
  var cnpj = new ws.receita_ws();

  print('Digite o CNPJ: ');

  String lido = stdin.readLineSync();

  var result = await cnpj.searchCNPJ(lido, null);

  // Sucesso
  if (cnpj.getResponse() == 200) {
    print('CNPJ: '+cnpj.getCNPJ());
    print('Tipo: '+cnpj.getTipo());
    print('Data de Abertura: '+cnpj.getAbertura());
    print('Nome Empresarial: '+cnpj.getNome());
    print('Nome Fantasia: '+cnpj.getFantasia());
    print('Porte: '+cnpj.getPorte());
    print('Atividade Principal: '+cnpj.getAtividadePrincipal());
    print('CANE Prinripal: '+cnpj.getCNAEPrincipal());
    print('CANE Prinripal (Números): '+cnpj.getCNAEPrincipalNumeros().toString());

    Map<String, String> sec = new Map<String, String>();

    sec = cnpj.getAtividadesSecundarias();

    sec.forEach((v1,v2) => print('Atividade Secundária: ${v1}: CNAE ${v2}'));

    print('Logradouro: '+cnpj.getLogradouro());
    print('Número: '+cnpj.getNumero());
    print('Complemento: '+cnpj.getComplemento());
    print('CEP: '+cnpj.getCEP());
    print('Bairro: '+cnpj.getBairro());
    print('Municipio: '+cnpj.getMunicipio());
    print('UF: '+cnpj.getUF());
    print('E-mail (Endereço Eletrônico): '+cnpj.getEmail());
    print('Telefone: '+cnpj.getTelefone());
    print('Ente Federativo Responsável (EFR): '+cnpj.getEFR());
    print('Situação: '+cnpj.getSituacao());
    print('Data da Situação: '+cnpj.getDataSituacao());
    print('Motivo da Situação: '+cnpj.getMotivoSituacao());
    print('Natureza Juridica: '+cnpj.getNaturezaJuridica());
    print('Situação Especial: '+cnpj.getSituacaoEspecial());
    print('Data da Situação Especial: '+cnpj.getDataSituacaoEspecial());

    print('Ultima Atualização: '+cnpj.getUltimaAtualizacao());

    print('Capital Social: '+cnpj.getCapitalSocial());

    Map<String, String> qsa = new Map<String, String>();

    qsa = cnpj.getQSA();

    qsa.forEach((v1,v2) => print('Sócio: ${v1}: Qualificação ${v2}'));

  } else {
    print('Código de Retorno: '+cnpj.getResponse().toString());
    print('Erro: '+cnpj.getBody());
  }
}