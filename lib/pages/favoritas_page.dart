import 'package:flutter/material.dart';
import 'package:myapp/repositories/favoritas_repository.dart';
import 'package:myapp/widgets/moeda_card.dart';
import 'package:provider/provider.dart';

class FavoritasPage extends StatefulWidget {
  const FavoritasPage({super.key});

  @override
  State<FavoritasPage> createState() => _FavoritasPageState();
}

class _FavoritasPageState extends State<FavoritasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Moedas Favoritas'),
      ),
      body: Consumer<FavoritasRepository>(
        builder: (context, favoritas, child) {
          return favoritas.lista.isEmpty
              ? const ListTile(
                  leading: Icon(Icons.star),
                  title: Text('Ainda não tem moedas favoritadas !'),
                )
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return MoedaCard(
                      moeda: favoritas.lista[index],
                    );
                  },
                  itemCount: favoritas.lista.length);
        },
      ),
    );
  }
}
