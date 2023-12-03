import 'package:crud/src/model/Produto.dart';
import 'package:crud/src/service/ProdutoService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProdutoView extends StatefulWidget {
  const ProdutoView({super.key, required this.title});

  final String title;

  @override
  State<ProdutoView> createState() => _ProdutoViewState();
}

class _ProdutoViewState extends State<ProdutoView> {

  Produto produto = Produto();
  final ProdutoService _service = ProdutoService();
  List produtos = [];

  void getAllProdutos() async {
    var res = await _service.getAllProdutos();
    setState(() {
      produtos = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Produtos',
            ),
            const Padding(padding: EdgeInsets.only(bottom: 20)),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nome',
              ),
              onChanged: (t) {
                setState(() {
                  produto.nome = t;
                });
              },
            ),
            const Padding(padding: EdgeInsets.only(bottom: 5)),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Descrição',
              ),
              onChanged: (t) {
                setState(() {
                  produto.descricao = t;
                });
              },
            ),
            const Padding(padding: EdgeInsets.only(bottom: 5)),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Preço',
              ),
              onChanged: (t) {
                setState(() {
                  produto.preco = double.parse(t);
                });
              },
            ),
            const Padding(padding: EdgeInsets.only(bottom: 8)),
            ElevatedButton(
                onPressed: () {
                  _service.createProduto(produto);
                },
                child: const Text("Criar Produto")),
            ElevatedButton(
                onPressed: () {
                  
                  getAllProdutos();
                },
                child: const Text("Buscar")),

            const Padding(padding: EdgeInsets.only(bottom: 8)),

            Expanded(child: ListView.builder(
              itemCount: produtos.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text(produtos[index]["nome"] + ' ' + produtos[index]["descricao"]),
                    subtitle: Text('Preço: ' + produtos[index]["preco"].toString()),
                    trailing: ElevatedButton(
                      onPressed: () {
                        _service.deleteProduto(produtos[index]["id"]);
                        getAllProdutos();
                      },
                      child: Icon(CupertinoIcons.trash, color: Color.fromARGB(255, 255, 0, 0), size: 30,),
                    )

                );
              },
            ),)
          ],

        ),
      ),
    );
  }
}
