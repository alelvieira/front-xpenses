import 'package:flutter/material.dart';
import 'scrap.dart';

class CupomFiscal extends StatefulWidget {
  @override
  State<CupomFiscal> createState() => _CupomFiscalState();
}

class _CupomFiscalState extends State<CupomFiscal> {
  Future<CupomFiscalData?>? _data;

  @override
  void initState() {
    super.initState();
    _data = Scraper.scrapeData(
        'https://www.fazenda.pr.gov.br/nfce/qrcode?p=41231243739437000154651100000693751161457949%7C2%7C1%7C1%7C839903E429C2EC5D88DBA3E64ED41770986FDF78');
    //Substituir link pela variável com o link resultante do scan do QR Code
  }
}

//Montar o retorno necessário para apresentação das informações geradas em tela e gravação em banco.
//Exemplo funcional para apresentação das informações em tela (sem formatação)

/*
@override
  Widget build(BuildContext context) {
    return FutureBuilder<CupomFiscalData?>(
      future: _data, // Seu Future
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!;
          return SingleChildScrollView( // Wrap the Column with SingleChildScrollView
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.nomeLoja,
                ),
                const Divider(),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.produtos.length,
                  itemBuilder: (context, index) {
                    final produto = data.produtos[index];
                    return Row(
                      children: [
                        Expanded(
                          child: Text(
                            produto.nome,
                          ),
                        ),
                        Text(
                          '${produto.quantidade} x R\$ ${produto.preco}',
                        ),
                      ],
                    );
                  },
                ),
                const Divider(),
                Text(
                  'Total: R\$ ${data.total}',
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Erro ao carregar dados: ${snapshot.error}');
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
*/
