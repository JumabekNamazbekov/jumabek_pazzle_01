import 'package:flutter/material.dart';

void main() {
  runApp( PuzzleGame());
}

class PuzzleGame extends StatelessWidget {
  const PuzzleGame({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Puzzle Game'),
        ),
        body: Center(
          child: PuzzleGrid(),
        ),
      ),
    );
  }
}

class PuzzleGrid extends StatefulWidget {
  @override
  _PuzzleGridState createState() => _PuzzleGridState();
}

class _PuzzleGridState extends State<PuzzleGrid> {
  late List<Widget> puzzlePieces;

  @override
  void initState() {
    super.initState();
    puzzlePieces = _generatePuzzlePieces();
  }

  List<Widget> _generatePuzzlePieces() {
    // Генерирование пазлей
    List<Widget> pieces = [];
    for (int i = 0; i < 9; i++) {
      pieces.add(Draggable<int>(
        data: i,
        child: Image.asset('assets/pazl.jpg'),
        feedback: Image.asset('assets/pazl.jpg'),
        childWhenDragging: Container(),
      ));
    }
    return pieces;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: puzzlePieces,
    );
  }
}