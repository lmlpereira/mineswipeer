import 'package:flutter/foundation.dart';
import 'explocao_exception.dart';


class Campo {

  final int linha;
  final int coluna;
  final List<Campo> vizinhos = [];
  
  bool _aberto = false;
  bool _fechado = false;
  bool _minado = false;
  bool _explodido = false;
  bool _marcado = false;


  Campo({
    required this.linha, 
    required this.coluna
  });
  

  void adicionarVizinho(Campo vizinho){
    final deltaLinha = (linha - vizinho.linha).abs();
    final deltaColuna = (coluna - vizinho.coluna).abs();

    if(deltaLinha == 0 && deltaColuna == 0){
      return; 
    }

    if(deltaLinha <= 1 && deltaColuna <= 1){
      vizinhos.add(vizinho);
    }
  }


  void abrir(){
    
    if(_aberto){
      return;
    }

    _aberto = true;

    if(_minado){
      _explodido =true;
      throw ExplosaoExecption();
    }

    if(vizinhancaSegura){
      vizinhos.forEach((element) { element.abrir();});
    }

  }

  void revelarBomba(){
    if(_minado){
      _aberto = true;
    }
  }

  bool get vizinhancaSegura {
      return vizinhos.every((element) => !element.minado);
  }

  bool get minado {
    return _minado;
  }

  bool get explodido {
    return _explodido;
  }

  bool get aberto {
    return _aberto;
  }

  bool get marcado {
    return _marcado;
  }

  bool get resolvido{
    bool minadoEMarcado = minado && marcado;
    bool seguroEAberto = !minado && aberto;

    return minadoEMarcado || seguroEAberto;
  }

  int get qtdeMinasNaVizinhanxa{
    return vizinhos.where((element) => element.minado).length;
  }

  void minar(){
    _minado = true;
  }

  void alterarMarcacao(){
    _marcado = !_marcado;
  }

  void reiniciar(){
    _aberto = false;
    _fechado = false;
    _minado = false;
    _explodido = false;
    _marcado = false;
  }



}