import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jokenpo/Ajuda.dart';
import 'package:jokenpo/RegrasResultado.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("images/padrao.png");
  String _textResultado = "Escolha uma opção abaixo";
  String _textEscolhaApp = "";
  String _textEscolhaUsuario = "";

  void _validarResultado(String escolhaUsuario) {
    String escolhaApp = this.opcaoApp();
    setState(() {
      this._textEscolhaApp = ': $escolhaApp';
      this._imagemApp = AssetImage('images/$escolhaApp.png');
      this._textEscolhaUsuario = 'Sua escolha foi: $escolhaUsuario';
      this._textResultado = _cacularResultado(escolhaUsuario, escolhaApp);
    });
  }

  String _cacularResultado(String escolhaUsuario, String escolhaApp) {
    var resultado = RegrasResultado(escolhaUsuario, escolhaApp);
    print(resultado.toString());
    return resultado.resultado;
  }

  String opcaoApp() {
    var opcoes = ["pedra", "papel", "tesoura"];
    int indiceEscolhido = Random().nextInt(opcoes.length);
    return opcoes[indiceEscolhido];
  }

  void _onItemTapped(int index) {
    setState(() {
      if (index == 1) {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => Ajuda()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("JokenPo"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 50),
              child: Text(
                'Escolha do App$_textEscolhaApp',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Image(image: _imagemApp),
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                _textResultado,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => _validarResultado("pedra"),
                  child: Image.asset("images/pedra.png", height: 100),
                ),
                GestureDetector(
                  onTap: () => _validarResultado("papel"),
                  child: Image.asset("images/papel.png", height: 100),
                ),
                GestureDetector(
                  onTap: () => _validarResultado("tesoura"),
                  child: Image.asset("images/tesoura.png", height: 100),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                _textEscolhaUsuario,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.help), label: "Ajuda")
        ], selectedItemColor: Colors.blue, onTap: _onItemTapped));
  }
}
