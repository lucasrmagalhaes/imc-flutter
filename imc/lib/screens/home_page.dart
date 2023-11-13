import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String _resultado = '';
TextEditingController _controllerPeso = TextEditingController();
TextEditingController _controllerAltura = TextEditingController();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Calculadora de IMC')),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
              child: Text('Insira as informações',
                  style: TextStyle(fontSize: 25.0)),
            ),
            _campo('Peso (Kg)', _controllerPeso),
            _campo('Altura (cm)', _controllerAltura),
            Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 16.0),
                child:
                    Text(_resultado, style: const TextStyle(fontSize: 25.0))),
            Container(
                height: 50.0,
                width: 200.0,
                color: Colors.blue[800],
                child: ElevatedButton(
                  onPressed: () {
                    double? peso = double.tryParse(_controllerPeso.text);
                    double? altura = double.tryParse(_controllerAltura.text);

                    if (peso != null && altura != null) {
                      altura /= 100.0;

                      double imc = (peso / (altura * altura));
                      String imcFormatado = NumberFormat("0.00").format(imc);

                      setState(() {
                        _resultado = 'IMC: $imcFormatado';
                      });
                    }
                  },
                  child: const Text('Calcular IMC'),
                ))
          ]),
        ));
  }
}

_campo(String texto, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0),
    child: TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: texto,
          border: const OutlineInputBorder(),
          labelStyle: TextStyle(fontSize: 25.0, color: Colors.blue[800])),
    ),
  );
}
