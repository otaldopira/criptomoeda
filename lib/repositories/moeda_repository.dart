import 'package:myapp/models/moeda.dart';

class MoedaRepo {
  static List<Moeda> tabela = [
    Moeda(
      icone: 'images/bitcoin.png',
      nome: 'BitCoin',
      sigla: 'BTC',
      preco: 125881.66,
    ),
    Moeda(
      icone: 'images/cardano.png',
      nome: 'Cardano',
      sigla: 'ADA',
      preco: 1.80,
    ),
    Moeda(
      icone: 'images/ethereum.png',
      nome: 'Ethereum',
      sigla: 'ETH',
      preco: 8735.74,
    ),
    Moeda(
      icone: 'images/litecoin.png',
      nome: 'Litecoin',
      sigla: 'LTC',
      preco: 430.37,
    ),
    Moeda(
      icone: 'images/usdcoin.png',
      nome: 'USD',
      sigla: 'USD',
      preco: 5.25,
    ),
    Moeda(
      icone: 'images/xrp.png',
      nome: 'XRP',
      sigla: 'XRP',
      preco: 1.95,
    ),
  ];
}
