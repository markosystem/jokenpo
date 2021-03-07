class RegrasResultado {
  String _escolhaUsuario;
  String _escolhaApp;
  String _resultado;

  String get escolhaUsuario => _escolhaUsuario;

  String get escolhaApp => _escolhaApp;

  String get resultado => _resultado;

  set escolhaUsuario(String value) {
    _escolhaUsuario = value;
  }

  set escolhaApp(String value) {
    _escolhaApp = value;
  }

  set resultado(String value) {
    _resultado = value;
  }

  RegrasResultado(this._escolhaUsuario, this._escolhaApp) {
    this._resultado = "";
    if ((this.escolhaUsuario == "pedra" && this.escolhaApp == "tesoura") ||
        (this.escolhaUsuario == "tesoura" && this.escolhaApp == "papel") ||
        (this.escolhaUsuario == "papel" && this.escolhaApp == "pedra")) {
      this._resultado = "Parabéns. Você Ganhou!!! =D";
    } else if ((this.escolhaApp == "pedra" &&
            this.escolhaUsuario == "tesoura") ||
        (this.escolhaApp == "tesoura" && this.escolhaUsuario == "papel") ||
        (this.escolhaApp == "papel" && this.escolhaUsuario == "pedra")) {
      this._resultado = "Que Pena, você Perdeu! =(";
    } else {
      this._resultado = "Houve um Empate!";
    }
  }

  @override
  String toString() {
    return 'RegrasResultado{_escolhaUsuario: $_escolhaUsuario, _escolhaApp: $_escolhaApp, _resultado: $_resultado}';
  }
}
