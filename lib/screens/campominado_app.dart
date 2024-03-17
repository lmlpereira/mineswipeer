import 'package:flutter/material.dart';
import 'package:mineswipeer/components/campo_widget.dart';
import 'package:mineswipeer/components/resultado_widget.dart';
import 'package:mineswipeer/models/campo.dart';
import 'package:mineswipeer/models/explocao_exception.dart';

class CampoMinadoApp extends StatelessWidget{


  _reiniciar(){
    print('Reinicia ... ');
  }
  
  void _abrir(Campo campo){
    print('Abrir ... ');
  }

  void _alternarMarcacao(Campo campo){
    print('Alternar Marcacao ... ');
  }
  @override
  Widget build(BuildContext context) {
    Campo vizinho1 = Campo(linha: 1,coluna: 0);
    vizinho1.minar();

    Campo vizinho2 = Campo(linha: 1,coluna: 1);
    vizinho2.minar();

    Campo c1 = Campo(linha: 0, coluna: 0);
    c1.adicionarVizinho(vizinho1);
    c1.adicionarVizinho(vizinho2);

    try{

      //c1.minar();
      //c1.abrir();
      c1.alterarMarcacao();
    }on ExplosaoExecption {}
    
    return MaterialApp(
      home: Scaffold(
      appBar: ResultadoWidget(venceu: 0, onReiniciar: _reiniciar ),
      body: Container(
        child: CampoWidget(campo: c1,
        onAbrir: _abrir,
        onAlternarMarcacao: _alternarMarcacao),
      ),
      )
       
    );
  }


  
}