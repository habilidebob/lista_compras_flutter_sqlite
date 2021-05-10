import 'package:flutter/material.dart';
import 'package:flutter_touch_spin/flutter_touch_spin.dart';
import 'package:lista_compras/controllers/principal_controller.dart';
import 'package:lista_compras/views/components/itemlista.dart';
import 'package:lista_compras/views/components/titulo1.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  // Controller:
  var _controller = PrincipalController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Compras'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/images/cart.png',
                width: 100,
                height: 100,
              ),
              Column(
                children: [
                  Titulo1(
                    txt: 'Welcome, amigue!',
                  ),
                  Container(
                    width: 200,
                    child: Text(
                        'Clique no botão + abaixo para adicionar itens na sua lista de compras.'),
                  ),
                ],
              )
            ],
          ),
          // ===================
          // Listagem de compras:
          // Utilizar ListViewBuilder dentro de um FutureBuilder
          Expanded(
            // Conteúdo de Exemplo:
            child: ListView(
              children: [
                ItemLista(
                  titulo: "Item Exemplo 1",
                  qtd: 10,
                  descr: "Lorem ipsum",
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        onPressed: () {
          // Resetar valor do controle do slider:
          _controller.sliderQtd = 1;
          // RFLUTTER ALERT:
          Alert(
              context: context,
              title: "Adicionar Item",
              content: Column(
                children: [
                  TextField(
                    maxLength: 15,
                    decoration: InputDecoration(
                      icon: Icon(Icons.shopping_cart),
                      labelText: 'Titulo',
                    ),
                  ),
                  TextField(
                    maxLength: 15,
                    decoration: InputDecoration(
                      icon: Icon(Icons.label),
                      labelText: 'Descrição',
                    ),
                  ),
                  Text(
                    'Quantidade:',
                  ),
                  TouchSpin(
                    min: 1,
                    max: 50,
                    step: 1,
                    value: _controller.sliderQtd.round(),
                    onChanged: (val) {
                      _controller.sliderQtd = val;
                    },
                  )
                ],
              ),
              buttons: [
                DialogButton(
                  onPressed: () {
                    // Comandos para inserção no BD quando clicar em "Adicionar":
                    Navigator.pop(context);
                  },
                  color: Colors.green,
                  child: Text(
                    "Adicionar",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ]).show();
        },
      ),
    );
  }
}
