import 'package:flutter/material.dart';

class AppGas extends StatefulWidget {
  const AppGas({Key? key}) : super(key: key);

  @override
  State<AppGas> createState() => _AppGasState();
}

class _AppGasState extends State<AppGas> {
  final TextEditingController _controllerAlcool = TextEditingController();
  final TextEditingController _controllerGasolina = TextEditingController();
  String _mensagem = '';

  void _calcular() {
    double? precoAlcool =
        double.tryParse(_controllerAlcool.text.replaceAll(',', '.'));
    double? precoGasolina =
        double.tryParse(_controllerGasolina.text.replaceAll(',', '.'));

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _mensagem =
            'OPS! Número inválido, apenas valores maiores que 0 e separados por , ou .';
      });
    } else {
      if (precoAlcool / precoGasolina >= 0.7) {
        setState(() {
          _mensagem = 'Melhor abastecer com gasolina';
        });
      } else {
        setState(() {
          _mensagem = 'Melhor abastecer com álcool';
        });
      }

      _clear();
    }
  }

  _clear() {
    _controllerAlcool.text = '';
    _controllerGasolina.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Álcool ou Gasolina'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Image.asset(
                    'image/alcxgas.jpg',
                    height: 270,
                  )),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Qual combustível é melhor para você!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller:
                      _controllerAlcool, //responsável por capturar o texto digitado
                  keyboardType: TextInputType.number,
                  onSubmitted: (String alcool) {},
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(
                      fontSize: 26,
                      inherit: true,
                    ),
                    labelText: 'Preço Álcool, ex: 4,15',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _controllerGasolina,
                  //responsável por capturar o texto digitado
                  keyboardType: TextInputType.number,
                  onSubmitted: (String gasolina) {},
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(
                      fontSize: 26,
                      inherit: true,
                    ),
                    labelText: 'Preço Gasolina, ex: 4,15',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: _calcular,
                  child: const Text(
                    'Calcular',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Text(
                _mensagem,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
