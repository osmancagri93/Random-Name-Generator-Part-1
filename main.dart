import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Rastgele İsim Üretme Programı'),
        ),
        body: Center(
          child: RastgeleKelimeler(),
        ),
      ),
    );
  }
}

class RastgeleKelimeler extends StatefulWidget {
  const RastgeleKelimeler({Key? key}) : super(key: key);

  @override
  State<RastgeleKelimeler> createState() => _buildSuggestionsState();
}

class _buildSuggestionsState extends State<RastgeleKelimeler> {
  @override
  Widget build(BuildContext context) {
    final _onerilenisimler = <WordPair>[];
    final _buyukFont = const TextStyle(fontSize: 18);
    final kelime_ikilisi = WordPair.random();
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return const Divider();

        final index = i ~/ 2;
        if (index >= _onerilenisimler.length) {
          _onerilenisimler.addAll(generateWordPairs().take(10));
        }
        return ListTile(
          title: Text(
            _onerilenisimler[index].asPascalCase,
            style: _buyukFont,
          ),
        );
      },
    );
  }
}
