import 'package:flutter/material.dart';
import 'package:mineswipeer/models/campo.dart';

class CampoWidget extends StatelessWidget{

  final Campo campo;
  final Function(Campo) onAbrir;
  final Function(Campo) onAlternarMarcacao;

  CampoWidget({
    required this.campo,
    required this.onAbrir,
    required this.onAlternarMarcacao
  });

  Widget _getImage(){

    int qde_minas = campo.qtdeMinasNaVizinhanxa;
    
    if(campo.aberto && campo.minado && campo.explodido){
      return Image.asset('assets/images/bomba_0.jpeg'); 
    }else if (campo.aberto && campo.minado){
      return Image.asset('assets/images/bomba_1.jpeg'); 
    }else if (campo.aberto && qde_minas > 0){
      return Image.asset('assets/images/aberto_$qde_minas.jpeg'); 
    }else if (campo.marcado){
      return Image.asset('assets/images/bandeira.jpeg'); 
    }else{
      return Image.asset('assets/images/fechado.jpeg'); 
    }
  }
  
  @override
  Widget build(BuildContext context) {
    
    return InkWell(
      onTap: () => onAbrir(campo),     
      onLongPress: () => onAlternarMarcacao(campo),
      child: _getImage(),

    );
  }

  

}