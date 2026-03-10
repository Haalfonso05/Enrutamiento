import 'package:enrutamiento/model/dragonball_model.dart';
import 'package:enrutamiento/service/dragonball_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Product2Screen extends StatefulWidget {
  const Product2Screen({super.key});

  @override
  State<Product2Screen> createState() => _Product2ScreenState();
}

class _Product2ScreenState extends State<Product2Screen> {
  List<DragonballModel> characters = [];
  bool isLoading = true;
  String error = '';
  
  @override
  void initState() {
    super.initState();
    getCharacters();
  }
  
  void getCharacters() async {
    try {
      setState(() {
        isLoading = true;
        error = '';
      });
      final List<DragonballModel> temporal = await DragonballService().getCharacters();
      setState(() {
        characters = temporal;
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
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    
    if (error.isNotEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Error: $error'),
            ElevatedButton(
              onPressed: getCharacters,
              child: const Text('Reintentar'),
            ),
          ],
        ),
      );
    }
    
    if (characters.isEmpty) {
      return const Center(child: Text('No hay personajes'));
    }
    
    return ListView.builder(
      itemCount: characters.length,
      itemBuilder: (context, index) {
        final character = characters[index];
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(character.image),
            ),
            title: Text(character.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Raza: ${character.race}'),
                Text('Ki: ${character.ki}'),
              ],
            ),
            onTap: () {
              context.go('/product/${character.id}');
            },
          ),
        );
      },
    );
  }
}