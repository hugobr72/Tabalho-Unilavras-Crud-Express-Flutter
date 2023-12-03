import 'package:dio/dio.dart';
import '../model/Produto.dart';

class ProdutoService {
  var http = Dio();
  var url = 'http://192.168.0.107:3000/produtos/';

  void createProduto(Produto produto) async {
    //Validação de criação de produto
    // if (produto.descricao == null &&
    //     produto.nome == null &&
    //     produto.preco == null) {
    //   return;
    // }

    // if ((produto.nome!.split("").length < 3 ||
    //         produto.nome!.split("").length > 25) &&
    //     (produto.descricao!.split("").length < 3 ||
    //         produto.descricao!.split("").length > 25)) {
    //   return;
    // }
    // //Validação de preço
    // if (produto.preco! < 120) {
    //   return;
    // }

    await http.post(url, data: {
      'nome': produto.nome,
      'descricao': produto.descricao,
      'preco': produto.preco.toString()
    });
  }

  Future<List> getAllProdutos() async {
    try {
      var response = await http.get(url);
      var json = response.data;
      return json;
    } catch (e) {
      return [];
    }
  }

  void deleteProduto(int id) async {
    print(id);
    await http.delete(url, data: {'id': id});
  }
}
