import 'package:enrutamiento/model/dragonball_model.dart';
import 'package:enrutamiento/service/dragonball_service.dart';
import 'package:flutter/material.dart';

class Product2DetailScreen extends StatefulWidget {
  final int id;
  const Product2DetailScreen({super.key, required this.id});

  @override
  State<Product2DetailScreen> createState() => _Product2DetailScreenState();
}

class _Product2DetailScreenState extends State<Product2DetailScreen> {
  DragonballModel? character;
  bool isLoading = true;
  String error = '';

  @override
  void initState() {
    super.initState();
    getCharacter();
  }

  void getCharacter() async {
    try {
      setState(() {
        isLoading = true;
        error = '';
      });
      final result = await DragonballService().getCharacterById(widget.id);
      setState(() {
        character = result;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character?.name ?? "Cargando..."),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : error.isNotEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Error: $error'),
                      ElevatedButton(
                        onPressed: getCharacter,
                        child: const Text('Reintentar'),
                      ),
                    ],
                  ),
                )
              : character == null
                  ? const Center(child: Text('Personaje no encontrado'))
                  : SingleChildScrollView(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 80,
                            backgroundImage: NetworkImage(character!.image),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            character!.name,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildDetailRow('Raza', character!.race),
                                  _buildDetailRow('Género', character!.gender),
                                  _buildDetailRow('Ki', character!.ki),
                                  _buildDetailRow('Ki Máximo', character!.maxKi),
                                  _buildDetailRow('Afiliación', character!.affilation),
                                  const SizedBox(height: 10),
                                  const Text(
                                    'Descripción:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(character!.description),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}