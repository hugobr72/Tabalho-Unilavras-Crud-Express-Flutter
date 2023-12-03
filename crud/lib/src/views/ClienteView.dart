import 'package:crud/src/model/Cliente.dart';
import 'package:crud/src/service/ClienteService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ClienteView extends StatefulWidget {
  const ClienteView({super.key, required this.title});
  final String title;
  @override
  State<ClienteView> createState() => _ClienteViewState();
}

class _ClienteViewState extends State<ClienteView> {
  final ClienteService _service = ClienteService();
  Cliente cliente = Cliente();

  List clientes = [];

  void getClientes() async {
    var res = await _service.getAllCliente();
    setState(() {
      clientes = res;
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Cliente',
            ),
            const Padding(padding: EdgeInsets.only(bottom: 20)),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nome',
              ),
              onChanged: (t) {
                setState(() {
                  cliente.nome = t;
                });
              },
            ),
            const Padding(padding: EdgeInsets.only(bottom: 5)),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Sobrenome',
              ),
              onChanged: (t) {
                setState(() {
                  cliente.sobrenome = t;
                });
              },
            ),
            const Padding(padding: EdgeInsets.only(bottom: 5)),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
              onChanged: (t) {
                setState(() {
                  cliente.email = t;
                });
              },
            ),
            const Padding(padding: EdgeInsets.only(bottom: 5)),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Idade',
              ),
              onChanged: (t) {
                setState(() {
                  cliente.idade = int.parse(t);
                });
              },
            ),
            const Padding(padding: EdgeInsets.only(bottom: 8)),
            ElevatedButton(
                onPressed: () {
                  _service.createCliente(cliente);
                },
                child: const Text("Criar Cliente")),
            ElevatedButton(
                onPressed: () {
                  getClientes();
                },
                child: const Text("Buscar")),
            const Padding(padding: EdgeInsets.only(bottom: 8)),
            Expanded(
              child: ListView.builder(
                itemCount: clientes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text(clientes[index]["nome"] +
                          ' ' +
                          clientes[index]["sobrenome"]),
                      subtitle: Text('Email: ' +
                          clientes[index]["email"] +
                          ', Idade: ' +
                          clientes[index]["idade"].toString()),
                      trailing: ElevatedButton(
                        onPressed: () {
                          _service.deleteCliente(clientes[index]["id"]);
                          getClientes();
                        },
                        child: Icon(
                          CupertinoIcons.trash,
                          color: Color.fromARGB(255, 255, 0, 0),
                          size: 30,
                        ),
                      ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
