import 'package:flutter/material.dart';

class AlcoolGasolina extends StatefulWidget {
  const AlcoolGasolina({Key? key}) : super(key: key);

  @override
  State<AlcoolGasolina> createState() => _AlcoolGasolinaState();
}

class _AlcoolGasolinaState extends State<AlcoolGasolina> {
  @override
  var _logo = AssetImage("images/logo.png");
  var _resultado = "Digite os valores e clique em Calcular.";

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();

  void _calcular() {
    double? precoAlcool =
        double.tryParse(_controllerAlcool.text.replaceAll(',', '.'));
    double? precoGasolina =
        double.tryParse(_controllerGasolina.text.replaceAll(',', '.'));

    if (precoAlcool == null || precoGasolina == null) {
      changeResultado("Valores inválidos");
    } else {
      calculaPreco(precoAlcool, precoGasolina);
    }
  }

  void calculaPreco(precoAlcool, precoGasolina) {
    if ((precoAlcool / precoGasolina) >= 0.7) {
      changeResultado("Abasteça com Gasolina.");
    } else {
      changeResultado("Abasteça com Álcool.");
    }
  }

  void changeResultado(String texto) {
    setState(() {
      _resultado = texto;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
          child: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image(image: _logo)),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "Saiba qual a melhor opção para abastecimento do seu veiculo.",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Preço Alcool, ex: 1,59"),
              style: TextStyle(fontSize: 22),
              controller: _controllerAlcool,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: "Preço Gasolina, ex: 3,29"),
              style: TextStyle(fontSize: 22),
              controller: _controllerGasolina,
            ),
            Padding(
                padding: EdgeInsets.only(top: 10),
                child: RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(15),
                    onPressed: _calcular,
                    child: Text("Calcular",
                        style: TextStyle(
                          fontSize: 22,
                        )))),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("$_resultado",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            )
          ],
        ),
      )),
    );
  }
}
