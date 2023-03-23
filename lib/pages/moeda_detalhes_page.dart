import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:myapp/models/moeda.dart';

class MoedaDetalhesPage extends StatefulWidget {
  Moeda moeda;

  MoedaDetalhesPage({Key? key, required this.moeda}) : super(key: key);

  @override
  State<MoedaDetalhesPage> createState() => _MoedaDetalhesPageState();
}

class _MoedaDetalhesPageState extends State<MoedaDetalhesPage> {
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
  final _form = GlobalKey<FormState>();
  final _valor = TextEditingController();
  double quantidade = 0;

  comprar() {
    if (_form.currentState!.validate()) {
      //Salvar compra

      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Compra realizada com sucesso !'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.moeda.nome),
      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 50,
                child: Image.asset(widget.moeda.icone),
              ),
              Text(
                real.format(widget.moeda.preco),
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Container(
              margin: const EdgeInsets.only(bottom: 24, top: 14),
              alignment: AlignmentDirectional.center,
              child: Text(
                quantidade > 0
                    ? '${quantidade.toStringAsFixed(2)} ${widget.moeda.sigla}'
                    : '',
                style: const TextStyle(fontSize: 20, color: Colors.teal),
              ),
            ),
          ),
          Form(
            key: _form,
            child: TextFormField(
              controller: _valor,
              style: const TextStyle(fontSize: 22),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Valor',
                prefixIcon: Icon(Icons.attach_money_outlined),
                suffixText: 'reais',
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Informe o valor da compra';
                } else if (double.parse(value) < 10) {
                  return 'O valor mínimo da compra é R\$10,00';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  quantidade = (value.isEmpty)
                      ? 0
                      : double.parse(value) / widget.moeda.preco;
                });
              },
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.only(top: 24),
            child: ElevatedButton.icon(
              onPressed: () {
                comprar();
              },
              icon: const Icon(Icons.check),
              label: const Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(
                  'Comprar',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
