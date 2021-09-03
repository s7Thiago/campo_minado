import 'package:campo_minado/components/campo_widget.dart';
import 'package:campo_minado/components/resultado_widget.dart';
import 'package:campo_minado/components/tabuleiro_widget.dart';
import 'package:campo_minado/models/campo.dart';
import 'package:campo_minado/models/explosao_exception.dart';
import 'package:campo_minado/models/tabuleiro.dart';
import 'package:flutter/material.dart';

class CampoMinadoApp extends StatefulWidget {
  const CampoMinadoApp({Key? key}) : super(key: key);

  @override
  State<CampoMinadoApp> createState() => _CampoMinadoAppState();
}

class _CampoMinadoAppState extends State<CampoMinadoApp> {
  bool? _venceu;
  Tabuleiro _tabuleiro = Tabuleiro(
    linhas: 12,
    colunas: 12,
    qtdeBombas: 3,
  );

  void _reiniciar() {
    print('reiniciar...');
  }

  void _abrir(Campo c) {
    print('(${c.linha}, ${c.coluna}) => abrir...');
  }

  void _alternarMarcacao(Campo c) {
    print('(${c.linha}, ${c.coluna}) => alternar marcação...');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWidget(venceu: _venceu, onRestart: _reiniciar),
        body: Container(
          child: TabuleiroWidget(
            tabuleiro: _tabuleiro,
            onOpen: _abrir,
            switchMarcacao: _alternarMarcacao,
          ),
        ),
      ),
    );
  }
}
