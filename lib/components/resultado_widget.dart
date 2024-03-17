import 'package:flutter/material.dart';

class ResultadoWidget extends StatelessWidget implements PreferredSizeWidget{

  final int venceu;
  final Function() onReiniciar;

   ResultadoWidget({ required  this.venceu, required  this.onReiniciar});

  Color _getCor(){

    if(venceu == 0){
      return Colors.yellow;
    }if(venceu == 1){
      return Colors.green;
    }else{
      return Colors.red;
    }
  }

  IconData _getIcon(){
    if(venceu == 0){
      return Icons.sentiment_satisfied;
    }if(venceu == 1){
      return Icons.sentiment_very_satisfied;
    }else{
      return Icons.sentiment_very_dissatisfied;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey ,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: CircleAvatar(
            backgroundColor: _getCor(),
            child: IconButton(
              padding: EdgeInsets.all(0),
              icon: Icon(_getIcon(), color: Colors.black, size: 35,),
              onPressed: onReiniciar,
            ),
          ),
        ),
      ),
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(120);

  

}