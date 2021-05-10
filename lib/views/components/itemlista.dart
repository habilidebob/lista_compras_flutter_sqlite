import 'package:flutter/material.dart';
import 'package:lista_compras/views/components/titulo1.dart';

class ItemLista extends StatelessWidget {
  final String titulo;
  final int qtd;
  final String descr;

  const ItemLista({Key key, this.titulo, this.qtd, this.descr})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Titulo1(txt: titulo),
                Text('Quantidade: $qtd'),
                Text('Descricao: $descr')
              ],
            ),
            Icon(
              Icons.check,
              size: 40,
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}
