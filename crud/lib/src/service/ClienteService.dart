import 'package:dio/dio.dart';
import '../model/Cliente.dart';

class ClienteService {
  var http = Dio();
  var url = 'http://192.168.0.107:3000/cliente/';
  void createCliente(Cliente cliente) async {
    // //Validação de criação de produto
    // if (cliente.email == null &&
    //     cliente.nome == null &&
    //     cliente.sobrenome == null &&
    //     cliente.idade == 0) {
    //   return;
    // }

    // //Validação de tamanho
    // if ((cliente.nome!.split("").length < 3 ||
    //         cliente.nome!.split("").length > 25) &&
    //     (cliente.sobrenome!.split("").length < 3 ||
    //         cliente.sobrenome!.split("").length > 25)) {
    //   return;
    // }

    // //Validação de email
    // String padraoEmail = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
    // RegExp regExp = RegExp(padraoEmail);
    // if (regExp.hasMatch(cliente.email.toString())) {
    //   return;
    // }

    // //Validação de idade
    // if (cliente.idade! < 120) {
    //   return;
    // }

    await http.post(url, data: {
      'nome': cliente.nome,
      'sobrenome': cliente.sobrenome,
      'email': cliente.email,
      'idade': cliente.idade.toString()
    });
  }

  Future<List> getAllCliente() async {
    try {
      var response = await http.get(url);
      var json = response.data;
      return json;
    } catch (e) {
      return [];
    }
  }

  void deleteCliente(int id) async {
    await http.delete(url, data: {'id': id});
  }
}
