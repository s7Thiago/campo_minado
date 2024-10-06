import 'package:campo_minado/models/tabuleiro.dart';
import 'package:flutter/material.dart';

class ResultadoWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool? venceu;
  final Function() onRestart;
  final Tabuleiro? tabuleiro;

  const ResultadoWidget({
    Key? key,
    this.venceu,
    required this.onRestart,
    required this.tabuleiro,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(120);

  _getColor() {
    if (venceu == null) {
      return Colors.white;
    } else if (venceu!) {
      return Colors.green;
    } else {
      return Colors.red[300];
    }
  }

    _getBackgroundColor() {
    if (venceu == null) {
      return Colors.grey;
    } else if (venceu!) {
      return Colors.green[700];
    } else {
      return Colors.red[300];
    }
  }

  _getIcon() {
    if (venceu == null) {
      return Icons.sentiment_satisfied;
    } else if (venceu!) {
      return Icons.sentiment_very_satisfied;
    } else {
      return Icons.sentiment_very_dissatisfied;
    }
  }

  _buildButton() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: CircleAvatar(
        backgroundColor: _getColor(),
        maxRadius: 45,
        child: IconButton(
          onPressed: onRestart,
          padding: const EdgeInsets.all(0),
          icon: Icon(
            _getIcon(),
            color: Colors.black,
            size: 70,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    // se o tabuleiro estiver null, então é zero
    int _qtdeBombas = tabuleiro?.qtdeBombas ?? 0;
    int _qtdeMarcadas = tabuleiro?.campos.where((c) => c.marcado).length ?? 0;

    return Container(
      color: _getBackgroundColor(),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton(),
            Text(
              '$_qtdeMarcadas / $_qtdeBombas',
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(venceu??false ? Icons.check : Icons.cancel, size: 50,)
          ],
        ),
      ),
    );
  }
}
