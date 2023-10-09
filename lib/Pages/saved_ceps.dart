import 'package:flutter/material.dart';
import 'package:myapp/Models/via_cep_model.dart';
import 'package:myapp/Repository/back4app/via_cep_repository.dart';

class SavedCepsScreen extends StatefulWidget {
  const SavedCepsScreen({super.key});

  @override
  State<SavedCepsScreen> createState() => _SavedCepsScreenState();
}

class _SavedCepsScreenState extends State<SavedCepsScreen> {
  var cepProvider = ViaCepAggregateModel([]);
  ViaCepBak4AppRepository viaCepRepository = ViaCepBak4AppRepository();

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    cepProvider = await viaCepRepository.getTasks();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CEPs Salvos'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Volta para a tela anterior
          },
        ),
      ),
      body: ListView.builder(
        itemCount: cepProvider.ceps.length,
        itemBuilder: (context, index) {
          final cepDetails = cepProvider.ceps[index];
          return ListTile(
            title: Text('CEP: ${cepDetails.cep}'),
            subtitle: Text(
                'Localidade: ${cepDetails.localidade}, Bairro: ${cepDetails.bairro}, Logradouro: ${cepDetails.logradouro}, Complemento: ${cepDetails.complemento}'),
            // Adicione outros campos aqui conforme necessário
          );
        },
      ),
    );
  }
}
