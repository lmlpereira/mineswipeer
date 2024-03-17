import 'package:flutter/widgets.dart';
import 'package:mineswipeer/components/campo_widget.dart';
import 'package:mineswipeer/models/campo.dart';
import 'package:mineswipeer/models/tabuleiro.dart';

class TabuleiroWidget extends StatelessWidget{

  final Tabuleiro tabuleiro;
  final Function(Campo) onAbrir;
  final Function(Campo) onAlternarMarcacao;

  TabuleiroWidget({
    required this.tabuleiro,
    required this.onAbrir,
    required this.onAlternarMarcacao,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: tabuleiro.colunas,
        children: tabuleiro.campos.map((e) {
          return CampoWidget(
            campo: e, 
          onAbrir: onAbrir, 
          onAlternarMarcacao: onAlternarMarcacao);
        }).toList(),));
  }

  
}