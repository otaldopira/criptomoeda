import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/models/moeda.dart';

class MoedaCard extends StatefulWidget {
  final Moeda moeda;

  const MoedaCard({required this.moeda, Key? key}) : super(key: key);

  @override
  State<MoedaCard> createState() => _MoedaCardState();
}

class _MoedaCardState extends State<MoedaCard> {
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Image.asset(widget.moeda.icone, width: 40),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.moeda.nome),
                      Text(widget.moeda.sigla),
                    ],
                  ),
                ),
              ),
              Text(
                real.format(widget.moeda.preco),
              )
            ],
          ),
        ),
      ),
    );
  }
}
