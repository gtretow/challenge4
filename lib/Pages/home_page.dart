// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:myapp/Models/via_cep_model.dart';
import 'package:myapp/Repository/back4app/via_cep_repository.dart';
import 'package:myapp/Services/consultar_viacep.dart';
import 'package:myapp/Widgets/custom_drawer.dart';

class ConsultCepScreen extends StatelessWidget {
  const ConsultCepScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ViaCepBak4AppRepository viaCepRepository = ViaCepBak4AppRepository();
    TextEditingController cepController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Consultar CEP'),
        ),
        drawer: const CustomDrawer(),
        body: Center(
          child: Column(
            children: [
              TextField(
                controller: cepController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Digite o CEP'),
              ),
              ElevatedButton(
                onPressed: () async {
                  final cepData =
                      await CepService().fetchCep(cepController.text);
                  if (cepData['erro'] == null) {
                    final cepDetails = ViaCEPModel.fromJson(cepData);
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              title: const Text('Detalhes do CEP'),
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('CEP: ${cepDetails.cep}'),
                                  Text('Logradouro: ${cepDetails.logradouro}'),
                                  Text('Bairro: ${cepDetails.bairro}'),
                                  Text('Localidade: ${cepDetails.localidade}'),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Cancelar'),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    await viaCepRepository
                                        .create(ViaCEPModel.create(
                                      cepDetails.cep,
                                      cepDetails.logradouro,
                                      cepDetails.bairro,
                                      cepDetails.complemento,
                                      cepDetails.localidade,
                                    ));
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Salvar'),
                                ),
                              ]);
                        });
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('CEP não encontrado'),
                          content:
                              const Text('O CEP informado não foi encontrado.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Text('Consultar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
