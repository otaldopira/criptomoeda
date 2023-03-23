import 'package:flutter/material.dart';
import 'package:myapp/models/moeda.dart';
import 'package:myapp/pages/moeda_detalhes_page.dart';
import 'package:myapp/repositories/moeda_repository.dart';
import 'package:intl/intl.dart';

class MoedasPage extends StatefulWidget {
  @override
  const MoedasPage({super.key});

  @override
  State<MoedasPage> createState() => _MoedasPageState();
}

class _MoedasPageState extends State<MoedasPage> {
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');

  final tabela = MoedaRepo.tabela;

  List<Moeda> selecionada = [];

  appBarDinamica() {
    if (selecionada.isEmpty) {
      return AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: const Text(
          'Cripto Moedas',
          style: TextStyle(color: Colors.black87),
        ),
      );
    } else {
      return AppBar(
        leading: IconButton(
            onPressed: () => setState(() => selecionada = []),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black87,
            )),
        title: Center(
          child: Text('(${selecionada.length.toString()}) Selecionadas',
              style: const TextStyle(color: Colors.black87)),
        ),
        backgroundColor: Colors.yellow[500],
        toolbarHeight: 80,
        elevation: 1,
      );
    }
  }

  mostrarDetalhes(Moeda moeda) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MoedaDetalhesPage(moeda: moeda),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarDinamica(),
        body: ListView.separated(
          padding: const EdgeInsets.all(10.0),
          itemCount: tabela.length,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemBuilder: (context, index) {
            return ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              leading: (selecionada.contains(tabela[index])
                  ? const CircleAvatar(
                      child: Icon(Icons.check),
                    )
                  : SizedBox(
                      width: 40,
                      child: Image.asset(tabela[index].icone),
                    )),
              title: Text(
                tabela[index].nome,
                style: const TextStyle(fontSize: 17),
              ),
              subtitle: Text(tabela[index].sigla),
              trailing: Text(
                real.format(tabela[index].preco),
              ),
              onLongPress: () => setState(() =>
                  selecionada.contains(tabela[index])
                      ? selecionada.remove(tabela[index])
                      : selecionada.add(tabela[index])),
              selected: selecionada.contains(tabela[index]),
              selectedTileColor: Colors.indigo[50],
              onTap: () => mostrarDetalhes(tabela[index]),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: selecionada.isNotEmpty
            ? FloatingActionButton.extended(
                onPressed: () {},
                icon: const Icon(Icons.star),
                backgroundColor: Colors.yellow,
                label: const Text(
                  'FAVORITAR',
                  style:
                      TextStyle(letterSpacing: 0, fontWeight: FontWeight.bold),
                ),
              )
            : null);
  }
}
