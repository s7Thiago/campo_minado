import 'package:campo_minado/components/campo_widget.dart';
import 'package:campo_minado/components/resultado_widget.dart';
import 'package:campo_minado/components/tabuleiro_widget.dart';
import 'package:campo_minado/models/campo.dart';
import 'package:campo_minado/models/explosao_exception.dart';
import 'package:campo_minado/models/tabuleiro.dart';
import 'package:flutter/material.dart';

class CampoMinadoApp extends StatelessWidget {
  const CampoMinadoApp({Key? key}) : super(key: key);

  void _reiniciar() {
    print('reiniciar...');
  }

  void _abrir(Campo c) {
    print('abrir...');
  }

  void _alternarMarcacao(Campo c) {
    print('alternarMarcacao...');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWidget(venceu: true, onRestart: _reiniciar),
        body: Container(
          child: TabuleiroWidget(
            tabuleiro: Tabuleiro(linhas: 15, colunas: 15, qtdeBombas: 10),
            onOpen: _abrir,
            switchMarcacao: _alternarMarcacao,
          ),
        ),
      ),
    );
  }
}
