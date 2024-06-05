import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

class Scraper {
  static Future<CupomFiscalData> scrapeData(String url) async {
    final response =
        await http.get(Uri.parse(url)); //Conexão com o link gerado pelo QR Code

    if (response.statusCode == 200) {
      final document =
          parse(response.body); //Retorna o corpo da página dentro desta final

      //Seletores retirados conforme tags presentes na inspeção de elementos da página;
      final nomeLoja =
          document.querySelector('#u20')!.text.trim(); //Nome da loja

      final produtos = document.querySelectorAll('tbody> tr').map((produto) {
        final nome = produto
            .querySelector('span.txtTit2')! //Nome do produto
            .text
            .trim();
        final quantidade = produto
            .querySelector('span.Rqtd')! //Quantidade
            .text
            .trim();
        final preco = produto
            .querySelector('span.RvlUnit')! //Valor unitário
            .text
            .trim();
        return Produto(nome: nome, quantidade: quantidade, preco: preco);
      }).toList();

      final total = document
          .querySelector('#linhaTotal > span.totalNumb.txtMax')! //Total da NF
          .text
          .trim();

      return CupomFiscalData(
          nomeLoja: nomeLoja, produtos: produtos, total: total);
    } else {
      throw Exception('Erro ao obter dados do cupom: ${response.statusCode}');
    }
  }
}

class Produto {
  final String nome;
  final String quantidade;
  final String preco;

  Produto({
    required this.nome,
    required this.quantidade,
    required this.preco,
  });
} //Classe para armazenar as informações dos produtos;

class CupomFiscalData {
  final String nomeLoja;
  final List<Produto> produtos;
  final String total;

  CupomFiscalData({
    required this.nomeLoja,
    required this.produtos,
    required this.total,
  });
} //Classe para armazenar todas as informações da NF;
