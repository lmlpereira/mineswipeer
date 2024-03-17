
import 'package:flutter/material.dart';
import 'package:mineswipeer/models/explocao_exception.dart';
import '../components/resultado_widget.dart';
import '../components/tabuleiro_widget.dart';
import '../models/campo.dart';
import '../models/tabuleiro.dart';

class CampoMinadoApp extends StatefulWidget {
  const CampoMinadoApp({super.key});

  @override
  State<CampoMinadoApp> createState() => _CampoMinadoAppState();
}

class _CampoMinadoAppState extends State<CampoMinadoApp> {
  bool? _venceu;
  
  /*final Tabuleiro _tabuleiro = Tabuleiro(
    linhas: 12,
    colunas: 12,
    qtdeBombas: 3,
  );*/

  
  
  Tabuleiro? _tabuleiro;
  
  Tabuleiro _getTabuleiro(double largura, double altura){

    if(_tabuleiro == null){
      
      int qtdeColunas = 15;
      double tamanhoCampo = largura / qtdeColunas;
      int qtdeLinhas = (altura / tamanhoCampo).floor();

      _tabuleiro = Tabuleiro(linhas: qtdeLinhas, colunas: qtdeColunas, qtdeBombas: 50);

      return _tabuleiro!;

    }else{
      return _tabuleiro!;
    }

  }


  void _reiniciar() {
    setState(() {
      _venceu = null;
      _tabuleiro?.reiniciar();
    });
  }

  void _abrir(Campo campo) {
    if (_venceu != null) {
      return;
    }

    setState(() {
      try {
        campo.abrir();
        if (_tabuleiro!.resolvido) {
          _venceu = true;
        }
      } on ExplosaoExecption {
        _venceu = false;
        _tabuleiro?.revelarBombas();
      }
    });
  }

  void _alternarMarcacao(Campo campo) {
    if (_venceu != null) {
      return;
    }

    setState(() {
      campo.alternarMarcacao();
      if (_tabuleiro!.resolvido) {
        _venceu = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWidget(
          venceu: _venceu,
          onReiniciar: _reiniciar,
        ),
        body: LayoutBuilder(
          builder: (context, constraint) {
            return TabuleiroWidget(
              tabuleiro: _getTabuleiro(constraint.maxWidth, constraint.maxHeight),
              onAbrir: _abrir,
              onAlternarMarcacao: _alternarMarcacao,
            );
          }
        ),
      ),
    );
  }
}
