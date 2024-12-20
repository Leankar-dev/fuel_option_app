import 'package:flutter/material.dart';
import 'package:opcao_combustivel_app/widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controllerAlcoholEC = TextEditingController();
  final _controllerGasolineEC = TextEditingController();
  String _result = '';

  @override
  void dispose() {
    super.dispose();
    _controllerAlcoholEC.dispose();
    _controllerGasolineEC.dispose();
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _calculate() {
    FocusScope.of(context).unfocus();
    final alcoholPrice = double.tryParse(_controllerAlcoholEC.text.trim());
    final gasolinePrice = double.tryParse(_controllerGasolineEC.text.trim());

    if (alcoholPrice == null || gasolinePrice == null) {
      _showSnackBar('Informe os valores para realizar o cálculo. Ex: 3.15');
      return;
    }

    final resultado = alcoholPrice / gasolinePrice;

    if (resultado >= 0.7) {
      _showSnackBar('Melhor abastecer com Gasolina!');
    } else {
      _showSnackBar('Melhor abastecer com Álcool!');
    }
    _reset();
  }

  void _reset() {
    _controllerAlcoholEC.text = '';
    _controllerGasolineEC.text = '';
    setState(() {
      _result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Álcool ou Gasolina",
          style: TextStyle(
            color: Colors.yellow,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 32),
              Image.asset(
                'assets/logo.png',
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.error),
              ),
              const SizedBox(height: 32),
              const Text(
                "Saiba qual a melhor opção para abastecimento do seu carro:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              TextField(
                decoration: const InputDecoration(
                  labelText: "Preço do Álcool",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                controller: _controllerAlcoholEC,
              ),
              const SizedBox(height: 32),
              TextField(
                decoration: const InputDecoration(
                  labelText: "Preço da Gasolina",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                controller: _controllerGasolineEC,
              ),
              const SizedBox(height: 32),
              CustomButton(
                text: 'Calcular',
                onPressed: _calculate,
              ),
              const SizedBox(height: 32),
              Center(
                child: Text(
                  _result,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
