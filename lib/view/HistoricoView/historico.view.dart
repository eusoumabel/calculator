import 'package:calculator_final/view/HistoricoView/historico.styles.dart';
import 'package:calculator_final/view/HomeView/home.view.dart';
import 'package:flutter/material.dart';

class HistoricoView extends StatefulWidget {
  HistoricoView({Key key}) : super(key: key);

  @override
  _HistoricoViewState createState() => _HistoricoViewState();
}

class _HistoricoViewState extends State<HistoricoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                setState(() {
                  operacoes = new List<String>();
                });
              }),
        ],
        backgroundColor: HistoricoStyles().color,
        title: Text('RESULTADOS'),
      ),
      body: ListView.builder(
        itemCount: operacoes.length,
        itemBuilder: (_, index) {
          return ListTile(
            title: Text(operacoes[index]),
          );
        },
      ),
    );
  }
}
