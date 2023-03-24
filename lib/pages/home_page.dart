import 'package:flutter/material.dart';
import 'package:myapp/pages/favoritas_page.dart';

import 'package:myapp/pages/moedas_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int paginaAtual = 0;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: pc,
          onPageChanged: (value) => setPaginaAtual(value),
          children: const [
            MoedasPage(),
            FavoritasPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: paginaAtual,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.star), label: 'Favoritos'),
            ],
            onTap: (pagina) {
              pc.animateToPage(pagina,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut);
            }));
  }
}
